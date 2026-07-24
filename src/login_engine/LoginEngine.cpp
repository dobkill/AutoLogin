#include "login_engine/LoginEngine.h"

#include <QCoreApplication>
#include <QEventLoop>
#include <QFutureWatcher>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonValue>
#include <QThread>
#include <QTimer>
#include <QtConcurrent>

#ifdef AUTOLOGIN_WITH_WEBENGINE
#include <QWebEnginePage>
#endif

#include <algorithm>
#include <functional>

namespace {

QJsonObject objectFromVariant(const QVariant &value)
{
    if (value.canConvert<QVariantMap>())
        return QJsonObject::fromVariantMap(value.toMap());
    if (value.canConvert<QJsonObject>())
        return value.toJsonObject();
    return {};
}

QJsonArray arrayFromVariant(const QVariant &value)
{
    if (value.canConvert<QJsonArray>())
        return value.toJsonArray();

    QJsonArray array;
    const QVariantList list = value.toList();
    for (const QVariant &entry : list)
        array.append(QJsonValue::fromVariant(entry));
    return array;
}

QStringList stringListFromVariant(const QVariant &value)
{
    QStringList result;
    if (value.canConvert<QStringList>())
        return value.toStringList();

    const QVariantList list = value.toList();
    result.reserve(list.size());
    for (const QVariant &entry : list)
        result.append(entry.toString());
    return result;
}

QString statusFromResult(bool success)
{
    return success ? QStringLiteral("logged_in") : QStringLiteral("not_logged_in");
}

QString loginTypeLabel(const QString &type)
{
    return type == "webview" ? QStringLiteral("WebView") : QStringLiteral("API");
}

} // namespace

namespace Login {

#ifdef AUTOLOGIN_WITH_WEBENGINE
namespace {

QString jsString(const QString &value)
{
    return QString::fromUtf8(QJsonDocument(QJsonArray {value}).toJson(QJsonDocument::Compact)).mid(1).chopped(1);
}

QList<QJsonObject> stepsForUrl(const Datas::LoginConfig &config, int urlIndex)
{
    QList<QJsonObject> steps;
    const QString currentUrl = config.urls.value(urlIndex);

    for (const QJsonValue &value : config.operations) {
        const QJsonObject step = value.toObject();
        const int configuredIndex = step.value("urlIndex").toInt(step.value("url_index").toInt(0));
        const QString configuredUrl = step.value("url").toString();

        if (configuredIndex > 0 && configuredIndex != urlIndex + 1)
            continue;
        if (!configuredUrl.isEmpty() && configuredUrl != currentUrl)
            continue;

        steps.append(step);
    }

    return steps;
}

QString operationType(const QJsonObject &step)
{
    const QString type = step.value("type").toString(step.value("opType").toString("click")).trimmed().toLower();
    if (type == "input" || type == "wait")
        return type;
    return "click";
}

QString operationValue(const QJsonObject &step)
{
    if (step.contains("value"))
        return step.value("value").toVariant().toString();
    return step.value("opValue").toVariant().toString();
}

int waitMs(const QJsonObject &step, int defaultMs = 5000)
{
    const int value = step.value("waitMs").toInt(step.value("wait_ms").toInt(defaultMs));
    return std::max(0, value);
}

QString operationScript(const QJsonObject &step)
{
    const QString xpath = step.value("xpath").toString();
    const QString type = operationType(step);
    const QString value = operationValue(step);

    return QStringLiteral(R"JS(
(function() {
    const xpath = %1;
    const type = %2;
    const value = %3;
    const node = document.evaluate(xpath, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    if (!node)
        return { ok: false, message: "element not found: " + xpath };
    if (type === "input") {
        node.focus();
        node.value = value;
        node.dispatchEvent(new Event("input", { bubbles: true }));
        node.dispatchEvent(new Event("change", { bubbles: true }));
        return { ok: true, message: "input" };
    }
    if (type === "click") {
        node.click();
        return { ok: true, message: "click" };
    }
    return { ok: true, message: "wait" };
})()
)JS")
        .arg(jsString(xpath), jsString(type), jsString(value));
}

QString waitProbeScript(const QString &xpath)
{
    return QStringLiteral(R"JS(
(function() {
    const xpath = %1;
    const node = document.evaluate(xpath, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    return !!node;
})()
)JS")
        .arg(jsString(xpath));
}

} // namespace
#endif

QVariantMap LoginResult::toVariantMap() const
{
    return {
        {"siteId", siteId},
        {"siteName", siteName},
        {"type", type},
        {"typeLabel", loginTypeLabel(type)},
        {"success", success},
        {"message", message},
        {"responseCode", responseCode},
        {"durationMs", durationMs},
        {"durationText", durationMs > 0 ? QStringLiteral("%1 秒").arg(durationMs / 1000.0, 0, 'f', 2) : QStringLiteral("-")},
        {"executedAt", executedAt.toUTC().toString(Qt::ISODateWithMs)},
        {"executedAtText", executedAt.toLocalTime().toString("yyyy-MM-dd hh:mm:ss")},
        {"resultText", success ? QStringLiteral("成功") : QStringLiteral("失败")}
    };
}

LoginEngine::LoginEngine(Datas::Datas *datas, Network::NetworkService *networkService, QObject *parent)
    : QObject(parent)
    , m_datas(datas)
    , m_networkService(networkService)
{
}

bool LoginEngine::busy() const
{
    return m_busy;
}

QString LoginEngine::lastMessage() const
{
    return m_lastMessage;
}

QVariantList LoginEngine::history() const
{
    return m_history;
}

void LoginEngine::executeOne(const QString &siteId)
{
    if (!m_datas)
        return;

    const Datas::LoginConfig config = m_datas->getLoginConfig(siteId);
    if (config.id.isEmpty()) {
        setLastMessage(QStringLiteral("站点不存在"));
        return;
    }

    startBatch({config}, true);
}

void LoginEngine::executeBatch(const QStringList &siteIds)
{
    if (!m_datas)
        return;

    QList<Datas::LoginConfig> configs;
    for (const QString &id : siteIds) {
        const Datas::LoginConfig config = m_datas->getLoginConfig(id);
        if (!config.id.isEmpty())
            configs.append(config);
    }

    startBatch(configs, true);
}

void LoginEngine::executeAll()
{
    if (!m_datas)
        return;

    QList<Datas::LoginConfig> configs;
    const QList<Datas::LoginConfig> allConfigs = m_datas->getLoginConfigList();
    for (const Datas::LoginConfig &config : allConfigs) {
        if (config.enabled)
            configs.append(config);
    }

    startBatch(configs, true);
}

void LoginEngine::testConfig(const QVariantMap &config)
{
    Datas::LoginConfig parsed = configFromVariantMap(config);
    parsed.id = parsed.id.isEmpty() ? QStringLiteral("__test__") : parsed.id;
    startBatch({parsed}, false);
}

void LoginEngine::logoutOne(const QString &siteId)
{
    if (!m_datas)
        return;

    const Datas::LoginConfig config = m_datas->getLoginConfig(siteId);
    if (config.id.isEmpty()) {
        setLastMessage(QStringLiteral("站点不存在"));
        return;
    }

    m_datas->updateLoginConfigStatus(siteId, "not_logged_in");

    LoginResult result;
    result.siteId = siteId;
    result.siteName = config.displayName();
    result.type = config.type;
    result.success = true;
    result.message = QStringLiteral("已标记为未登录");
    result.executedAt = QDateTime::currentDateTimeUtc();
    recordResult(result, false);
    emit loginResultReady(result.toVariantMap());
}

void LoginEngine::checkStatus(const QString &siteId)
{
    executeOne(siteId);
}

void LoginEngine::setAutoLogin(bool enabled)
{
    setLastMessage(enabled ? QStringLiteral("自动登录已开启") : QStringLiteral("自动登录已关闭"));
}

void LoginEngine::silentLoginAndQuit()
{
    connect(this, &LoginEngine::batchFinished, this, &LoginEngine::quitRequested, Qt::SingleShotConnection);
    executeAll();
}

Datas::LoginConfig LoginEngine::configFromVariantMap(const QVariantMap &map)
{
    QJsonObject object;
    for (auto it = map.constBegin(); it != map.constEnd(); ++it)
        object.insert(it.key(), QJsonValue::fromVariant(it.value()));

    Datas::LoginConfig config = Datas::LoginConfig::fromJson(object);
    config.args = objectFromVariant(map.value("args"));
    config.headers = objectFromVariant(map.value("headers"));
    config.urls = stringListFromVariant(map.value("urls"));
    config.operations = arrayFromVariant(map.value("operations"));
    config.id = map.value("id").toString();
    config.networkCard = map.value("networkCard").toString();
    config.remark = map.value("remark").toString();
    config.url = map.value("url").toString();
    config.method = map.value("method", "POST").toString();
    config.type = map.value("type", "api").toString().toLower() == "webview" ? "webview" : "api";
    config.enabled = map.value("enabled", true).toBool();
    return config;
}

void LoginEngine::setBusy(bool busy)
{
    if (m_busy == busy)
        return;

    m_busy = busy;
    emit busyChanged();
}

void LoginEngine::setLastMessage(const QString &message)
{
    if (m_lastMessage == message)
        return;

    m_lastMessage = message;
    emit lastMessageChanged();
}

void LoginEngine::startBatch(const QList<Datas::LoginConfig> &configs, bool persistResults)
{
    if (m_busy) {
        setLastMessage(QStringLiteral("已有登录任务正在执行"));
        return;
    }

    if (configs.isEmpty()) {
        setLastMessage(QStringLiteral("没有可执行的登录配置"));
        emit batchFinished({});
        return;
    }

    setBusy(true);
    setLastMessage(QStringLiteral("正在执行 %1 个登录任务").arg(configs.size()));

    if (persistResults && m_datas) {
        for (const Datas::LoginConfig &config : configs)
            m_datas->updateLoginConfigStatus(config.id, "logging_in");
    }

    auto *watcher = new QFutureWatcher<QVariantList>(this);
    connect(watcher, &QFutureWatcher<QVariantList>::finished, this, [this, watcher, persistResults]() {
        const QVariantList resultMaps = watcher->result();
        watcher->deleteLater();

        for (const QVariant &value : resultMaps) {
            const QVariantMap map = value.toMap();
            if (persistResults && m_datas)
                m_datas->updateLoginConfigStatus(map.value("siteId").toString(), statusFromResult(map.value("success").toBool()));

            LoginResult result;
            result.siteId = map.value("siteId").toString();
            result.siteName = map.value("siteName").toString();
            result.type = map.value("type").toString();
            result.success = map.value("success").toBool();
            result.message = map.value("message").toString();
            result.responseCode = map.value("responseCode").toInt();
            result.durationMs = map.value("durationMs").toLongLong();
            result.executedAt = QDateTime::fromString(map.value("executedAt").toString(), Qt::ISODateWithMs);
            recordResult(result, persistResults);
            emit loginResultReady(map);
        }

        const int successCount = std::count_if(resultMaps.begin(), resultMaps.end(), [](const QVariant &value) {
            return value.toMap().value("success").toBool();
        });
        setLastMessage(QStringLiteral("登录完成：%1/%2 成功").arg(successCount).arg(resultMaps.size()));
        setBusy(false);
        emit batchFinished(resultMaps);
    });

    watcher->setFuture(QtConcurrent::run([this, configs]() {
        QVariantList results;
        for (const Datas::LoginConfig &config : configs)
            results.append(executeConfigSync(config).toVariantMap());
        return results;
    }));
}

LoginResult LoginEngine::executeConfigSync(const Datas::LoginConfig &config) const
{
    LoginResult result;
    result.siteId = config.id;
    result.siteName = config.displayName();
    result.type = config.type;
    result.executedAt = QDateTime::currentDateTimeUtc();

    if (!m_networkService) {
        result.message = QStringLiteral("网络服务未初始化");
        return result;
    }

    if (config.type == "webview") {
#ifdef AUTOLOGIN_WITH_WEBENGINE
        return executeWebViewConfig(config);
#else
        if (config.urls.isEmpty()) {
            result.message = QStringLiteral("WebView 配置缺少 URL");
            return result;
        }

        Network::RequestOptions options;
        options.method = "GET";
        options.timeoutMs = 10000;
        const Network::HttpResponse response = m_networkService->sendBoundRequest(config.networkCard, QUrl(config.urls.first()), options);
        result.success = response.success;
        result.responseCode = response.statusCode;
        result.durationMs = response.elapsedMs;
        result.message = response.success
                             ? QStringLiteral("WebView 入口可访问，流程步骤已保存")
                             : QStringLiteral("WebView 入口检测失败：%1").arg(response.error);
        return result;
#endif
    }

    if (config.url.trimmed().isEmpty()) {
        result.message = QStringLiteral("API 配置缺少 URL");
        return result;
    }

    Network::RequestOptions options;
    options.method = config.method;
    options.args = config.args;
    options.headers = config.headers;
    options.timeoutMs = 15000;

    const Network::HttpResponse response = m_networkService->sendBoundRequest(config.networkCard, QUrl(config.url), options);
    result.success = response.success;
    result.responseCode = response.statusCode;
    result.durationMs = response.elapsedMs;
    result.message = response.success
                         ? QStringLiteral("HTTP %1，耗时 %2 ms").arg(response.statusCode).arg(response.elapsedMs)
                         : QStringLiteral("登录失败：%1").arg(response.error);
    return result;
}

#ifdef AUTOLOGIN_WITH_WEBENGINE
LoginResult LoginEngine::executeWebViewConfig(const Datas::LoginConfig &config) const
{
    if (QThread::currentThread() == thread())
        return executeWebViewConfigOnGuiThread(config);

    LoginResult result;
    QMetaObject::invokeMethod(const_cast<LoginEngine *>(this), [&]() {
        result = executeWebViewConfigOnGuiThread(config);
    }, Qt::BlockingQueuedConnection);
    return result;
}

LoginResult LoginEngine::executeWebViewConfigOnGuiThread(const Datas::LoginConfig &config) const
{
    LoginResult result;
    result.siteId = config.id;
    result.siteName = config.displayName();
    result.type = config.type;
    result.executedAt = QDateTime::currentDateTimeUtc();

    if (config.urls.isEmpty()) {
        result.message = QStringLiteral("WebView 配置缺少 URL");
        return result;
    }

    QElapsedTimer elapsed;
    elapsed.start();

    QEventLoop loop;
    QWebEnginePage page;
    QTimer timeout;
    timeout.setSingleShot(true);
    timeout.start(std::max(15000, config.urls.size() * 15000));

    QString failure;
    int responseCode = 0;
    int currentUrlIndex = 0;
    int currentStepIndex = 0;
    QList<QJsonObject> currentSteps;

    std::function<void()> finish = [&]() {
        if (loop.isRunning())
            loop.quit();
    };

    std::function<void()> loadNextUrl;
    std::function<void()> runNextStep;

    auto fail = [&](const QString &message) {
        if (failure.isEmpty())
            failure = message;
        finish();
    };

    auto waitForXPath = [&](const QJsonObject &step) {
        const QString xpath = step.value("xpath").toString();
        const int timeoutMs = waitMs(step, 5000);
        const qint64 startedAt = elapsed.elapsed();

        if (xpath.trimmed().isEmpty()) {
            QTimer::singleShot(timeoutMs, &page, runNextStep);
            return;
        }

        std::shared_ptr<std::function<void()>> probe = std::make_shared<std::function<void()>>();
        *probe = [&, xpath, timeoutMs, startedAt, probe]() {
            page.runJavaScript(waitProbeScript(xpath), [&, xpath, timeoutMs, startedAt, probe](const QVariant &value) {
                if (value.toBool()) {
                    runNextStep();
                    return;
                }
                if (elapsed.elapsed() - startedAt >= timeoutMs) {
                    fail(QStringLiteral("等待元素超时：%1").arg(xpath));
                    return;
                }
                QTimer::singleShot(250, &page, *probe);
            });
        };
        (*probe)();
    };

    runNextStep = [&]() {
        if (!failure.isEmpty())
            return;

        if (currentStepIndex >= currentSteps.size()) {
            ++currentUrlIndex;
            loadNextUrl();
            return;
        }

        const QJsonObject step = currentSteps.at(currentStepIndex++);
        const QString type = operationType(step);
        if (type == "wait") {
            waitForXPath(step);
            return;
        }

        page.runJavaScript(operationScript(step), [&, step](const QVariant &value) {
            const QVariantMap map = value.toMap();
            if (!map.value("ok").toBool()) {
                fail(map.value("message", QStringLiteral("WebView 步骤执行失败")).toString());
                return;
            }

            const int pauseMs = waitMs(step, 300);
            QTimer::singleShot(std::min(std::max(pauseMs, 0), 5000), &page, runNextStep);
        });
    };

    loadNextUrl = [&]() {
        if (!failure.isEmpty())
            return;

        if (currentUrlIndex >= config.urls.size()) {
            finish();
            return;
        }

        const QUrl url(config.urls.at(currentUrlIndex));
        if (!url.isValid() || url.host().isEmpty()) {
            fail(QStringLiteral("无效 URL：%1").arg(config.urls.at(currentUrlIndex)));
            return;
        }

        currentSteps = stepsForUrl(config, currentUrlIndex);
        currentStepIndex = 0;

        QMetaObject::Connection loadConnection;
        loadConnection = connect(&page, &QWebEnginePage::loadFinished, &page, [&, loadConnection](bool ok) {
            disconnect(loadConnection);
            if (!ok) {
                fail(QStringLiteral("页面加载失败：%1").arg(config.urls.at(currentUrlIndex)));
                return;
            }
            responseCode = 200;
            runNextStep();
        });

        page.load(url);
    };

    connect(&timeout, &QTimer::timeout, &page, [&]() {
        fail(QStringLiteral("WebView 流程执行超时"));
    });

    QTimer::singleShot(0, &page, loadNextUrl);
    loop.exec();

    result.durationMs = elapsed.elapsed();
    result.responseCode = responseCode;
    result.success = failure.isEmpty();
    result.message = result.success
                         ? QStringLiteral("WebView 流程执行完成")
                         : QStringLiteral("WebView 流程失败：%1").arg(failure);
    return result;
}
#endif

void LoginEngine::recordResult(const LoginResult &result, bool persistResult)
{
    Q_UNUSED(persistResult)

    m_history.prepend(result.toVariantMap());
    while (m_history.size() > 100)
        m_history.removeLast();
    emit historyChanged();
}

} // namespace Login
