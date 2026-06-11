import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: sidebar

    color: "#ffffff"
    border.color: "#d9e1ec"
    border.width: 0

    property int currentPage: 0
    signal pageSelected(int index)

    // 导航项数据
    property var navItems: [
        { name: "首页",     icon: "\u2302" },
        { name: "站点管理", icon: "\u25A6" },
        { name: "登录配置", icon: "\u27F3" },
        { name: "网卡扫描", icon: "\u25A3" },
        { name: "系统设置", icon: "\u2699" }
    ]

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 0
        spacing: 0

        // Logo 区域
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 58
            color: "transparent"

            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 16
                spacing: 10

                // Logo 图标
                Rectangle {
                    width: 32
                    height: 32
                    radius: 16
                    color: "#1677ff"

                    Text {
                        anchors.centerIn: parent
                        text: "\u25C7"
                        color: "#ffffff"
                        font.pixelSize: 16
                        font.weight: Font.Bold
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }

                Text {
                    text: "自动登录器"
                    font.pixelSize: 18
                    font.weight: Font.Bold
                    font.family: "Inter"
                    color: "#172033"
                }
            }
        }

        // 分隔线
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 1
            color: "#d9e1ec"
        }

        // 导航列表
        ListView {
            id: navList
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.topMargin: 8
            model: navItems.length
            spacing: 2
            clip: true

            delegate: ItemDelegate {
                width: navList.width
                height: 44
                highlighted: sidebar.currentPage === index

                background: Rectangle {
                    color: sidebar.currentPage === index ? "#e8f0fe" : "transparent"
                    radius: 6

                    // 左侧指示条
                    Rectangle {
                        visible: sidebar.currentPage === index
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        width: 3
                        height: 24
                        radius: 1.5
                        color: "#1677ff"
                    }
                }

                contentItem: RowLayout {
                    spacing: 10

                    Text {
                        text: navItems[index].icon
                        font.pixelSize: 16
                        font.weight: Font.Bold
                        color: sidebar.currentPage === index ? "#1677ff" : "#6b7280"
                        Layout.leftMargin: 20
                    }

                    Text {
                        text: navItems[index].name
                        font.pixelSize: 14
                        font.family: "Inter"
                        color: sidebar.currentPage === index ? "#1677ff" : "#374151"
                        font.weight: sidebar.currentPage === index ? Font.DemiBold : Font.Normal
                    }
                }

                onClicked: sidebar.pageSelected(index)
            }
        }

        // 底部状态栏
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 60
            color: "transparent"

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 12
                spacing: 2

                Text {
                    text: "● 服务运行中"
                    font.pixelSize: 12
                    color: "#22c55e"
                    font.family: "Inter"
                }

                Text {
                    text: "版本 1.0.0"
                    font.pixelSize: 11
                    color: "#9ca3af"
                    font.family: "Inter"
                }
            }
        }
    }
}
