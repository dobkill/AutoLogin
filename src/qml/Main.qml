import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "components"
import "pages"

ApplicationWindow {
    id: window
    width: 1440
    height: 1024
    visible: true
    title: "自动登录器"
    color: "#f7f9fc"

    // 当前选中页面索引
    property int currentPage: 0

    // 页面列表模型
    property var pageModel: [
        { name: "首页",     icon: "\u2302", page: "pages/HomePage.qml" },
        { name: "站点管理", icon: "\u25A6", page: "pages/SiteManagerPage.qml" },
        { name: "登录配置", icon: "\u27F3", page: "pages/LoginPage.qml" },
        { name: "网卡扫描", icon: "\u25A3", page: "pages/NetworkPage.qml" },
        { name: "系统设置", icon: "\u2699", page: "pages/SettingsPage.qml" }
    ]

    RowLayout {
        anchors.fill: parent
        spacing: 0

        // 左侧导航栏
        AppSidebar {
            Layout.fillHeight: true
            Layout.preferredWidth: 200
            currentPage: window.currentPage
            onPageSelected: function(index) {
                window.currentPage = index
                stackView.replace(pageModel[index].page)
            }
        }

        // 右侧内容区
        ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 0

            // 顶部标题栏
            AppHeader {
                Layout.fillWidth: true
                Layout.preferredHeight: 58
                title: pageModel[currentPage].name
            }

            // 页面内容
            StackView {
                id: stackView
                Layout.fillWidth: true
                Layout.fillHeight: true
                initialItem: "pages/HomePage.qml"
            }
        }
    }
}
