#include "Datas/Datas.h"

#include <QDir>
#include <QFile>
#include <QJsonDocument>
#include <QSaveFile>
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QStandardPaths>
#include <QUuid>
#include <QUrl>

namespace {

QString dateToString(const QDateTime &dateTime)
{
    const QDateTime value = dateTime.isValid() ? dateTime : QDateTime::currentDateTimeUtc();
    return value.toUTC().toString(Qt::ISODateWithMs);
}

QDateTime dateFromString(const QString &value)
{
    QDateTime dateTime = QDateTime::fromString(value, Qt::ISODateWithMs);
    if (!dateTime.isValid())
        dateTime = QDateTime::fromString(value, Qt::ISODate);
    if (!dateTime.isValid())
        dateTime = QDateTime::currentDateTimeUtc();
    return dateTime;
}

QString jsonObjectToString(const QJsonObject &object)
{
    return QString::fromUtf8(QJsonDocument(object).toJson(QJsonDocument::Compact));
}

QString jsonArrayToString(const QJsonArray &array)
{
    return QString::fromUtf8(QJsonDocument(array).toJson(QJsonDocument::Compact));
}

QJsonObject jsonObjectFromString(const QString &value)
{
    const QJsonDocument document = QJsonDocument::fromJson(value.toUtf8());
    return document.isObject() ? document.object() : QJsonObject {};
}

QJsonArray jsonArrayFromString(const QString &value)
{
    const QJsonDocument document = QJsonDocument::fromJson(value.toUtf8());
    return document.isArray() ? document.array() : QJsonArray {};
}

QStringList jsonArrayToStringList(const QJsonArray &array)
{
    QStringList result;
    result.reserve(array.size());
    for (const QJsonValue &value : array)
        result.append(value.toString());
    return result;
}

QString normalizedLoginType(QString type)
{
    type = type.trimmed().toLower();
    return type == "webview" ? "webview" : "api";
}

QString normalizedMethod(QString method)
{
    method = method.trimmed().toUpper();
    if (method == "GET" || method == "PUT")
        return method;
    return "POST";
}

QString normalizedStatus(QString status)
{
    status = status.trimmed().toLower();
    if (status == "logged_in" || status == "logging_in" || status == "failed")
        return status;
    return "not_logged_in";
}

QString hostFromUrl(const QString &url)
{
    const QUrl parsed(url);
    if (!parsed.host().isEmpty())
        return parsed.host();
    return url;
}

} // namespace

namespace Datas {

class Datas::SqlState {
public:
    QString connectionName;
    QSqlDatabase database;
};

QString LoginConfig::displayName() const
{
    if (!remark.trimmed().isEmpty())
        return remark.trimmed();

    if (type == "webview" && !urls.isEmpty())
        return hostFromUrl(urls.first());

    if (!url.trimmed().isEmpty())
        return hostFromUrl(url);

    return QStringLiteral("未命名站点");
}

QJsonObject LoginConfig::toJson() const
{
    return {
        {"id", id},
        {"type", normalizedLoginType(type)},
        {"url", url},
        {"method", normalizedMethod(method)},
        {"args", args},
        {"headers", headers},
        {"urls", QJsonArray::fromStringList(urls)},
        {"operations", operations},
        {"networkCard", networkCard},
        {"remark", remark},
        {"status", normalizedStatus(status)},
        {"enabled", enabled},
        {"updatedAt", dateToString(updatedAt)}
    };
}

QVariantMap LoginConfig::toVariantMap() const
{
    QVariantMap map = toJson().toVariantMap();
    map.insert("name", displayName());
    map.insert("typeLabel", type == "webview" ? "WebView" : "API");
    map.insert("statusLabel", status == "logged_in" ? "已登录" : (status == "logging_in" ? "登录中" : "未登录"));
    map.insert("statusOk", status == "logged_in");
    map.insert("updatedAtText", updatedAt.toLocalTime().toString("yyyy-MM-dd hh:mm"));
    return map;
}

LoginConfig LoginConfig::fromJson(const QJsonObject &object)
{
    LoginConfig config;
    config.id = object.value("id").toString();
    config.type = normalizedLoginType(object.value("type").toString("api"));
    config.url = object.value("url").toString();
    config.method = normalizedMethod(object.value("method").toString("POST"));
    config.args = object.value("args").toObject();
    config.headers = object.value("headers").toObject();
    config.urls = jsonArrayToStringList(object.value("urls").toArray());

    const QJsonValue operations = object.value("operations");
    if (operations.isArray()) {
        config.operations = operations.toArray();
    } else if (operations.isObject()) {
        const QJsonObject operationObject = operations.toObject();
        for (auto urlIt = operationObject.constBegin(); urlIt != operationObject.constEnd(); ++urlIt) {
            const QJsonObject byXPath = urlIt.value().toObject();
            for (auto xpathIt = byXPath.constBegin(); xpathIt != byXPath.constEnd(); ++xpathIt) {
                QJsonObject step = xpathIt.value().toObject();
                step.insert("url", urlIt.key());
                step.insert("xpath", xpathIt.key());
                config.operations.append(step);
            }
        }
    }

    config.networkCard = object.value("networkCard").toString();
    config.remark = object.value("remark").toString();
    config.status = normalizedStatus(object.value("status").toString("not_logged_in"));
    config.enabled = object.value("enabled").toBool(true);
    config.updatedAt = dateFromString(object.value("updatedAt").toString());
    return config;
}

QJsonObject NetworkCard::toJson() const
{
    return {
        {"interfaceName", interfaceName},
        {"ipAddress", ipAddress},
        {"subnetMask", subnetMask},
        {"gateway", gateway},
        {"dns", QJsonArray::fromStringList(dns)},
        {"macAddress", macAddress},
        {"isConnected", isConnected},
        {"type", type == "wireless" ? "wireless" : "wired"}
    };
}

QVariantMap NetworkCard::toVariantMap() const
{
    QVariantMap map = toJson().toVariantMap();
    map.insert("name", interfaceName);
    map.insert("ip", ipAddress.isEmpty() ? "-" : ipAddress);
    map.insert("cardType", type == "wireless" ? "无线" : "有线");
    map.insert("connected", isConnected);
    map.insert("available", isConnected && !ipAddress.isEmpty());
    map.insert("dnsText", dns.join(", "));
    return map;
}

NetworkCard NetworkCard::fromJson(const QJsonObject &object)
{
    NetworkCard card;
    card.interfaceName = object.value("interfaceName").toString();
    card.ipAddress = object.value("ipAddress").toString();
    card.subnetMask = object.value("subnetMask").toString();
    card.gateway = object.value("gateway").toString();
    card.dns = jsonArrayToStringList(object.value("dns").toArray());
    card.macAddress = object.value("macAddress").toString();
    card.isConnected = object.value("isConnected").toBool(false);
    card.type = object.value("type").toString("wired") == "wireless" ? "wireless" : "wired";
    return card;
}

QJsonObject NetworkStatus::toJson() const
{
    return {
        {"isOnline", isOnline},
        {"primaryIP", primaryIP},
        {"lastChecked", dateToString(lastChecked)}
    };
}

QVariantMap NetworkStatus::toVariantMap() const
{
    QVariantMap map = toJson().toVariantMap();
    map.insert("stateText", isOnline ? "已连接" : "未连接");
    map.insert("lastCheckedText", lastChecked.toLocalTime().toString("yyyy-MM-dd hh:mm:ss"));
    return map;
}

NetworkStatus NetworkStatus::fromJson(const QJsonObject &object)
{
    NetworkStatus status;
    status.isOnline = object.value("isOnline").toBool(false);
    status.primaryIP = object.value("primaryIP").toString();
    status.lastChecked = dateFromString(object.value("lastChecked").toString());
    return status;
}

QJsonObject Settings::toJson() const
{
    return {
        {"autoStart", autoStart},
        {"autoLogin", autoLogin},
        {"minimizeToTray", minimizeToTray},
        {"logDirectory", logDirectory},
        {"dataDirectory", dataDirectory},
        {"theme", theme},
        {"language", language}
    };
}

QVariantMap Settings::toVariantMap() const
{
    return toJson().toVariantMap();
}

Settings Settings::fromJson(const QJsonObject &object)
{
    Settings settings;
    settings.autoStart = object.value("autoStart").toBool(settings.autoStart);
    settings.autoLogin = object.value("autoLogin").toBool(settings.autoLogin);
    settings.minimizeToTray = object.value("minimizeToTray").toBool(settings.minimizeToTray);
    settings.logDirectory = object.value("logDirectory").toString(settings.logDirectory);
    settings.dataDirectory = object.value("dataDirectory").toString(settings.dataDirectory);
    settings.theme = object.value("theme").toString(settings.theme);
    settings.language = object.value("language").toString(settings.language);

    if (settings.theme != "light" && settings.theme != "dark" && settings.theme != "system")
        settings.theme = "light";
    if (settings.language != "zh" && settings.language != "en")
        settings.language = "zh";

    return settings;
}

Datas::Datas(QObject *parent)
    : QObject(parent)
{
}

Datas::~Datas()
{
    if (!m_sql)
        return;

    const QString connectionName = m_sql->connectionName;
    m_sql->database.close();
    m_sql.reset();
    QSqlDatabase::removeDatabase(connectionName);
}

bool Datas::initialize(const QString &dataDir)
{
    if (m_sql)
        return true;

    QString resolvedDir = dataDir;
    if (resolvedDir.trimmed().isEmpty())
        resolvedDir = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
    if (resolvedDir.trimmed().isEmpty())
        resolvedDir = QDir::current().absoluteFilePath("data");

    QDir dir(resolvedDir);
    if (!dir.exists() && !dir.mkpath(".")) {
        setLastError(QStringLiteral("Unable to create data directory: %1").arg(resolvedDir));
        return false;
    }

    m_dataDir = dir.absolutePath();
    m_settingsPath = dir.absoluteFilePath("settings.json");
    m_sql = std::make_unique<SqlState>();
    m_sql->connectionName = QStringLiteral("autologin_%1").arg(QUuid::createUuid().toString(QUuid::Id128));
    m_sql->database = QSqlDatabase::addDatabase("QSQLITE", m_sql->connectionName);
    m_sql->database.setDatabaseName(dir.absoluteFilePath("autologin.sqlite"));

    if (!m_sql->database.open()) {
        setLastError(m_sql->database.lastError().text());
        return false;
    }

    if (!createTables())
        return false;

    if (!loadSettings())
        return false;

    NetworkStatus status = getNetworkStatus();
    if (!status.lastChecked.isValid())
        updateNetworkStatus(NetworkStatus {});

    return true;
}

bool Datas::isInitialized() const
{
    return m_sql && m_sql->database.isOpen();
}

QString Datas::dataDirectory() const
{
    return m_dataDir;
}

QString Datas::lastError() const
{
    return m_lastError;
}

QList<LoginConfig> Datas::getLoginConfigList() const
{
    QList<LoginConfig> configs;
    if (!isInitialized())
        return configs;

    QSqlQuery query(m_sql->database);
    if (!query.exec("SELECT id, type, url, method, args_json, headers_json, urls_json, operations_json, "
                    "network_card, remark, status, enabled, updated_at "
                    "FROM login_configs ORDER BY updated_at DESC")) {
        setLastError(query.lastError().text());
        return configs;
    }

    while (query.next()) {
        QJsonObject object;
        object.insert("id", query.value(0).toString());
        object.insert("type", query.value(1).toString());
        object.insert("url", query.value(2).toString());
        object.insert("method", query.value(3).toString());
        object.insert("args", jsonObjectFromString(query.value(4).toString()));
        object.insert("headers", jsonObjectFromString(query.value(5).toString()));
        object.insert("urls", jsonArrayFromString(query.value(6).toString()));
        object.insert("operations", jsonArrayFromString(query.value(7).toString()));
        object.insert("networkCard", query.value(8).toString());
        object.insert("remark", query.value(9).toString());
        object.insert("status", query.value(10).toString());
        object.insert("enabled", query.value(11).toBool());
        object.insert("updatedAt", query.value(12).toString());
        configs.append(LoginConfig::fromJson(object));
    }

    return configs;
}

LoginConfig Datas::getLoginConfig(const QString &id) const
{
    if (!isInitialized() || id.trimmed().isEmpty())
        return {};

    QSqlQuery query(m_sql->database);
    query.prepare("SELECT id, type, url, method, args_json, headers_json, urls_json, operations_json, "
                  "network_card, remark, status, enabled, updated_at "
                  "FROM login_configs WHERE id = ?");
    query.addBindValue(id);

    if (!query.exec()) {
        setLastError(query.lastError().text());
        return {};
    }

    if (!query.next())
        return {};

    QJsonObject object;
    object.insert("id", query.value(0).toString());
    object.insert("type", query.value(1).toString());
    object.insert("url", query.value(2).toString());
    object.insert("method", query.value(3).toString());
    object.insert("args", jsonObjectFromString(query.value(4).toString()));
    object.insert("headers", jsonObjectFromString(query.value(5).toString()));
    object.insert("urls", jsonArrayFromString(query.value(6).toString()));
    object.insert("operations", jsonArrayFromString(query.value(7).toString()));
    object.insert("networkCard", query.value(8).toString());
    object.insert("remark", query.value(9).toString());
    object.insert("status", query.value(10).toString());
    object.insert("enabled", query.value(11).toBool());
    object.insert("updatedAt", query.value(12).toString());
    return LoginConfig::fromJson(object);
}

bool Datas::saveLoginConfig(LoginConfig config)
{
    if (!isInitialized())
        return false;

    if (config.id.trimmed().isEmpty())
        config.id = QUuid::createUuid().toString(QUuid::WithoutBraces);

    config.type = normalizedLoginType(config.type);
    config.method = normalizedMethod(config.method);
    config.status = normalizedStatus(config.status);
    config.updatedAt = QDateTime::currentDateTimeUtc();

    QSqlQuery query(m_sql->database);
    query.prepare("INSERT OR REPLACE INTO login_configs "
                  "(id, type, url, method, args_json, headers_json, urls_json, operations_json, "
                  "network_card, remark, status, enabled, updated_at) "
                  "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    query.addBindValue(config.id);
    query.addBindValue(config.type);
    query.addBindValue(config.url);
    query.addBindValue(config.method);
    query.addBindValue(jsonObjectToString(config.args));
    query.addBindValue(jsonObjectToString(config.headers));
    query.addBindValue(jsonArrayToString(QJsonArray::fromStringList(config.urls)));
    query.addBindValue(jsonArrayToString(config.operations));
    query.addBindValue(config.networkCard);
    query.addBindValue(config.remark);
    query.addBindValue(config.status);
    query.addBindValue(config.enabled ? 1 : 0);
    query.addBindValue(dateToString(config.updatedAt));

    if (!query.exec()) {
        setLastError(query.lastError().text());
        return false;
    }

    emit loginConfigChanged(config.id);
    emit loginConfigListChanged();
    return true;
}

bool Datas::deleteLoginConfig(const QString &id)
{
    if (!isInitialized())
        return false;

    QSqlQuery query(m_sql->database);
    query.prepare("DELETE FROM login_configs WHERE id = ?");
    query.addBindValue(id);

    if (!query.exec()) {
        setLastError(query.lastError().text());
        return false;
    }

    emit loginConfigChanged(id);
    emit loginConfigListChanged();
    return true;
}

bool Datas::updateLoginConfigStatus(const QString &id, const QString &status)
{
    if (!isInitialized())
        return false;

    QSqlQuery query(m_sql->database);
    query.prepare("UPDATE login_configs SET status = ?, updated_at = ? WHERE id = ?");
    query.addBindValue(normalizedStatus(status));
    query.addBindValue(dateToString(QDateTime::currentDateTimeUtc()));
    query.addBindValue(id);

    if (!query.exec()) {
        setLastError(query.lastError().text());
        return false;
    }

    emit loginConfigChanged(id);
    emit loginConfigListChanged();
    return true;
}

bool Datas::setLoginConfigEnabled(const QString &id, bool enabled)
{
    if (!isInitialized())
        return false;

    QSqlQuery query(m_sql->database);
    query.prepare("UPDATE login_configs SET enabled = ?, updated_at = ? WHERE id = ?");
    query.addBindValue(enabled ? 1 : 0);
    query.addBindValue(dateToString(QDateTime::currentDateTimeUtc()));
    query.addBindValue(id);

    if (!query.exec()) {
        setLastError(query.lastError().text());
        return false;
    }

    emit loginConfigChanged(id);
    emit loginConfigListChanged();
    return true;
}

QList<NetworkCard> Datas::getNetworkCardList() const
{
    QList<NetworkCard> cards;
    if (!isInitialized())
        return cards;

    QSqlQuery query(m_sql->database);
    if (!query.exec("SELECT interface_name, ip_address, subnet_mask, gateway, dns_json, mac_address, "
                    "is_connected, type FROM network_cards ORDER BY is_connected DESC, interface_name ASC")) {
        setLastError(query.lastError().text());
        return cards;
    }

    while (query.next()) {
        QJsonObject object;
        object.insert("interfaceName", query.value(0).toString());
        object.insert("ipAddress", query.value(1).toString());
        object.insert("subnetMask", query.value(2).toString());
        object.insert("gateway", query.value(3).toString());
        object.insert("dns", jsonArrayFromString(query.value(4).toString()));
        object.insert("macAddress", query.value(5).toString());
        object.insert("isConnected", query.value(6).toBool());
        object.insert("type", query.value(7).toString());
        cards.append(NetworkCard::fromJson(object));
    }

    return cards;
}

bool Datas::updateNetworkCardList(const QList<NetworkCard> &cards)
{
    if (!isInitialized())
        return false;

    if (!m_sql->database.transaction()) {
        setLastError(m_sql->database.lastError().text());
        return false;
    }

    QSqlQuery cleanup(m_sql->database);
    if (!cleanup.exec("DELETE FROM network_cards")) {
        setLastError(cleanup.lastError().text());
        m_sql->database.rollback();
        return false;
    }

    for (const NetworkCard &card : cards) {
        QSqlQuery query(m_sql->database);
        query.prepare("INSERT INTO network_cards "
                      "(interface_name, ip_address, subnet_mask, gateway, dns_json, mac_address, is_connected, type) "
                      "VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
        query.addBindValue(card.interfaceName);
        query.addBindValue(card.ipAddress);
        query.addBindValue(card.subnetMask);
        query.addBindValue(card.gateway);
        query.addBindValue(jsonArrayToString(QJsonArray::fromStringList(card.dns)));
        query.addBindValue(card.macAddress);
        query.addBindValue(card.isConnected ? 1 : 0);
        query.addBindValue(card.type == "wireless" ? "wireless" : "wired");

        if (!query.exec()) {
            setLastError(query.lastError().text());
            m_sql->database.rollback();
            return false;
        }
    }

    if (!m_sql->database.commit()) {
        setLastError(m_sql->database.lastError().text());
        return false;
    }

    emit networkCardListChanged();
    return true;
}

NetworkStatus Datas::getNetworkStatus() const
{
    if (!isInitialized())
        return {};

    QSqlQuery query(m_sql->database);
    if (!query.exec("SELECT is_online, primary_ip, last_checked FROM network_status WHERE id = 1")) {
        setLastError(query.lastError().text());
        return {};
    }

    if (!query.next())
        return {};

    QJsonObject object;
    object.insert("isOnline", query.value(0).toBool());
    object.insert("primaryIP", query.value(1).toString());
    object.insert("lastChecked", query.value(2).toString());
    return NetworkStatus::fromJson(object);
}

bool Datas::updateNetworkStatus(const NetworkStatus &status)
{
    if (!isInitialized())
        return false;

    QSqlQuery query(m_sql->database);
    query.prepare("INSERT OR REPLACE INTO network_status (id, is_online, primary_ip, last_checked) "
                  "VALUES (1, ?, ?, ?)");
    query.addBindValue(status.isOnline ? 1 : 0);
    query.addBindValue(status.primaryIP);
    query.addBindValue(dateToString(status.lastChecked));

    if (!query.exec()) {
        setLastError(query.lastError().text());
        return false;
    }

    emit networkStatusChanged();
    return true;
}

Settings Datas::getSettings() const
{
    return m_settings;
}

bool Datas::saveSettings(const Settings &settings)
{
    m_settings = settings;
    if (!saveSettingsFile())
        return false;

    emit settingsChanged();
    return true;
}

bool Datas::exportData(const QString &filePath) const
{
    QJsonArray configs;
    for (const LoginConfig &config : getLoginConfigList())
        configs.append(config.toJson());

    QJsonArray cards;
    for (const NetworkCard &card : getNetworkCardList())
        cards.append(card.toJson());

    QJsonObject root {
        {"version", 1},
        {"exportedAt", dateToString(QDateTime::currentDateTimeUtc())},
        {"loginConfigs", configs},
        {"networkCards", cards},
        {"networkStatus", getNetworkStatus().toJson()},
        {"settings", getSettings().toJson()}
    };

    QSaveFile file(filePath);
    if (!file.open(QIODevice::WriteOnly | QIODevice::Truncate)) {
        setLastError(file.errorString());
        return false;
    }

    file.write(QJsonDocument(root).toJson(QJsonDocument::Indented));
    if (!file.commit()) {
        setLastError(file.errorString());
        return false;
    }

    return true;
}

bool Datas::importData(const QString &filePath)
{
    QFile file(filePath);
    if (!file.open(QIODevice::ReadOnly)) {
        setLastError(file.errorString());
        return false;
    }

    const QJsonDocument document = QJsonDocument::fromJson(file.readAll());
    if (!document.isObject()) {
        setLastError(QStringLiteral("Invalid JSON document"));
        return false;
    }

    const QJsonObject root = document.object();
    QSqlQuery cleanup(m_sql->database);
    if (!cleanup.exec("DELETE FROM login_configs") || !cleanup.exec("DELETE FROM network_cards")) {
        setLastError(cleanup.lastError().text());
        return false;
    }

    for (const QJsonValue &value : root.value("loginConfigs").toArray()) {
        if (!saveLoginConfig(LoginConfig::fromJson(value.toObject())))
            return false;
    }

    QList<NetworkCard> cards;
    for (const QJsonValue &value : root.value("networkCards").toArray())
        cards.append(NetworkCard::fromJson(value.toObject()));

    if (!updateNetworkCardList(cards))
        return false;

    if (root.value("networkStatus").isObject())
        updateNetworkStatus(NetworkStatus::fromJson(root.value("networkStatus").toObject()));

    if (root.value("settings").isObject())
        m_settings = Settings::fromJson(root.value("settings").toObject());

    saveSettingsFile();
    emit loginConfigListChanged();
    emit networkCardListChanged();
    emit networkStatusChanged();
    emit settingsChanged();
    return true;
}

bool Datas::createTables()
{
    QSqlQuery query(m_sql->database);

    const QStringList statements {
        "CREATE TABLE IF NOT EXISTS login_configs ("
        "id TEXT PRIMARY KEY,"
        "type TEXT NOT NULL,"
        "url TEXT,"
        "method TEXT,"
        "args_json TEXT,"
        "headers_json TEXT,"
        "urls_json TEXT,"
        "operations_json TEXT,"
        "network_card TEXT,"
        "remark TEXT,"
        "status TEXT,"
        "enabled INTEGER,"
        "updated_at TEXT"
        ")",

        "CREATE TABLE IF NOT EXISTS network_cards ("
        "interface_name TEXT,"
        "ip_address TEXT,"
        "subnet_mask TEXT,"
        "gateway TEXT,"
        "dns_json TEXT,"
        "mac_address TEXT,"
        "is_connected INTEGER,"
        "type TEXT"
        ")",

        "CREATE TABLE IF NOT EXISTS network_status ("
        "id INTEGER PRIMARY KEY CHECK (id = 1),"
        "is_online INTEGER,"
        "primary_ip TEXT,"
        "last_checked TEXT"
        ")"
    };

    for (const QString &statement : statements) {
        if (!query.exec(statement)) {
            setLastError(query.lastError().text());
            return false;
        }
    }

    return true;
}

bool Datas::loadSettings()
{
    QFile file(m_settingsPath);
    if (!file.exists())
        return saveSettingsFile();

    if (!file.open(QIODevice::ReadOnly)) {
        setLastError(file.errorString());
        return false;
    }

    const QJsonDocument document = QJsonDocument::fromJson(file.readAll());
    if (!document.isObject()) {
        m_settings = Settings {};
        return saveSettingsFile();
    }

    m_settings = Settings::fromJson(document.object());
    return true;
}

bool Datas::saveSettingsFile() const
{
    QDir dir(m_dataDir);
    if (!dir.exists() && !dir.mkpath(".")) {
        setLastError(QStringLiteral("Unable to create settings directory: %1").arg(m_dataDir));
        return false;
    }

    QSaveFile file(m_settingsPath);
    if (!file.open(QIODevice::WriteOnly | QIODevice::Truncate)) {
        setLastError(file.errorString());
        return false;
    }

    file.write(QJsonDocument(m_settings.toJson()).toJson(QJsonDocument::Indented));
    if (!file.commit()) {
        setLastError(file.errorString());
        return false;
    }

    return true;
}

void Datas::setLastError(const QString &message) const
{
    m_lastError = message;
}

} // namespace Datas
