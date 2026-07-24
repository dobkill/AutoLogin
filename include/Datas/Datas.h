#pragma once

#include <QDateTime>
#include <QJsonArray>
#include <QJsonObject>
#include <QObject>
#include <QString>
#include <QStringList>
#include <QVariantMap>

#include <memory>

namespace Datas {

struct LoginConfig {
    QString id;
    QString type = "api";
    QString url;
    QString method = "POST";
    QJsonObject args;
    QJsonObject headers;
    QStringList urls;
    QJsonArray operations;
    QString networkCard;
    QString remark;
    QString status = "not_logged_in";
    bool enabled = true;
    QDateTime updatedAt = QDateTime::currentDateTimeUtc();

    QString displayName() const;
    QJsonObject toJson() const;
    QVariantMap toVariantMap() const;
    static LoginConfig fromJson(const QJsonObject &object);
};

struct NetworkCard {
    QString interfaceName;
    QString ipAddress;
    QString subnetMask;
    QString gateway;
    QStringList dns;
    QString macAddress;
    bool isConnected = false;
    QString type = "wired";

    QJsonObject toJson() const;
    QVariantMap toVariantMap() const;
    static NetworkCard fromJson(const QJsonObject &object);
};

struct NetworkStatus {
    bool isOnline = false;
    QString primaryIP;
    QDateTime lastChecked = QDateTime::currentDateTimeUtc();

    QJsonObject toJson() const;
    QVariantMap toVariantMap() const;
    static NetworkStatus fromJson(const QJsonObject &object);
};

struct Settings {
    bool autoStart = false;
    bool autoLogin = false;
    bool minimizeToTray = false;
    QString logDirectory = "./logs";
    QString dataDirectory = "./data";
    QString theme = "light";
    QString language = "zh";

    QJsonObject toJson() const;
    QVariantMap toVariantMap() const;
    static Settings fromJson(const QJsonObject &object);
};

class Datas : public QObject {
    Q_OBJECT

public:
    explicit Datas(QObject *parent = nullptr);
    ~Datas() override;

    bool initialize(const QString &dataDir = QString());
    bool isInitialized() const;
    QString dataDirectory() const;
    QString lastError() const;

    QList<LoginConfig> getLoginConfigList() const;
    LoginConfig getLoginConfig(const QString &id) const;
    bool saveLoginConfig(LoginConfig config);
    bool deleteLoginConfig(const QString &id);
    bool updateLoginConfigStatus(const QString &id, const QString &status);
    bool setLoginConfigEnabled(const QString &id, bool enabled);

    QList<NetworkCard> getNetworkCardList() const;
    bool updateNetworkCardList(const QList<NetworkCard> &cards);

    NetworkStatus getNetworkStatus() const;
    bool updateNetworkStatus(const NetworkStatus &status);

    Settings getSettings() const;
    bool saveSettings(const Settings &settings);

    bool exportData(const QString &filePath) const;
    bool importData(const QString &filePath);

signals:
    void loginConfigChanged(const QString &id);
    void loginConfigListChanged();
    void networkCardListChanged();
    void networkStatusChanged();
    void settingsChanged();

private:
    class SqlState;

    bool createTables();
    bool loadSettings();
    bool saveSettingsFile() const;
    void setLastError(const QString &message) const;

    std::unique_ptr<SqlState> m_sql;
    QString m_dataDir;
    QString m_settingsPath;
    Settings m_settings;
    mutable QString m_lastError;
};

} // namespace Datas
