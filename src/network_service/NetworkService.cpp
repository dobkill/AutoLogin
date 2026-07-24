#include "network_service/NetworkService.h"

#include <QAbstractSocket>
#include <QElapsedTimer>
#include <QFile>
#include <QHostAddress>
#include <QJsonDocument>
#include <QNetworkInterface>
#include <QSslSocket>
#include <QTcpSocket>
#include <QTextStream>
#include <QUrlQuery>

#include <algorithm>
#include <memory>

namespace {

QStringList systemDnsServers()
{
    QStringList servers;

#ifdef Q_OS_LINUX
    QFile file("/etc/resolv.conf");
    if (file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        QTextStream stream(&file);
        while (!stream.atEnd()) {
            const QString line = stream.readLine().trimmed();
            if (line.startsWith("nameserver ")) {
                const QString address = line.section(' ', 1, 1).trimmed();
                if (!address.isEmpty() && !servers.contains(address))
                    servers.append(address);
            }
        }
    }
#endif

    return servers;
}

QHash<QString, QString> linuxDefaultGateways()
{
    QHash<QString, QString> gateways;

#ifdef Q_OS_LINUX
    QFile file("/proc/net/route");
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text))
        return gateways;

    QTextStream stream(&file);
    stream.readLine();

    while (!stream.atEnd()) {
        const QStringList parts = stream.readLine().simplified().split(' ');
        if (parts.size() < 3 || parts.at(1) != "00000000")
            continue;

        bool ok = false;
        const quint32 raw = parts.at(2).toUInt(&ok, 16);
        if (!ok)
            continue;

        const QString gateway = QString("%1.%2.%3.%4")
                                    .arg(raw & 0xff)
                                    .arg((raw >> 8) & 0xff)
                                    .arg((raw >> 16) & 0xff)
                                    .arg((raw >> 24) & 0xff);
        gateways.insert(parts.at(0), gateway);
    }
#endif

    return gateways;
}

bool looksWireless(const QString &interfaceName, const QString &humanName)
{
    const QString key = (interfaceName + " " + humanName).toLower();
    if (key.startsWith("wl") || key.contains("wifi") || key.contains("wi-fi") ||
        key.contains("wireless") || key.contains("wlan")) {
        return true;
    }

#ifdef Q_OS_LINUX
    return QFile::exists(QStringLiteral("/sys/class/net/%1/wireless").arg(interfaceName));
#else
    return false;
#endif
}

QString requestTarget(QUrl url)
{
    QString path = url.path();
    if (path.isEmpty())
        path = "/";

    if (!url.query().isEmpty())
        path += "?" + url.query(QUrl::FullyEncoded);

    return path;
}

bool headerExists(const QJsonObject &headers, const QString &name)
{
    for (auto it = headers.constBegin(); it != headers.constEnd(); ++it) {
        if (it.key().compare(name, Qt::CaseInsensitive) == 0)
            return true;
    }
    return false;
}

QByteArray encodedArgs(const QJsonObject &args)
{
    QUrlQuery query;
    for (auto it = args.constBegin(); it != args.constEnd(); ++it)
        query.addQueryItem(it.key(), it.value().toVariant().toString());
    return query.toString(QUrl::FullyEncoded).toUtf8();
}

QByteArray requestBody(const Network::RequestOptions &options, QString *contentType)
{
    const QString method = options.method.trimmed().toUpper();
    if (method == "GET" || options.args.isEmpty())
        return {};

    QString configuredType;
    for (auto it = options.headers.constBegin(); it != options.headers.constEnd(); ++it) {
        if (it.key().compare("Content-Type", Qt::CaseInsensitive) == 0) {
            configuredType = it.value().toString();
            break;
        }
    }

    if (configuredType.contains("json", Qt::CaseInsensitive)) {
        if (contentType)
            *contentType = configuredType;
        return QJsonDocument(options.args).toJson(QJsonDocument::Compact);
    }

    if (contentType)
        *contentType = configuredType.isEmpty() ? QStringLiteral("application/x-www-form-urlencoded") : configuredType;
    return encodedArgs(options.args);
}

QUrl urlWithGetArgs(QUrl url, const QJsonObject &args)
{
    if (args.isEmpty())
        return url;

    QUrlQuery query(url);
    for (auto it = args.constBegin(); it != args.constEnd(); ++it)
        query.addQueryItem(it.key(), it.value().toVariant().toString());
    url.setQuery(query);
    return url;
}

QString socketErrorString(const QAbstractSocket *socket)
{
    return socket->errorString().isEmpty() ? QStringLiteral("Socket error") : socket->errorString();
}

} // namespace

namespace Network {

NetworkService::NetworkService(Datas::Datas *datas, QObject *parent)
    : QObject(parent)
    , m_datas(datas)
{
    connect(&m_monitorTimer, &QTimer::timeout, this, [this]() {
        scanNetworkCards();
    });
}

QList<Datas::NetworkCard> NetworkService::scanNetworkCards()
{
    QList<Datas::NetworkCard> cards;
    const QHash<QString, QString> gateways = linuxDefaultGateways();
    const QStringList dns = systemDnsServers();

    const QList<QNetworkInterface> interfaces = QNetworkInterface::allInterfaces();
    for (const QNetworkInterface &netInterface : interfaces) {
        const QString interfaceName = netInterface.name();
        const QString humanName = netInterface.humanReadableName().isEmpty()
                                      ? interfaceName
                                      : netInterface.humanReadableName();
        const bool connected = netInterface.flags().testFlag(QNetworkInterface::IsUp) &&
                               netInterface.flags().testFlag(QNetworkInterface::IsRunning);
        const bool wireless = looksWireless(interfaceName, humanName);
        const QList<QNetworkAddressEntry> entries = netInterface.addressEntries();

        bool addedAddress = false;
        for (const QNetworkAddressEntry &entry : entries) {
            if (entry.ip().protocol() != QAbstractSocket::IPv4Protocol)
                continue;

            Datas::NetworkCard card;
            card.interfaceName = humanName;
            card.ipAddress = entry.ip().toString();
            card.subnetMask = entry.netmask().toString();
            card.gateway = gateways.value(interfaceName);
            card.dns = dns;
            card.macAddress = netInterface.hardwareAddress();
            card.isConnected = connected && !entry.ip().isLoopback();
            card.type = wireless ? "wireless" : "wired";
            cards.append(card);
            addedAddress = true;
        }

        if (!addedAddress) {
            Datas::NetworkCard card;
            card.interfaceName = humanName;
            card.gateway = gateways.value(interfaceName);
            card.dns = dns;
            card.macAddress = netInterface.hardwareAddress();
            card.isConnected = false;
            card.type = wireless ? "wireless" : "wired";
            cards.append(card);
        }
    }

    std::sort(cards.begin(), cards.end(), [](const Datas::NetworkCard &a, const Datas::NetworkCard &b) {
        if (a.isConnected != b.isConnected)
            return a.isConnected > b.isConnected;
        if (a.gateway.isEmpty() != b.gateway.isEmpty())
            return !a.gateway.isEmpty();
        return a.interfaceName.toLower() < b.interfaceName.toLower();
    });

    if (m_datas) {
        m_datas->updateNetworkCardList(cards);
        refreshNetworkStatus();
    }

    emit networkCardsChanged();
    return cards;
}

Datas::NetworkStatus NetworkService::refreshNetworkStatus()
{
    Datas::NetworkStatus status;
    status.lastChecked = QDateTime::currentDateTimeUtc();

    const QList<Datas::NetworkCard> cards = m_datas ? m_datas->getNetworkCardList() : QList<Datas::NetworkCard> {};

    for (const Datas::NetworkCard &card : cards) {
        if (!card.isConnected || card.ipAddress.isEmpty())
            continue;

        status.isOnline = true;
        if (!card.gateway.isEmpty() || status.primaryIP.isEmpty()) {
            status.primaryIP = card.ipAddress;
            if (!card.gateway.isEmpty())
                break;
        }
    }

    if (m_datas)
        m_datas->updateNetworkStatus(status);

    emit networkStatusChanged(status.toVariantMap());
    return status;
}

Datas::NetworkStatus NetworkService::getNetworkStatus() const
{
    return m_datas ? m_datas->getNetworkStatus() : Datas::NetworkStatus {};
}

bool NetworkService::isCardAvailable(const QString &ipAddress) const
{
    if (ipAddress.trimmed().isEmpty())
        return true;

    const QList<Datas::NetworkCard> cards = m_datas ? m_datas->getNetworkCardList() : QList<Datas::NetworkCard> {};
    for (const Datas::NetworkCard &card : cards) {
        if (card.ipAddress == ipAddress && card.isConnected)
            return true;
    }

    return false;
}

HttpResponse NetworkService::sendBoundRequest(const QString &localIp,
                                              const QUrl &inputUrl,
                                              const RequestOptions &inputOptions) const
{
    HttpResponse response;
    response.executedAt = QDateTime::currentDateTimeUtc();

    QUrl url = inputUrl;
    RequestOptions options = inputOptions;
    options.method = options.method.trimmed().toUpper();
    if (options.method.isEmpty())
        options.method = "GET";

    if (!url.isValid() || url.host().isEmpty()) {
        response.error = QStringLiteral("Invalid URL");
        return response;
    }

    if (options.method == "GET")
        url = urlWithGetArgs(url, options.args);

    const QString scheme = url.scheme().toLower();
    const bool encrypted = scheme == "https";
    if (!encrypted && scheme != "http") {
        response.error = QStringLiteral("Only HTTP and HTTPS URLs are supported");
        return response;
    }

    QString contentType;
    const QByteArray body = requestBody(options, &contentType);

    QByteArray request;
    request += options.method.toUtf8() + " " + requestTarget(url).toUtf8() + " HTTP/1.1\r\n";
    request += "Host: " + url.host().toUtf8();
    if (url.port() > 0)
        request += ":" + QByteArray::number(url.port());
    request += "\r\n";

    if (!headerExists(options.headers, "User-Agent"))
        request += "User-Agent: AutoLogin/1.0\r\n";
    if (!headerExists(options.headers, "Accept"))
        request += "Accept: */*\r\n";
    if (!body.isEmpty() && !contentType.isEmpty() && !headerExists(options.headers, "Content-Type"))
        request += "Content-Type: " + contentType.toUtf8() + "\r\n";

    for (auto it = options.headers.constBegin(); it != options.headers.constEnd(); ++it) {
        if (it.key().trimmed().isEmpty())
            continue;
        request += it.key().toUtf8() + ": " + it.value().toVariant().toString().toUtf8() + "\r\n";
    }

    request += "Connection: close\r\n";
    if (!body.isEmpty())
        request += "Content-Length: " + QByteArray::number(body.size()) + "\r\n";
    request += "\r\n";
    request += body;

    std::unique_ptr<QAbstractSocket> socket;
    QSslSocket *sslSocket = nullptr;
    if (encrypted) {
        auto ssl = std::make_unique<QSslSocket>();
        sslSocket = ssl.get();
        socket = std::move(ssl);
    } else {
        socket = std::make_unique<QTcpSocket>();
    }

    if (!localIp.trimmed().isEmpty()) {
        if (!socket->bind(QHostAddress(localIp.trimmed()))) {
            response.error = QStringLiteral("Unable to bind local IP %1: %2").arg(localIp, socketErrorString(socket.get()));
            return response;
        }
    }

    const int timeoutMs = std::max(1000, options.timeoutMs);
    QElapsedTimer timer;
    timer.start();

    const int port = url.port(encrypted ? 443 : 80);
    if (encrypted) {
        sslSocket->connectToHostEncrypted(url.host(), port);
        if (!sslSocket->waitForEncrypted(timeoutMs)) {
            response.elapsedMs = timer.elapsed();
            response.error = socketErrorString(socket.get());
            return response;
        }
    } else {
        socket->connectToHost(url.host(), port);
        if (!socket->waitForConnected(timeoutMs)) {
            response.elapsedMs = timer.elapsed();
            response.error = socketErrorString(socket.get());
            return response;
        }
    }

    socket->write(request);
    if (!socket->waitForBytesWritten(timeoutMs)) {
        response.elapsedMs = timer.elapsed();
        response.error = socketErrorString(socket.get());
        return response;
    }

    QByteArray raw;
    while (timer.elapsed() < timeoutMs) {
        raw += socket->readAll();
        if (socket->state() == QAbstractSocket::UnconnectedState)
            break;

        const int remaining = std::max(1, timeoutMs - static_cast<int>(timer.elapsed()));
        if (!socket->waitForReadyRead(std::min(remaining, 500)))
            continue;
    }
    raw += socket->readAll();

    response.elapsedMs = timer.elapsed();
    if (raw.isEmpty()) {
        response.error = QStringLiteral("No response received");
        return response;
    }

    const int firstLineEnd = raw.indexOf("\r\n");
    const QByteArray statusLine = firstLineEnd >= 0 ? raw.left(firstLineEnd) : raw.left(64);
    const QList<QByteArray> statusParts = statusLine.split(' ');
    if (statusParts.size() >= 2)
        response.statusCode = statusParts.at(1).toInt();

    const int headerEnd = raw.indexOf("\r\n\r\n");
    const QByteArray bodyBytes = headerEnd >= 0 ? raw.mid(headerEnd + 4) : QByteArray {};
    response.body = QString::fromUtf8(bodyBytes);
    response.success = response.statusCode >= 200 && response.statusCode < 400;
    if (!response.success)
        response.error = QStringLiteral("HTTP status %1").arg(response.statusCode);

    return response;
}

HttpResponse NetworkService::checkConnectivity(const QUrl &url, const QString &localIp) const
{
    RequestOptions options;
    options.method = "GET";
    options.timeoutMs = 5000;
    return sendBoundRequest(localIp, url, options);
}

void NetworkService::startMonitoring(int intervalMs)
{
    m_monitorTimer.start(std::max(5000, intervalMs));
}

void NetworkService::stopMonitoring()
{
    m_monitorTimer.stop();
}

} // namespace Network
