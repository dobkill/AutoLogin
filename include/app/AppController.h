#pragma once

#include "Datas/Datas.h"
#include "login_engine/LoginEngine.h"
#include "network_service/NetworkService.h"

#include <QObject>
#include <QStringList>
#include <QVariantList>
#include <QVariantMap>

#include <memory>

class AppController : public QObject {
    Q_OBJECT
    Q_PROPERTY(bool busy READ busy NOTIFY busyChanged)
    Q_PROPERTY(QString lastMessage READ lastMessage NOTIFY lastMessageChanged)
    Q_PROPERTY(QString primaryNetworkLabel READ primaryNetworkLabel NOTIFY networkStatusChanged)
    Q_PROPERTY(QVariantList loginConfigs READ loginConfigs NOTIFY loginConfigsChanged)
    Q_PROPERTY(QVariantList networkCards READ networkCards NOTIFY networkCardsChanged)
    Q_PROPERTY(QVariantMap networkStatus READ networkStatus NOTIFY networkStatusChanged)
    Q_PROPERTY(QVariantMap settings READ settings NOTIFY settingsChanged)
    Q_PROPERTY(QVariantMap summary READ summary NOTIFY summaryChanged)
    Q_PROPERTY(QVariantList loginHistory READ loginHistory NOTIFY loginHistoryChanged)
    Q_PROPERTY(QStringList networkCardChoices READ networkCardChoices NOTIFY networkCardsChanged)

public:
    explicit AppController(QObject *parent = nullptr);
    ~AppController() override;

    bool initialize(const QString &dataDir = QString());
    Login::LoginEngine *loginEngine() const;

    bool busy() const;
    QString lastMessage() const;
    QString primaryNetworkLabel() const;
    QVariantList loginConfigs() const;
    QVariantList networkCards() const;
    QVariantMap networkStatus() const;
    QVariantMap settings() const;
    QVariantMap summary() const;
    QVariantList loginHistory() const;
    QStringList networkCardChoices() const;

    Q_INVOKABLE void refreshAll();
    Q_INVOKABLE void scanNetworkCards();
    Q_INVOKABLE QVariantMap getConfig(const QString &id) const;
    Q_INVOKABLE QString saveApiConfig(const QVariantMap &config);
    Q_INVOKABLE QString saveWebViewConfig(const QVariantMap &config);
    Q_INVOKABLE bool deleteConfig(const QString &id);
    Q_INVOKABLE bool duplicateConfig(const QString &id);
    Q_INVOKABLE bool setConfigEnabled(const QString &id, bool enabled);
    Q_INVOKABLE void executeOne(const QString &id);
    Q_INVOKABLE void executeBatch(const QStringList &ids);
    Q_INVOKABLE void executeAll();
    Q_INVOKABLE void testConfig(const QVariantMap &config);
    Q_INVOKABLE void logoutOne(const QString &id);
    Q_INVOKABLE void checkStatus(const QString &id);
    Q_INVOKABLE bool saveSettings(const QVariantMap &settings);
    Q_INVOKABLE bool resetSettings();
    Q_INVOKABLE bool exportData(const QString &filePath);
    Q_INVOKABLE bool importData(const QString &filePath);
    Q_INVOKABLE QString networkIpFromChoice(const QString &label) const;
    Q_INVOKABLE QString networkLabelForIp(const QString &ipAddress) const;
    Q_INVOKABLE void openPath(const QString &path) const;

signals:
    void busyChanged();
    void lastMessageChanged();
    void loginConfigsChanged();
    void networkCardsChanged();
    void networkStatusChanged();
    void settingsChanged();
    void summaryChanged();
    void loginHistoryChanged();
    void operationFinished(const QString &message, bool success);
    void quitRequested();

private:
    void wireSignals();
    QString saveConfig(Datas::LoginConfig config);
    void emitDataChanged();
    bool applyAutoStart(const Datas::Settings &settings);
    Datas::Settings settingsFromVariantMap(const QVariantMap &map) const;
    QVariantMap enrichConfig(const Datas::LoginConfig &config) const;

    std::unique_ptr<Datas::Datas> m_datas;
    std::unique_ptr<Network::NetworkService> m_networkService;
    std::unique_ptr<Login::LoginEngine> m_loginEngine;
    QString m_lastMessage;
};
