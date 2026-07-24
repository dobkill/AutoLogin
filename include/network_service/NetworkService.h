#pragma once

#include "Datas/Datas.h"

#include <QJsonObject>
#include <QObject>
#include <QTimer>

namespace Network {

struct RequestOptions {
    QString method = "GET";
    QJsonObject args;
    QJsonObject headers;
    int timeoutMs = 15000;
};

struct HttpResponse {
    bool success = false;
    int statusCode = 0;
    QString body;
    QString error;
    qint64 elapsedMs = 0;
    QDateTime executedAt = QDateTime::currentDateTimeUtc();
};

class NetworkService : public QObject {
    Q_OBJECT

public:
    explicit NetworkService(Datas::Datas *datas, QObject *parent = nullptr);

    QList<Datas::NetworkCard> scanNetworkCards();
    Datas::NetworkStatus refreshNetworkStatus();
    Datas::NetworkStatus getNetworkStatus() const;

    bool isCardAvailable(const QString &ipAddress) const;
    HttpResponse sendBoundRequest(const QString &localIp,
                                  const QUrl &url,
                                  const RequestOptions &options) const;
    HttpResponse checkConnectivity(const QUrl &url, const QString &localIp = QString()) const;

    Q_INVOKABLE void startMonitoring(int intervalMs = 30000);
    Q_INVOKABLE void stopMonitoring();

signals:
    void networkCardsChanged();
    void networkStatusChanged(const QVariantMap &status);

private:
    Datas::Datas *m_datas = nullptr;
    QTimer m_monitorTimer;
};

} // namespace Network
