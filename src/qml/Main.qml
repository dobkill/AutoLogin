import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "components"
import "pages"

ApplicationWindow {
    id: window

    width: 1360
    height: 900
    minimumWidth: 1080
    minimumHeight: 720
    visible: !autoLoginMode
    title: "自动登录器"
    color: theme.page
    font.family: theme.fontFamily

    property int currentPage: 0
    property var pageModel: [
        { name: "首页", icon: "\u2302" },
        { name: "站点管理", icon: "\u25A6" },
        { name: "登录配置", icon: "API" },
        { name: "网卡扫描", icon: "\u25A3" },
        { name: "系统设置", icon: "\u2699" }
    ]

    Theme { id: theme }

    function navigateTo(index, properties) {
        if (index < 0 || index >= pages.length)
            return

        window.currentPage = index
        stackView.replace(pages[index], properties || {})
    }

    property var pages: []

    Component.onCompleted: {
        pages = [
            homePageComponent,
            siteManagerPageComponent,
            loginPageComponent,
            networkPageComponent,
            settingsPageComponent
        ]
    }

    onClosing: function(close) {
        if (appController.settings.minimizeToTray) {
            close.accepted = false
            window.showMinimized()
        }
    }

    RowLayout {
        anchors.fill: parent
        spacing: 0

        AppSidebar {
            Layout.fillHeight: true
            Layout.preferredWidth: 224
            currentPage: window.currentPage
            onPageSelected: function(index) {
                window.navigateTo(index)
            }
        }

        ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 0

            AppHeader {
                Layout.fillWidth: true
                Layout.preferredHeight: 64
                title: pageModel[currentPage].name
            }

            StackView {
                id: stackView
                Layout.fillWidth: true
                Layout.fillHeight: true
                clip: true
                initialItem: homePageComponent

                replaceEnter: Transition {
                    NumberAnimation { property: "opacity"; from: 0; to: 1; duration: 140; easing.type: Easing.OutCubic }
                }

                replaceExit: Transition {
                    NumberAnimation { property: "opacity"; from: 1; to: 0; duration: 80; easing.type: Easing.OutCubic }
                }
            }
        }
    }

    Component {
        id: homePageComponent
        HomePage {
            onNavigateRequested: function(pageIndex) {
                window.navigateTo(pageIndex)
            }
        }
    }

    Component {
        id: siteManagerPageComponent
        SiteManagerPage {
            onEditRequested: function(siteId) {
                window.navigateTo(2, { editingConfigId: siteId })
            }
        }
    }

    Component {
        id: loginPageComponent
        LoginPage {
            onSaved: function() {
                window.navigateTo(1)
            }
        }
    }

    Component {
        id: networkPageComponent
        NetworkPage {}
    }

    Component {
        id: settingsPageComponent
        SettingsPage {}
    }
}
