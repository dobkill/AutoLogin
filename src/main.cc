#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    app.setOrganizationName("AutoLogin");
    app.setApplicationName("AutoLogin");
    app.setApplicationVersion("1.0.0");

    QQmlApplicationEngine engine;

    // 加载 QML 主模块
    engine.loadFromModule("AutoLogin", "Main");

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
