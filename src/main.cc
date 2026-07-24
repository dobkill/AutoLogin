#include <QGuiApplication>
#include <QQmlContext>
#include <QQmlApplicationEngine>
#include <QTimer>
#include <QUrl>

#include "app/AppController.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    app.setOrganizationName("AutoLogin");
    app.setApplicationName("AutoLogin");
    app.setApplicationVersion("1.0.0");

    QQmlApplicationEngine engine;
    AppController controller;
    const bool autoLoginMode = app.arguments().contains("--auto-login");

    controller.initialize();
    QObject::connect(&controller, &AppController::quitRequested, &app, &QCoreApplication::quit);

    engine.rootContext()->setContextProperty("appController", &controller);
    engine.rootContext()->setContextProperty("autoLoginMode", autoLoginMode);

#if QT_VERSION >= QT_VERSION_CHECK(6, 5, 0)
    engine.loadFromModule("AutoLogin", "Main");
#else
    engine.load(QUrl(QStringLiteral("qrc:/AutoLogin/src/qml/Main.qml")));
#endif

    if (engine.rootObjects().isEmpty())
        return -1;

    if (autoLoginMode) {
        QTimer::singleShot(0, controller.loginEngine(), &Login::LoginEngine::silentLoginAndQuit);
    } else if (controller.settings().value("autoLogin").toBool()) {
        QTimer::singleShot(600, &controller, &AppController::executeAll);
    }

    return app.exec();
}
