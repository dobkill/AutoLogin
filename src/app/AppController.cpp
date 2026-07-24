#include "app/AppController.h"

#include <QCoreApplication>
#include <QDesktopServices>
#include <QDir>
#include <QFile>
#include <QFileInfo>
#include <QJsonObject>
#include <QJsonValue>
#include <QSaveFile>
#include <QSettings>
#include <QStandardPaths>
#include <QTextStream>
#include <QUrl>

namespace {

QString absolutePathForSetting(const QString &path)
{
    if (path.trimmed().isEmpty())
        return {};

    const QFileInfo info(path);
    return info.isAbsolute() ? info.absoluteFilePath() : QDir::current().absoluteFilePath(path);
}

QString configStatusLabel(const QString &status)
{
    if (status == "logged_in")
        return QStringLiteral("已登录");
    if (status == "logging_in")
        return QStringLiteral("登录中");
    if (status == "failed")
        return QStringLiteral("失败");
    return QStringLiteral("未登录");
}

QString configTypeLabel(const QString &type)
{
    return type == "webview" ? QStringLiteral("WebView") : QStringLiteral("API");
}

QJsonObject variantMapToJsonObject(const QVariantMap &map)
{
    QJsonObject object;
    for (auto it = map.constBegin(); it != map.constEnd(); ++it)
        object.insert(it.key(), QJsonValue::fromVariant(it.value()));
    return object;
}

} // namespace

AppController::AppController(QObject *parent)
    : QObject(parent)
    , m_datas(std::make_unique<Datas::Datas>())
    , m_networkService(std::make_unique<Network::NetworkService>(m_datas.get()))
    , m_loginEngine(std::make_unique<Login::LoginEngine>(m_datas.get(), m_networkService.get()))
{
    wireSignals();
}

AppController::~AppController() = default;

bool AppController::initialize(const QString &dataDir)
{
    if (!m_datas->initialize(dataDir)) {
        m_lastMessage = m_datas->lastError();
        emit lastMessageChanged();
        emit operationFinished(m_lastMessage, false);
        return false;
    }

    m_networkService->scanNetworkCards();
    m_networkService->startMonitoring(30000);

    const Datas::Settings currentSettings = m_datas->getSettings();
    m_loginEngine->setAutoLogin(currentSettings.autoLogin);

    emitDataChanged();
    return true;
}

Login::LoginEngine *AppController::loginEngine() const
{
    return m_loginEngine.get();
}

bool AppController::busy() const
{
    return m_loginEngine->busy();
}

QString AppController::lastMessage() const
{
    if (!m_loginEngine->lastMessage().isEmpty())
        return m_loginEngine->lastMessage();
    return m_lastMessage;
}

QString AppController::primaryNetworkLabel() const
{
    const Datas::NetworkStatus status = m_datas->getNetworkStatus();
    if (!status.isOnline)
        return QStringLiteral("网络未连接");

    return networkLabelForIp(status.primaryIP);
}

QVariantList AppController::loginConfigs() const
{
    QVariantList list;
    const QList<Datas::LoginConfig> configs = m_datas->getLoginConfigList();
    list.reserve(configs.size());
    for (const Datas::LoginConfig &config : configs)
        list.append(enrichConfig(config));
    return list;
}

QVariantList AppController::networkCards() const
{
    QVariantList list;
    const QList<Datas::NetworkCard> cards = m_datas->getNetworkCardList();
    const QList<Datas::LoginConfig> configs = m_datas->getLoginConfigList();
    const Datas::NetworkStatus status = m_datas->getNetworkStatus();

    for (const Datas::NetworkCard &card : cards) {
        QVariantMap map = card.toVariantMap();
        int boundCount = 0;
        for (const Datas::LoginConfig &config : configs) {
            if (!card.ipAddress.isEmpty() && config.networkCard == card.ipAddress)
                ++boundCount;
        }
        map.insert("boundCount", boundCount);
        map.insert("boundText", boundCount > 0 ? QStringLiteral("%1 个站点").arg(boundCount) : QStringLiteral("未绑定"));
        map.insert("isDefault", !card.ipAddress.isEmpty() && card.ipAddress == status.primaryIP);
        list.append(map);
    }

    return list;
}

QVariantMap AppController::networkStatus() const
{
    return m_datas->getNetworkStatus().toVariantMap();
}

QVariantMap AppController::settings() const
{
    return m_datas->getSettings().toVariantMap();
}

QVariantMap AppController::summary() const
{
    const QList<Datas::LoginConfig> configs = m_datas->getLoginConfigList();
    const Datas::NetworkStatus status = m_datas->getNetworkStatus();
    const Datas::Settings appSettings = m_datas->getSettings();

    int enabledCount = 0;
    int loggedInCount = 0;
    int apiCount = 0;
    int webViewCount = 0;
    QString currentSite = QStringLiteral("-");
    QString currentType = QStringLiteral("-");

    for (const Datas::LoginConfig &config : configs) {
        if (config.enabled) {
            ++enabledCount;
            if (currentSite == "-") {
                currentSite = config.displayName();
                currentType = configTypeLabel(config.type);
            }
        }
        if (config.status == "logged_in")
            ++loggedInCount;
        if (config.type == "webview")
            ++webViewCount;
        else
            ++apiCount;
    }

    return {
        {"siteCount", configs.size()},
        {"enabledCount", enabledCount},
        {"loggedInCount", loggedInCount},
        {"notLoggedInCount", configs.size() - loggedInCount},
        {"apiCount", apiCount},
        {"webViewCount", webViewCount},
        {"isOnline", status.isOnline},
        {"networkStateText", status.isOnline ? QStringLiteral("已连接") : QStringLiteral("未连接")},
        {"primaryIP", status.primaryIP.isEmpty() ? QStringLiteral("-") : status.primaryIP},
        {"primaryNetworkLabel", primaryNetworkLabel()},
        {"lastCheckedText", status.lastChecked.toLocalTime().toString("yyyy-MM-dd hh:mm:ss")},
        {"autoStartText", appSettings.autoStart ? QStringLiteral("已启用") : QStringLiteral("未启用")},
        {"autoLoginText", appSettings.autoLogin ? QStringLiteral("已开启") : QStringLiteral("未开启")},
        {"currentSite", currentSite},
        {"currentType", currentType},
        {"lastMessage", lastMessage()}
    };
}

QVariantList AppController::loginHistory() const
{
    return m_loginEngine->history();
}

QStringList AppController::networkCardChoices() const
{
    QStringList choices {QStringLiteral("默认出口")};
    const QList<Datas::NetworkCard> cards = m_datas->getNetworkCardList();
    for (const Datas::NetworkCard &card : cards) {
        if (!card.isConnected || card.ipAddress.isEmpty())
            continue;
        choices.append(QStringLiteral("%1 / %2").arg(card.interfaceName, card.ipAddress));
    }
    return choices;
}

void AppController::refreshAll()
{
    m_networkService->refreshNetworkStatus();
    emitDataChanged();
}

void AppController::scanNetworkCards()
{
    m_networkService->scanNetworkCards();
    m_lastMessage = QStringLiteral("网卡扫描完成");
    emit lastMessageChanged();
    emit operationFinished(m_lastMessage, true);
    emitDataChanged();
}

QVariantMap AppController::getConfig(const QString &id) const
{
    const Datas::LoginConfig config = m_datas->getLoginConfig(id);
    return config.id.isEmpty() ? QVariantMap {} : enrichConfig(config);
}

QString AppController::saveApiConfig(const QVariantMap &config)
{
    Datas::LoginConfig parsed = Login::LoginEngine::configFromVariantMap(config);
    parsed.type = "api";
    return saveConfig(parsed);
}

QString AppController::saveWebViewConfig(const QVariantMap &config)
{
    Datas::LoginConfig parsed = Login::LoginEngine::configFromVariantMap(config);
    parsed.type = "webview";
    return saveConfig(parsed);
}

bool AppController::deleteConfig(const QString &id)
{
    const bool ok = m_datas->deleteLoginConfig(id);
    m_lastMessage = ok ? QStringLiteral("站点已删除") : m_datas->lastError();
    emit lastMessageChanged();
    emit operationFinished(m_lastMessage, ok);
    emitDataChanged();
    return ok;
}

bool AppController::duplicateConfig(const QString &id)
{
    Datas::LoginConfig config = m_datas->getLoginConfig(id);
    if (config.id.isEmpty()) {
        m_lastMessage = QStringLiteral("站点不存在");
        emit lastMessageChanged();
        emit operationFinished(m_lastMessage, false);
        return false;
    }

    config.id.clear();
    config.remark = config.displayName() + QStringLiteral(" 副本");
    config.status = "not_logged_in";
    const QString newId = saveConfig(config);
    return !newId.isEmpty();
}

bool AppController::setConfigEnabled(const QString &id, bool enabled)
{
    const bool ok = m_datas->setLoginConfigEnabled(id, enabled);
    m_lastMessage = ok ? (enabled ? QStringLiteral("站点已启用") : QStringLiteral("站点已禁用")) : m_datas->lastError();
    emit lastMessageChanged();
    emit operationFinished(m_lastMessage, ok);
    emitDataChanged();
    return ok;
}

void AppController::executeOne(const QString &id)
{
    m_loginEngine->executeOne(id);
}

void AppController::executeBatch(const QStringList &ids)
{
    m_loginEngine->executeBatch(ids);
}

void AppController::executeAll()
{
    m_loginEngine->executeAll();
}

void AppController::testConfig(const QVariantMap &config)
{
    m_loginEngine->testConfig(config);
}

void AppController::logoutOne(const QString &id)
{
    m_loginEngine->logoutOne(id);
}

void AppController::checkStatus(const QString &id)
{
    m_loginEngine->checkStatus(id);
}

bool AppController::saveSettings(const QVariantMap &settingsMap)
{
    const Datas::Settings parsed = settingsFromVariantMap(settingsMap);
    const bool autoStartOk = applyAutoStart(parsed);
    const bool saved = m_datas->saveSettings(parsed);
    m_loginEngine->setAutoLogin(parsed.autoLogin);

    m_lastMessage = saved && autoStartOk ? QStringLiteral("设置已保存") : QStringLiteral("设置保存失败");
    if (!saved)
        m_lastMessage = m_datas->lastError();
    emit lastMessageChanged();
    emit operationFinished(m_lastMessage, saved && autoStartOk);
    emitDataChanged();
    return saved && autoStartOk;
}

bool AppController::resetSettings()
{
    const Datas::Settings defaults;
    return saveSettings(defaults.toVariantMap());
}

bool AppController::exportData(const QString &filePath)
{
    const bool ok = m_datas->exportData(filePath);
    m_lastMessage = ok ? QStringLiteral("数据已导出") : m_datas->lastError();
    emit lastMessageChanged();
    emit operationFinished(m_lastMessage, ok);
    return ok;
}

bool AppController::importData(const QString &filePath)
{
    const bool ok = m_datas->importData(filePath);
    m_lastMessage = ok ? QStringLiteral("数据已导入") : m_datas->lastError();
    emit lastMessageChanged();
    emit operationFinished(m_lastMessage, ok);
    emitDataChanged();
    return ok;
}

QString AppController::networkIpFromChoice(const QString &label) const
{
    if (label.trimmed().isEmpty() || label == QStringLiteral("默认出口"))
        return {};

    const QString marker = QStringLiteral(" / ");
    const int index = label.lastIndexOf(marker);
    if (index < 0)
        return label.trimmed();
    return label.mid(index + marker.size()).trimmed();
}

QString AppController::networkLabelForIp(const QString &ipAddress) const
{
    if (ipAddress.trimmed().isEmpty())
        return QStringLiteral("默认出口");

    const QList<Datas::NetworkCard> cards = m_datas->getNetworkCardList();
    for (const Datas::NetworkCard &card : cards) {
        if (card.ipAddress == ipAddress)
            return QStringLiteral("%1 / %2").arg(card.interfaceName, card.ipAddress);
    }

    return ipAddress;
}

void AppController::openPath(const QString &path) const
{
    const QString resolved = absolutePathForSetting(path);
    if (!resolved.isEmpty())
        QDesktopServices::openUrl(QUrl::fromLocalFile(resolved));
}

void AppController::wireSignals()
{
    connect(m_datas.get(), &Datas::Datas::loginConfigListChanged, this, [this]() {
        emit loginConfigsChanged();
        emit networkCardsChanged();
        emit summaryChanged();
    });
    connect(m_datas.get(), &Datas::Datas::networkCardListChanged, this, [this]() {
        emit networkCardsChanged();
        emit summaryChanged();
    });
    connect(m_datas.get(), &Datas::Datas::networkStatusChanged, this, [this]() {
        emit networkStatusChanged();
        emit summaryChanged();
    });
    connect(m_datas.get(), &Datas::Datas::settingsChanged, this, [this]() {
        emit settingsChanged();
        emit summaryChanged();
    });

    connect(m_loginEngine.get(), &Login::LoginEngine::busyChanged, this, &AppController::busyChanged);
    connect(m_loginEngine.get(), &Login::LoginEngine::lastMessageChanged, this, [this]() {
        emit lastMessageChanged();
        emit summaryChanged();
    });
    connect(m_loginEngine.get(), &Login::LoginEngine::historyChanged, this, &AppController::loginHistoryChanged);
    connect(m_loginEngine.get(), &Login::LoginEngine::batchFinished, this, [this]() {
        emit loginConfigsChanged();
        emit summaryChanged();
    });
    connect(m_loginEngine.get(), &Login::LoginEngine::quitRequested, this, &AppController::quitRequested);
}

QString AppController::saveConfig(Datas::LoginConfig config)
{
    if (config.remark.trimmed().isEmpty())
        config.remark = config.displayName();

    const QString existingId = config.id;
    const bool ok = m_datas->saveLoginConfig(config);
    if (!ok) {
        m_lastMessage = m_datas->lastError();
        emit lastMessageChanged();
        emit operationFinished(m_lastMessage, false);
        return {};
    }

    m_lastMessage = existingId.isEmpty() ? QStringLiteral("站点配置已创建") : QStringLiteral("站点配置已保存");
    emit lastMessageChanged();
    emit operationFinished(m_lastMessage, true);
    emitDataChanged();

    if (!existingId.isEmpty())
        return existingId;

    const QList<Datas::LoginConfig> configs = m_datas->getLoginConfigList();
    return configs.isEmpty() ? QString() : configs.first().id;
}

void AppController::emitDataChanged()
{
    emit loginConfigsChanged();
    emit networkCardsChanged();
    emit networkStatusChanged();
    emit settingsChanged();
    emit summaryChanged();
    emit loginHistoryChanged();
}

bool AppController::applyAutoStart(const Datas::Settings &settings)
{
    const QString executable = QCoreApplication::applicationFilePath();
    const QString command = settings.autoLogin ? QStringLiteral("\"%1\" --auto-login").arg(executable)
                                               : QStringLiteral("\"%1\"").arg(executable);

#ifdef Q_OS_WIN
    QSettings registry("HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Run", QSettings::NativeFormat);
    if (settings.autoStart)
        registry.setValue("AutoLogin", command);
    else
        registry.remove("AutoLogin");
    return registry.status() == QSettings::NoError;
#elif defined(Q_OS_LINUX)
    const QString configDir = QStandardPaths::writableLocation(QStandardPaths::ConfigLocation);
    const QString autostartDir = QDir(configDir).absoluteFilePath("autostart");
    const QString desktopFilePath = QDir(autostartDir).absoluteFilePath("AutoLogin.desktop");

    if (!settings.autoStart) {
        QFile::remove(desktopFilePath);
        return true;
    }

    QDir dir(autostartDir);
    if (!dir.exists() && !dir.mkpath("."))
        return false;

    QSaveFile file(desktopFilePath);
    if (!file.open(QIODevice::WriteOnly | QIODevice::Truncate | QIODevice::Text))
        return false;

    QTextStream stream(&file);
    stream << "[Desktop Entry]\n";
    stream << "Type=Application\n";
    stream << "Name=AutoLogin\n";
    stream << "Exec=" << command << "\n";
    stream << "Terminal=false\n";
    stream << "X-GNOME-Autostart-enabled=true\n";
    return file.commit();
#else
    Q_UNUSED(settings)
    return true;
#endif
}

Datas::Settings AppController::settingsFromVariantMap(const QVariantMap &map) const
{
    QJsonObject object = variantMapToJsonObject(m_datas->getSettings().toVariantMap());
    const QJsonObject incoming = variantMapToJsonObject(map);
    for (auto it = incoming.constBegin(); it != incoming.constEnd(); ++it)
        object.insert(it.key(), it.value());
    return Datas::Settings::fromJson(object);
}

QVariantMap AppController::enrichConfig(const Datas::LoginConfig &config) const
{
    QVariantMap map = config.toVariantMap();
    map.insert("networkLabel", networkLabelForIp(config.networkCard));
    map.insert("statusLabel", configStatusLabel(config.status));
    map.insert("typeLabel", configTypeLabel(config.type));
    map.insert("statusOk", config.status == "logged_in");
    return map;
}
