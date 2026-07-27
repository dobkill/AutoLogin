#include <QGuiApplication>
#include <QCoreApplication>
#include <QFile>
#include <QQmlContext>
#include <QQmlApplicationEngine>
#include <QQmlError>
#include <QTextStream>
#include <QTimer>
#include <QUrl>

#ifdef AUTOLOGIN_WITH_WEBENGINE
#include <QtWebEngineQuick/QtWebEngineQuick>
#endif

#include "app/AppController.h"

int main(int argc, char *argv[])
{
#ifdef AUTOLOGIN_WITH_WEBENGINE
    QtWebEngineQuick::initialize();
#endif

    QGuiApplication app(argc, argv);

    app.setOrganizationName("AutoLogin");
    app.setApplicationName("AutoLogin");
    app.setApplicationVersion("1.0.0");

    QQmlApplicationEngine engine;
    QList<QQmlError> qmlWarnings;
    AppController controller;
    const bool autoLoginMode = app.arguments().contains("--auto-login");

    controller.initialize();
    QObject::connect(&controller, &AppController::quitRequested, &app, &QCoreApplication::quit);

    engine.rootContext()->setContextProperty("appController", &controller);
    engine.rootContext()->setContextProperty("autoLoginMode", autoLoginMode);
    QObject::connect(&engine, &QQmlApplicationEngine::warnings, &engine, [&qmlWarnings](const QList<QQmlError> &warnings) {
        qmlWarnings.append(warnings);
    });

    engine.load(QUrl(QStringLiteral("qrc:/AutoLogin/src/qml/Main.qml")));

    if (engine.rootObjects().isEmpty()) {
        QFile logFile(QCoreApplication::applicationDirPath() + QStringLiteral("/AutoLogin-startup.log"));
        if (logFile.open(QIODevice::WriteOnly | QIODevice::Truncate | QIODevice::Text)) {
            QTextStream stream(&logFile);
            stream << "Failed to load QML root object.\n";
            for (const QQmlError &warning : qmlWarnings)
                stream << warning.toString() << '\n';
        }
        return -1;
    }

    if (autoLoginMode) {
        QTimer::singleShot(0, controller.loginEngine(), &Login::LoginEngine::silentLoginAndQuit);
    } else if (controller.settings().value("autoLogin").toBool()) {
        QTimer::singleShot(600, &controller, &AppController::executeAll);
    }

    return app.exec();
}
