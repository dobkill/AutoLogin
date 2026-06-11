#include <QtQml/qqmlprivate.h>
#include <QtCore/qdir.h>
#include <QtCore/qurl.h>
#include <QtCore/qhash.h>
#include <QtCore/qstring.h>

namespace QmlCacheGeneratedCode {
namespace _qt_qml_AutoLogin_src_qml_Main_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_AutoLogin_src_qml_components_AppSidebar_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_AutoLogin_src_qml_components_AppHeader_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_AutoLogin_src_qml_pages_HomePage_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_AutoLogin_src_qml_pages_SiteManagerPage_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_AutoLogin_src_qml_pages_LoginPage_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_AutoLogin_src_qml_pages_NetworkPage_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_AutoLogin_src_qml_pages_SettingsPage_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}

}
namespace {
struct Registry {
    Registry();
    ~Registry();
    QHash<QString, const QQmlPrivate::CachedQmlUnit*> resourcePathToCachedUnit;
    static const QQmlPrivate::CachedQmlUnit *lookupCachedUnit(const QUrl &url);
};

Q_GLOBAL_STATIC(Registry, unitRegistry)


Registry::Registry() {
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/AutoLogin/src/qml/Main.qml"), &QmlCacheGeneratedCode::_qt_qml_AutoLogin_src_qml_Main_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/AutoLogin/src/qml/components/AppSidebar.qml"), &QmlCacheGeneratedCode::_qt_qml_AutoLogin_src_qml_components_AppSidebar_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/AutoLogin/src/qml/components/AppHeader.qml"), &QmlCacheGeneratedCode::_qt_qml_AutoLogin_src_qml_components_AppHeader_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/AutoLogin/src/qml/pages/HomePage.qml"), &QmlCacheGeneratedCode::_qt_qml_AutoLogin_src_qml_pages_HomePage_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/AutoLogin/src/qml/pages/SiteManagerPage.qml"), &QmlCacheGeneratedCode::_qt_qml_AutoLogin_src_qml_pages_SiteManagerPage_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/AutoLogin/src/qml/pages/LoginPage.qml"), &QmlCacheGeneratedCode::_qt_qml_AutoLogin_src_qml_pages_LoginPage_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/AutoLogin/src/qml/pages/NetworkPage.qml"), &QmlCacheGeneratedCode::_qt_qml_AutoLogin_src_qml_pages_NetworkPage_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/AutoLogin/src/qml/pages/SettingsPage.qml"), &QmlCacheGeneratedCode::_qt_qml_AutoLogin_src_qml_pages_SettingsPage_qml::unit);
    QQmlPrivate::RegisterQmlUnitCacheHook registration;
    registration.structVersion = 0;
    registration.lookupCachedQmlUnit = &lookupCachedUnit;
    QQmlPrivate::qmlregister(QQmlPrivate::QmlUnitCacheHookRegistration, &registration);
}

Registry::~Registry() {
    QQmlPrivate::qmlunregister(QQmlPrivate::QmlUnitCacheHookRegistration, quintptr(&lookupCachedUnit));
}

const QQmlPrivate::CachedQmlUnit *Registry::lookupCachedUnit(const QUrl &url) {
    if (url.scheme() != QLatin1String("qrc"))
        return nullptr;
    QString resourcePath = QDir::cleanPath(url.path());
    if (resourcePath.isEmpty())
        return nullptr;
    if (!resourcePath.startsWith(QLatin1Char('/')))
        resourcePath.prepend(QLatin1Char('/'));
    return unitRegistry()->resourcePathToCachedUnit.value(resourcePath, nullptr);
}
}
int QT_MANGLE_NAMESPACE(qInitResources_qmlcache_appAutoLogin)() {
    ::unitRegistry();
    return 1;
}
Q_CONSTRUCTOR_FUNCTION(QT_MANGLE_NAMESPACE(qInitResources_qmlcache_appAutoLogin))
int QT_MANGLE_NAMESPACE(qCleanupResources_qmlcache_appAutoLogin)() {
    return 1;
}
