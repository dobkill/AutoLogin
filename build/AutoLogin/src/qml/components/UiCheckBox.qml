import QtQuick
import QtQuick.Controls

CheckBox {
    id: root

    implicitWidth: 22
    implicitHeight: 22

    Theme { id: theme }

    indicator: Rectangle {
        width: 16
        height: 16
        x: (root.width - width) / 2
        y: (root.height - height) / 2
        radius: 4
        color: root.checked ? theme.primary : theme.surface
        border.color: root.checked ? theme.primary : theme.border
        border.width: 1

        Text {
            anchors.centerIn: parent
            visible: root.checked
            text: "\u2713"
            font.pixelSize: 11
            font.weight: Font.Bold
            color: "#ffffff"
        }
    }

    contentItem: Item {}
}
