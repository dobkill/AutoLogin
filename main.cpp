#include <QQmlApplicationEngine>
#include <QCoreApplication>
#include <QGuiApplication>
#include <QQuickView>
#include <QSettings>
#include <QVariant>
#include <QtQuick>
#include <QDebug>
#include <QTimer>

// 设置开机启动
void addToStartup()
{
    QString program = QCoreApplication::applicationFilePath();
    QString arguments = "--auto-login";
    QString fullCommand = program + " " + arguments;

    // 使用 QSettings 检查注册表中是否已存在该键
    QSettings settings("HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Run", QSettings::NativeFormat);
    
    // 如果已经存在启动项，则不做任何修改
    if (settings.contains("MyQtApp")) {
        return;  // 启动项已存在，直接返回
    }
    // 如果不存在，添加启动项
    settings.setValue("MyQtApp", fullCommand);
}

// 从注册表中删除程序路径和参数
void removeFromStartup()
{
    QSettings settings("HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Run", QSettings::NativeFormat);
    settings.remove("MyQtApp");
}

// 根据 autoStart 状态设置启动项
// 根据 autoStart 状态设置启动项
void setAutoStartStatus(QQmlApplicationEngine &engine)
{
    if (engine.rootObjects().isEmpty()) {
        qDebug() << "QML file not loaded successfully.";
        return;  // 或者进行其他错误处理
    }
     // 获取根对象
    QObject *rootObject = engine.rootObjects().first();

    // 获取 store 对象
    QObject *storeObject = rootObject->findChild<QObject *>("store");

    bool autoStart = false;  // 默认值为 false

    // 调用 load 方法，获取 autoStart 值
    if (storeObject) {
        QVariant result;
        QMetaObject::invokeMethod(storeObject, "load", Qt::DirectConnection, 
                                  Q_RETURN_ARG(QVariant, result),  // 返回类型为 QVariant
                                  Q_ARG(QVariant, "autoStart"),    // 键名
                                  Q_ARG(QVariant, false));         // 默认值
        
        // 将 QVariant 转换为 bool
        autoStart = result.toBool();
        qDebug() << "autoStart value: " << autoStart;  // 输出获取的 bool 值
    }

    if (autoStart)
    {
        addToStartup();
    }
    else
    {
        removeFromStartup();
    }
}

// 如果 收到了 argv 中的 --auto-login 参数，隐藏 QML 窗体但仍执行 QML 代码，且1分钟后退出程序
// 如果 argv为空 或者 argv中没有 --auto-login 参数，正常显示 QML 窗体
int main(int argc, char *argv[])
{
    // 正常显示 QML 窗体
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    
    // 判断是否包含 --auto-login 参数
    bool autoLogin = false;
    for (int i = 0; i < argc; ++i) {
        if (QString(argv[i]) == "--auto-login") {
            autoLogin = true;
            break;
        }
    }


    // 加载 QML 文件
    engine.loadFromModule("Login_wifi", "Main");

      // 如果存在 --auto-login 参数，隐藏 QML 窗体，并设置 1 分钟后退出程序
    if (autoLogin) {
        // 获取根对象，隐藏 QML 窗体
        QObject *rootObject = engine.rootObjects().first();
        QQuickItem *item = qobject_cast<QQuickItem *>(rootObject);
        if (item) {
            item->setVisible(false); // 隐藏 QML 窗体
        }
        // 设置定时器，1 分钟后退出程序
        QTimer::singleShot(60000, &app, &QCoreApplication::quit); // 1 分钟后退出
    }
    
    // 创建定时器，每1秒执行一次 setAutoStartStatus 函数
    QTimer *timer = new QTimer(&app);
    QObject::connect(timer, &QTimer::timeout, [&]() {
        setAutoStartStatus(engine);
    });
    timer->start(1000); // 每2秒执行一次

    return app.exec();
}
