import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

Rectangle {
    id: header

    property string title: "首页"

    color: theme.surface
    border.color: theme.borderSoft
    border.width: 0

    Theme { id: theme }

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 24
        anchors.rightMargin: 14
        spacing: 12

        ColumnLayout {
            Layout.fillWidth: true
            spacing: 1

            Text {
                text: header.title
                font.pixelSize: 18
                font.weight: Font.Bold
                font.family: theme.fontFamily
                color: theme.text
                elide: Text.ElideRight
                Layout.fillWidth: true
            }

            Text {
                text: "网络出口与自动登录任务状态"
                font.pixelSize: 11
                font.family: theme.fontFamily
                color: theme.textSoft
                elide: Text.ElideRight
                Layout.fillWidth: true
            }
        }

        InfoChip {
            Layout.maximumWidth: 330
            icon: "\u25A3"
            text: appController.primaryNetworkLabel
            accent: theme.accent
        }

        InfoChip {
            id: clockChip
            icon: "\u25F7"
            text: Qt.formatDateTime(new Date(), "yyyy-MM-dd hh:mm:ss")
            accent: theme.primary
        }

        RowLayout {
            spacing: 4

            WindowButton {
                symbol: "\u2212"
                onClicked: Window.window.showMinimized()
            }

            WindowButton {
                symbol: "\u25A1"
                symbolSize: 13
                onClicked: {
                    if (Window.window.visibility === Window.Maximized)
                        Window.window.showNormal()
                    else
                        Window.window.showMaximized()
                }
            }

            WindowButton {
                symbol: "\u00D7"
                danger: true
                symbolSize: 19
                onClicked: {
                    if (appController.settings.minimizeToTray)
                        Window.window.showMinimized()
                    else
                        Qt.quit()
                }
            }
        }
    }

    Rectangle {
        anchors.bottom: parent.bottom
        width: parent.width
        height: 1
        color: theme.borderSoft
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: clockChip.text = Qt.formatDateTime(new Date(), "yyyy-MM-dd hh:mm:ss")
    }

    component InfoChip: Rectangle {
        property string icon: ""
        property string text: ""
        property color accent: theme.primary

        implicitWidth: Math.min(chipContent.implicitWidth + 22, 360)
        implicitHeight: 32
        radius: 16
        color: theme.surfaceMuted
        border.color: theme.borderSoft
        border.width: 1

        RowLayout {
            id: chipContent
            anchors.fill: parent
            anchors.leftMargin: 10
            anchors.rightMargin: 10
            spacing: 7

            Text {
                text: icon
                font.pixelSize: 12
                font.weight: Font.Bold
                color: accent
            }

            Text {
                text: parent.parent.text
                font.pixelSize: 12
                font.family: theme.fontFamily
                color: theme.textMuted
                elide: Text.ElideRight
                Layout.fillWidth: true
            }
        }
    }

    component WindowButton: Rectangle {
        property string symbol: ""
        property int symbolSize: 16
        property bool danger: false
        signal clicked()

        Layout.preferredWidth: 32
        Layout.preferredHeight: 32
        radius: 8
        color: buttonMouse.containsMouse ? (danger ? theme.dangerSoft : theme.surfaceStrong) : "transparent"

        Text {
            anchors.centerIn: parent
            text: symbol
            font.pixelSize: symbolSize
            font.weight: Font.DemiBold
            color: danger && buttonMouse.containsMouse ? theme.danger : theme.textMuted
        }

        MouseArea {
            id: buttonMouse
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: parent.clicked()
        }
    }
}
