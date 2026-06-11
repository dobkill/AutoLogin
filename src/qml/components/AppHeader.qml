import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: header

    color: "#ffffff"
    border.color: "#d9e1ec"
    border.width: 0

    property string title: "首页"

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 24
        anchors.rightMargin: 16
        spacing: 12

        Text {
            text: header.title
            font.pixelSize: 18
            font.weight: Font.Bold
            font.family: "Inter"
            color: "#172033"
        }

        Item { Layout.fillWidth: true }

        // 网卡信息摘要
        Text {
            text: "\u25A3 当前网卡：以太网 1 / Intel Ethernet / 192.168.1.20"
            font.pixelSize: 12
            color: "#6b7280"
            font.family: "Inter"
        }

        // 系统时间
        Text {
            id: clockText
            text: "\u25F7 系统时间：" + Qt.formatDateTime(new Date(), "yyyy-MM-dd hh:mm:ss")
            font.pixelSize: 12
            color: "#6b7280"
            font.family: "Inter"

            Timer {
                interval: 1000
                running: true
                repeat: true
                onTriggered: clockText.text = "\u25F7 系统时间：" + Qt.formatDateTime(new Date(), "yyyy-MM-dd hh:mm:ss")
            }
        }

        // 最小化按钮
        Rectangle {
            width: 32
            height: 32
            radius: 6
            color: minimizeMouse.containsMouse ? "#f3f4f6" : "transparent"

            Text {
                anchors.centerIn: parent
                text: "\u2212"
                font.pixelSize: 18
                color: "#6b7280"
            }

            MouseArea {
                id: minimizeMouse
                anchors.fill: parent
                hoverEnabled: true
                onClicked: Window.window.showMinimized()
            }
        }

        // 最大化/还原按钮
        Rectangle {
            width: 32
            height: 32
            radius: 6
            color: maxMouse.containsMouse ? "#f3f4f6" : "transparent"

            Text {
                anchors.centerIn: parent
                text: "\u25A1"
                font.pixelSize: 14
                color: "#6b7280"
            }

            MouseArea {
                id: maxMouse
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    if (Window.window.visibility === Window.Maximized)
                        Window.window.showNormal()
                    else
                        Window.window.showMaximized()
                }
            }
        }

        // 关闭按钮
        Rectangle {
            width: 32
            height: 32
            radius: 6
            color: closeMouse.containsMouse ? "#fee2e2" : "transparent"

            Text {
                anchors.centerIn: parent
                text: "\u00D7"
                font.pixelSize: 20
                color: closeMouse.containsMouse ? "#ef4444" : "#6b7280"
            }

            MouseArea {
                id: closeMouse
                anchors.fill: parent
                hoverEnabled: true
                onClicked: Qt.quit()
            }
        }
    }

    // 底部分隔线
    Rectangle {
        anchors.bottom: parent.bottom
        width: parent.width
        height: 1
        color: "#d9e1ec"
    }
}
