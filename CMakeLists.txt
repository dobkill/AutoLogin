cmake_minimum_required(VERSION 3.16)

project(AutoLogin VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 6.2 REQUIRED COMPONENTS Quick QuickControls2 Network Sql Concurrent WebEngineCore WebEngineQuick)

if(COMMAND qt_standard_project_setup)
    qt_standard_project_setup(REQUIRES 6.2)
endif()

# C++ 可执行文件
qt_add_executable(appAutoLogin
    src/main.cc
    include/Datas/Datas.h
    src/Datas/Datas.cpp
    include/network_service/NetworkService.h
    src/network_service/NetworkService.cpp
    include/login_engine/LoginEngine.h
    src/login_engine/LoginEngine.cpp
    include/app/AppController.h
    src/app/AppController.cpp
)

target_include_directories(appAutoLogin
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/include
)

# QML 模块 — 所有 QML 文件在此注册
qt_add_qml_module(appAutoLogin
    URI AutoLogin
    VERSION 1.0
    QML_FILES
        src/qml/Main.qml
        src/qml/components/Theme.qml
        src/qml/components/UiCard.qml
        src/qml/components/UiButton.qml
        src/qml/components/UiComboBox.qml
        src/qml/components/UiSwitch.qml
        src/qml/components/UiCheckBox.qml
        src/qml/components/UiTextField.qml
        src/qml/components/AppSidebar.qml
        src/qml/components/AppHeader.qml
        src/qml/components/WebRecorderUnavailable.qml
        src/qml/components/WebRecorderView.qml
        src/qml/pages/HomePage.qml
        src/qml/pages/SiteManagerPage.qml
        src/qml/pages/LoginPage.qml
        src/qml/pages/NetworkPage.qml
        src/qml/pages/SettingsPage.qml
)

# Windows 平台下不显示控制台窗口
set_target_properties(appAutoLogin PROPERTIES
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appAutoLogin
    PRIVATE
        Qt6::Quick
        Qt6::QuickControls2
        Qt6::Network
        Qt6::Sql
        Qt6::Concurrent
        Qt6::WebEngineCore
        Qt6::WebEngineQuick
)

target_compile_definitions(appAutoLogin PRIVATE AUTOLOGIN_WITH_WEBENGINE)

include(GNUInstallDirs)
install(TARGETS appAutoLogin
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
