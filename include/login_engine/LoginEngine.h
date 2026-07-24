#pragma once

#include "Datas/Datas.h"
#include "network_service/NetworkService.h"

#include <QObject>
#include <QVariantList>
#include <QVariantMap>

namespace Login {

struct LoginResult {
    QString siteId;
    QString siteName;
    QString type;
    bool success = false;
    QString message;
    int responseCode = 0;
    qint64 durationMs = 0;
    QDateTime executedAt = QDateTime::currentDateTimeUtc();

    QVariantMap toVariantMap() const;
};

class LoginEngine : public QObject {
    Q_OBJECT
    Q_PROPERTY(bool busy READ busy NOTIFY busyChanged)
    Q_PROPERTY(QString lastMessage READ lastMessage NOTIFY lastMessageChanged)
    Q_PROPERTY(QVariantList history READ history NOTIFY historyChanged)

public:
    explicit LoginEngine(Datas::Datas *datas, Network::NetworkService *networkService, QObject *parent = nullptr);

    bool busy() const;
    QString lastMessage() const;
    QVariantList history() const;

    Q_INVOKABLE void executeOne(const QString &siteId);
    Q_INVOKABLE void executeBatch(const QStringList &siteIds);
    Q_INVOKABLE void executeAll();
    Q_INVOKABLE void testConfig(const QVariantMap &config);
    Q_INVOKABLE void logoutOne(const QString &siteId);
    Q_INVOKABLE void checkStatus(const QString &siteId);
    Q_INVOKABLE void setAutoLogin(bool enabled);
    Q_INVOKABLE void silentLoginAndQuit();

    static Datas::LoginConfig configFromVariantMap(const QVariantMap &map);

signals:
    void busyChanged();
    void lastMessageChanged();
    void historyChanged();
    void loginResultReady(const QVariantMap &result);
    void batchFinished(const QVariantList &results);
    void quitRequested();

private:
    void setBusy(bool busy);
    void setLastMessage(const QString &message);
    void startBatch(const QList<Datas::LoginConfig> &configs, bool persistResults);
    LoginResult executeConfigSync(const Datas::LoginConfig &config) const;
#ifdef AUTOLOGIN_WITH_WEBENGINE
    LoginResult executeWebViewConfig(const Datas::LoginConfig &config) const;
    LoginResult executeWebViewConfigOnGuiThread(const Datas::LoginConfig &config) const;
#endif
    void recordResult(const LoginResult &result, bool persistResult);

    Datas::Datas *m_datas = nullptr;
    Network::NetworkService *m_networkService = nullptr;
    bool m_busy = false;
    QString m_lastMessage;
    QVariantList m_history;
};

} // namespace Login
