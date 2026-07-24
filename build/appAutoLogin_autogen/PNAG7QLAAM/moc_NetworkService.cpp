/****************************************************************************
** Meta object code from reading C++ file 'NetworkService.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.2.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../../include/network_service/NetworkService.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'NetworkService.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 68
#error "This file was generated using the moc from 6.2.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_Network__NetworkService_t {
    const uint offsetsAndSize[16];
    char stringdata0[115];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(offsetof(qt_meta_stringdata_Network__NetworkService_t, stringdata0) + ofs), len 
static const qt_meta_stringdata_Network__NetworkService_t qt_meta_stringdata_Network__NetworkService = {
    {
QT_MOC_LITERAL(0, 23), // "Network::NetworkService"
QT_MOC_LITERAL(24, 19), // "networkCardsChanged"
QT_MOC_LITERAL(44, 0), // ""
QT_MOC_LITERAL(45, 20), // "networkStatusChanged"
QT_MOC_LITERAL(66, 6), // "status"
QT_MOC_LITERAL(73, 15), // "startMonitoring"
QT_MOC_LITERAL(89, 10), // "intervalMs"
QT_MOC_LITERAL(100, 14) // "stopMonitoring"

    },
    "Network::NetworkService\0networkCardsChanged\0"
    "\0networkStatusChanged\0status\0"
    "startMonitoring\0intervalMs\0stopMonitoring"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Network__NetworkService[] = {

 // content:
      10,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: name, argc, parameters, tag, flags, initial metatype offsets
       1,    0,   44,    2, 0x06,    1 /* Public */,
       3,    1,   45,    2, 0x06,    2 /* Public */,

 // methods: name, argc, parameters, tag, flags, initial metatype offsets
       5,    1,   48,    2, 0x02,    4 /* Public */,
       5,    0,   51,    2, 0x22,    6 /* Public | MethodCloned */,
       7,    0,   52,    2, 0x02,    7 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void, QMetaType::QVariantMap,    4,

 // methods: parameters
    QMetaType::Void, QMetaType::Int,    6,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

void Network::NetworkService::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<NetworkService *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->networkCardsChanged(); break;
        case 1: _t->networkStatusChanged((*reinterpret_cast< std::add_pointer_t<QVariantMap>>(_a[1]))); break;
        case 2: _t->startMonitoring((*reinterpret_cast< std::add_pointer_t<int>>(_a[1]))); break;
        case 3: _t->startMonitoring(); break;
        case 4: _t->stopMonitoring(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (NetworkService::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&NetworkService::networkCardsChanged)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (NetworkService::*)(const QVariantMap & );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&NetworkService::networkStatusChanged)) {
                *result = 1;
                return;
            }
        }
    }
}

const QMetaObject Network::NetworkService::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_Network__NetworkService.offsetsAndSize,
    qt_meta_data_Network__NetworkService,
    qt_static_metacall,
    nullptr,
qt_incomplete_metaTypeArray<qt_meta_stringdata_Network__NetworkService_t
, QtPrivate::TypeAndForceComplete<NetworkService, std::true_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<const QVariantMap &, std::false_type>

, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<int, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>

>,
    nullptr
} };


const QMetaObject *Network::NetworkService::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Network::NetworkService::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_Network__NetworkService.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int Network::NetworkService::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 5)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 5)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 5;
    }
    return _id;
}

// SIGNAL 0
void Network::NetworkService::networkCardsChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void Network::NetworkService::networkStatusChanged(const QVariantMap & _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
