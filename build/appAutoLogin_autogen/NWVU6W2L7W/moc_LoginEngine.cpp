/****************************************************************************
** Meta object code from reading C++ file 'LoginEngine.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.2.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../../include/login_engine/LoginEngine.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'LoginEngine.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 68
#error "This file was generated using the moc from 6.2.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_Login__LoginEngine_t {
    const uint offsetsAndSize[50];
    char stringdata0[281];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(offsetof(qt_meta_stringdata_Login__LoginEngine_t, stringdata0) + ofs), len 
static const qt_meta_stringdata_Login__LoginEngine_t qt_meta_stringdata_Login__LoginEngine = {
    {
QT_MOC_LITERAL(0, 18), // "Login::LoginEngine"
QT_MOC_LITERAL(19, 11), // "busyChanged"
QT_MOC_LITERAL(31, 0), // ""
QT_MOC_LITERAL(32, 18), // "lastMessageChanged"
QT_MOC_LITERAL(51, 14), // "historyChanged"
QT_MOC_LITERAL(66, 16), // "loginResultReady"
QT_MOC_LITERAL(83, 6), // "result"
QT_MOC_LITERAL(90, 13), // "batchFinished"
QT_MOC_LITERAL(104, 7), // "results"
QT_MOC_LITERAL(112, 13), // "quitRequested"
QT_MOC_LITERAL(126, 10), // "executeOne"
QT_MOC_LITERAL(137, 6), // "siteId"
QT_MOC_LITERAL(144, 12), // "executeBatch"
QT_MOC_LITERAL(157, 7), // "siteIds"
QT_MOC_LITERAL(165, 10), // "executeAll"
QT_MOC_LITERAL(176, 10), // "testConfig"
QT_MOC_LITERAL(187, 6), // "config"
QT_MOC_LITERAL(194, 9), // "logoutOne"
QT_MOC_LITERAL(204, 11), // "checkStatus"
QT_MOC_LITERAL(216, 12), // "setAutoLogin"
QT_MOC_LITERAL(229, 7), // "enabled"
QT_MOC_LITERAL(237, 18), // "silentLoginAndQuit"
QT_MOC_LITERAL(256, 4), // "busy"
QT_MOC_LITERAL(261, 11), // "lastMessage"
QT_MOC_LITERAL(273, 7) // "history"

    },
    "Login::LoginEngine\0busyChanged\0\0"
    "lastMessageChanged\0historyChanged\0"
    "loginResultReady\0result\0batchFinished\0"
    "results\0quitRequested\0executeOne\0"
    "siteId\0executeBatch\0siteIds\0executeAll\0"
    "testConfig\0config\0logoutOne\0checkStatus\0"
    "setAutoLogin\0enabled\0silentLoginAndQuit\0"
    "busy\0lastMessage\0history"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Login__LoginEngine[] = {

 // content:
      10,       // revision
       0,       // classname
       0,    0, // classinfo
      14,   14, // methods
       3,  128, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       6,       // signalCount

 // signals: name, argc, parameters, tag, flags, initial metatype offsets
       1,    0,   98,    2, 0x06,    4 /* Public */,
       3,    0,   99,    2, 0x06,    5 /* Public */,
       4,    0,  100,    2, 0x06,    6 /* Public */,
       5,    1,  101,    2, 0x06,    7 /* Public */,
       7,    1,  104,    2, 0x06,    9 /* Public */,
       9,    0,  107,    2, 0x06,   11 /* Public */,

 // methods: name, argc, parameters, tag, flags, initial metatype offsets
      10,    1,  108,    2, 0x02,   12 /* Public */,
      12,    1,  111,    2, 0x02,   14 /* Public */,
      14,    0,  114,    2, 0x02,   16 /* Public */,
      15,    1,  115,    2, 0x02,   17 /* Public */,
      17,    1,  118,    2, 0x02,   19 /* Public */,
      18,    1,  121,    2, 0x02,   21 /* Public */,
      19,    1,  124,    2, 0x02,   23 /* Public */,
      21,    0,  127,    2, 0x02,   25 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QVariantMap,    6,
    QMetaType::Void, QMetaType::QVariantList,    8,
    QMetaType::Void,

 // methods: parameters
    QMetaType::Void, QMetaType::QString,   11,
    QMetaType::Void, QMetaType::QStringList,   13,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QVariantMap,   16,
    QMetaType::Void, QMetaType::QString,   11,
    QMetaType::Void, QMetaType::QString,   11,
    QMetaType::Void, QMetaType::Bool,   20,
    QMetaType::Void,

 // properties: name, type, flags
      22, QMetaType::Bool, 0x00015001, uint(0), 0,
      23, QMetaType::QString, 0x00015001, uint(1), 0,
      24, QMetaType::QVariantList, 0x00015001, uint(2), 0,

       0        // eod
};

void Login::LoginEngine::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<LoginEngine *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->busyChanged(); break;
        case 1: _t->lastMessageChanged(); break;
        case 2: _t->historyChanged(); break;
        case 3: _t->loginResultReady((*reinterpret_cast< std::add_pointer_t<QVariantMap>>(_a[1]))); break;
        case 4: _t->batchFinished((*reinterpret_cast< std::add_pointer_t<QVariantList>>(_a[1]))); break;
        case 5: _t->quitRequested(); break;
        case 6: _t->executeOne((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1]))); break;
        case 7: _t->executeBatch((*reinterpret_cast< std::add_pointer_t<QStringList>>(_a[1]))); break;
        case 8: _t->executeAll(); break;
        case 9: _t->testConfig((*reinterpret_cast< std::add_pointer_t<QVariantMap>>(_a[1]))); break;
        case 10: _t->logoutOne((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1]))); break;
        case 11: _t->checkStatus((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1]))); break;
        case 12: _t->setAutoLogin((*reinterpret_cast< std::add_pointer_t<bool>>(_a[1]))); break;
        case 13: _t->silentLoginAndQuit(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (LoginEngine::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&LoginEngine::busyChanged)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (LoginEngine::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&LoginEngine::lastMessageChanged)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (LoginEngine::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&LoginEngine::historyChanged)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (LoginEngine::*)(const QVariantMap & );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&LoginEngine::loginResultReady)) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (LoginEngine::*)(const QVariantList & );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&LoginEngine::batchFinished)) {
                *result = 4;
                return;
            }
        }
        {
            using _t = void (LoginEngine::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&LoginEngine::quitRequested)) {
                *result = 5;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<LoginEngine *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< bool*>(_v) = _t->busy(); break;
        case 1: *reinterpret_cast< QString*>(_v) = _t->lastMessage(); break;
        case 2: *reinterpret_cast< QVariantList*>(_v) = _t->history(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
    } else if (_c == QMetaObject::ResetProperty) {
    } else if (_c == QMetaObject::BindableProperty) {
    }
#endif // QT_NO_PROPERTIES
}

const QMetaObject Login::LoginEngine::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_Login__LoginEngine.offsetsAndSize,
    qt_meta_data_Login__LoginEngine,
    qt_static_metacall,
    nullptr,
qt_incomplete_metaTypeArray<qt_meta_stringdata_Login__LoginEngine_t
, QtPrivate::TypeAndForceComplete<bool, std::true_type>, QtPrivate::TypeAndForceComplete<QString, std::true_type>, QtPrivate::TypeAndForceComplete<QVariantList, std::true_type>, QtPrivate::TypeAndForceComplete<LoginEngine, std::true_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<const QVariantMap &, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<const QVariantList &, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>

, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<const QString &, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<const QStringList &, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<const QVariantMap &, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<const QString &, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<const QString &, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<bool, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>

>,
    nullptr
} };


const QMetaObject *Login::LoginEngine::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Login::LoginEngine::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_Login__LoginEngine.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int Login::LoginEngine::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 14)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 14;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 14)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 14;
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void Login::LoginEngine::busyChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void Login::LoginEngine::lastMessageChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void Login::LoginEngine::historyChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void Login::LoginEngine::loginResultReady(const QVariantMap & _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 3, _a);
}

// SIGNAL 4
void Login::LoginEngine::batchFinished(const QVariantList & _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 4, _a);
}

// SIGNAL 5
void Login::LoginEngine::quitRequested()
{
    QMetaObject::activate(this, &staticMetaObject, 5, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
