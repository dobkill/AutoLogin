import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: sidebar

    property int currentPage: 0
    signal pageSelected(int index)

    property var navItems: [
        { name: "首页", icon: "\u2302" },
        { name: "站点管理", icon: "\u25A6" },
        { name: "登录配置", icon: "API" },
        { name: "网卡扫描", icon: "\u25A3" },
        { name: "系统设置", icon: "\u2699" }
    ]

    color: theme.surface
    border.color: theme.borderSoft
    border.width: 1

    Theme { id: theme }

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        RowLayout {
            Layout.fillWidth: true
            Layout.preferredHeight: 72
            Layout.leftMargin: 18
            Layout.rightMargin: 16
            spacing: 12

            Rectangle {
                Layout.preferredWidth: 38
                Layout.preferredHeight: 38
                radius: 9
                color: theme.primary

                Text {
                    anchors.centerIn: parent
                    text: "A"
                    font.pixelSize: 18
                    font.weight: Font.Black
                    font.family: theme.fontFamily
                    color: "#ffffff"
                }
            }

            ColumnLayout {
                Layout.fillWidth: true
                spacing: 1

                Text {
                    text: "自动登录器"
                    font.pixelSize: 17
                    font.weight: Font.Bold
                    font.family: theme.fontFamily
                    color: theme.text
                    elide: Text.ElideRight
                    Layout.fillWidth: true
                }

                Text {
                    text: "AutoLogin Console"
                    font.pixelSize: 11
                    font.family: theme.fontFamily
                    color: theme.textSoft
                    elide: Text.ElideRight
                    Layout.fillWidth: true
                }
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 1
            color: theme.borderSoft
        }

        ListView {
            id: navList
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.topMargin: 10
            Layout.bottomMargin: 10
            clip: true
            model: navItems.length
            spacing: 4

            delegate: Item {
                id: navDelegate

                width: navList.width
                height: 44
                property bool selected: sidebar.currentPage === index

                Rectangle {
                    id: navBackground
                    anchors.fill: parent
                    anchors.leftMargin: 12
                    anchors.rightMargin: 12
                    radius: theme.radius
                    color: navDelegate.selected ? theme.primarySoft : (navMouse.containsMouse ? theme.surfaceMuted : "transparent")

                    Behavior on color {
                        ColorAnimation { duration: 120 }
                    }

                    Rectangle {
                        visible: navDelegate.selected
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        width: 3
                        height: 22
                        radius: 2
                        color: theme.primary
                    }
                }

                RowLayout {
                    anchors.fill: navBackground
                    anchors.leftMargin: 15
                    anchors.rightMargin: 12
                    spacing: 10

                    Rectangle {
                        Layout.preferredWidth: 28
                        Layout.preferredHeight: 28
                        radius: 7
                        color: navDelegate.selected ? theme.tint(theme.primary, 0.12) : "transparent"

                        Text {
                            anchors.centerIn: parent
                            text: navItems[index].icon
                            font.pixelSize: navItems[index].icon === "API" ? 10 : 15
                            font.weight: Font.Bold
                            font.family: theme.fontFamily
                            color: navDelegate.selected ? theme.primary : theme.textMuted
                        }
                    }

                    Text {
                        text: navItems[index].name
                        font.pixelSize: 14
                        font.weight: navDelegate.selected ? Font.DemiBold : Font.Medium
                        font.family: theme.fontFamily
                        color: navDelegate.selected ? theme.primary : theme.text
                        elide: Text.ElideRight
                        Layout.fillWidth: true
                    }
                }

                MouseArea {
                    id: navMouse
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: sidebar.pageSelected(index)
                }
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 86
            color: "transparent"

            Rectangle {
                anchors.fill: parent
                anchors.leftMargin: 12
                anchors.rightMargin: 12
                anchors.topMargin: 8
                anchors.bottomMargin: 12
                radius: theme.radius
                color: theme.surfaceMuted
                border.color: theme.borderSoft
                border.width: 1

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 12
                    spacing: 10

                    Rectangle {
                        Layout.preferredWidth: 10
                        Layout.preferredHeight: 10
                        radius: 5
                        color: appController.busy ? theme.warning : (appController.networkStatus.isOnline ? theme.success : theme.danger)
                    }

                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 1

                        Text {
                            text: appController.busy ? "任务执行中" : (appController.networkStatus.isOnline ? "网络已连接" : "网络未连接")
                            font.pixelSize: 12
                            font.weight: Font.DemiBold
                            font.family: theme.fontFamily
                            color: theme.text
                        }

                        Text {
                            text: appController.networkStatus.primaryIP || "v1.0.0"
                            font.pixelSize: 11
                            font.family: theme.fontFamily
                            color: theme.textSoft
                        }
                    }
                }
            }
        }
    }
}
