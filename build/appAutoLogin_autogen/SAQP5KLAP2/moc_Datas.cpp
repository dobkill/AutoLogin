/****************************************************************************
** Meta object code from reading C++ file 'Datas.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.2.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../../include/Datas/Datas.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'Datas.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 68
#error "This file was generated using the moc from 6.2.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_Datas__Datas_t {
    const uint offsetsAndSize[16];
    char stringdata0[119];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(offsetof(qt_meta_stringdata_Datas__Datas_t, stringdata0) + ofs), len 
static const qt_meta_stringdata_Datas__Datas_t qt_meta_stringdata_Datas__Datas = {
    {
QT_MOC_LITERAL(0, 12), // "Datas::Datas"
QT_MOC_LITERAL(13, 18), // "loginConfigChanged"
QT_MOC_LITERAL(32, 0), // ""
QT_MOC_LITERAL(33, 2), // "id"
QT_MOC_LITERAL(36, 22), // "loginConfigListChanged"
QT_MOC_LITERAL(59, 22), // "networkCardListChanged"
QT_MOC_LITERAL(82, 20), // "networkStatusChanged"
QT_MOC_LITERAL(103, 15) // "settingsChanged"

    },
    "Datas::Datas\0loginConfigChanged\0\0id\0"
    "loginConfigListChanged\0networkCardListChanged\0"
    "networkStatusChanged\0settingsChanged"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Datas__Datas[] = {

 // content:
      10,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       5,       // signalCount

 // signals: name, argc, parameters, tag, flags, initial metatype offsets
       1,    1,   44,    2, 0x06,    1 /* Public */,
       4,    0,   47,    2, 0x06,    3 /* Public */,
       5,    0,   48,    2, 0x06,    4 /* Public */,
       6,    0,   49,    2, 0x06,    5 /* Public */,
       7,    0,   50,    2, 0x06,    6 /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::QString,    3,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

void Datas::Datas::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<Datas *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->loginConfigChanged((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1]))); break;
        case 1: _t->loginConfigListChanged(); break;
        case 2: _t->networkCardListChanged(); break;
        case 3: _t->networkStatusChanged(); break;
        case 4: _t->settingsChanged(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (Datas::*)(const QString & );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Datas::loginConfigChanged)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (Datas::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Datas::loginConfigListChanged)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (Datas::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Datas::networkCardListChanged)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (Datas::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Datas::networkStatusChanged)) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (Datas::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Datas::settingsChanged)) {
                *result = 4;
                return;
            }
        }
    }
}

const QMetaObject Datas::Datas::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_Datas__Datas.offsetsAndSize,
    qt_meta_data_Datas__Datas,
    qt_static_metacall,
    nullptr,
qt_incomplete_metaTypeArray<qt_meta_stringdata_Datas__Datas_t
, QtPrivate::TypeAndForceComplete<Datas, std::true_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<const QString &, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>



>,
    nullptr
} };


const QMetaObject *Datas::Datas::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Datas::Datas::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_Datas__Datas.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int Datas::Datas::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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
void Datas::Datas::loginConfigChanged(const QString & _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void Datas::Datas::loginConfigListChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void Datas::Datas::networkCardListChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void Datas::Datas::networkStatusChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void Datas::Datas::settingsChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
