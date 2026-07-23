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
    visible: true
    title: "自动登录器"
    color: theme.page
    font.family: theme.fontFamily

    property int currentPage: 0
    property var pageModel: [
        { name: "首页", icon: "\u2302", page: "pages/HomePage.qml" },
        { name: "站点管理", icon: "\u25A6", page: "pages/SiteManagerPage.qml" },
        { name: "登录配置", icon: "API", page: "pages/LoginPage.qml" },
        { name: "网卡扫描", icon: "\u25A3", page: "pages/NetworkPage.qml" },
        { name: "系统设置", icon: "\u2699", page: "pages/SettingsPage.qml" }
    ]

    Theme { id: theme }

    RowLayout {
        anchors.fill: parent
        spacing: 0

        AppSidebar {
            Layout.fillHeight: true
            Layout.preferredWidth: 224
            currentPage: window.currentPage
            onPageSelected: function(index) {
                if (window.currentPage === index)
                    return
                window.currentPage = index
                stackView.replace(pageModel[index].page)
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
                initialItem: "pages/HomePage.qml"

                replaceEnter: Transition {
                    NumberAnimation { property: "opacity"; from: 0; to: 1; duration: 140; easing.type: Easing.OutCubic }
                }

                replaceExit: Transition {
                    NumberAnimation { property: "opacity"; from: 1; to: 0; duration: 80; easing.type: Easing.OutCubic }
                }
            }
        }
    }
}
