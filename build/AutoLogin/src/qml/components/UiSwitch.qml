import QtQuick
import QtQuick.Controls

Switch {
    id: root

    implicitWidth: 44
    implicitHeight: 24

    Theme { id: theme }

    indicator: Rectangle {
        x: 0
        y: (root.height - height) / 2
        width: 42
        height: 24
        radius: 12
        color: root.checked ? theme.primary : theme.border

        Rectangle {
            width: 18
            height: 18
            radius: 9
            x: root.checked ? parent.width - width - 3 : 3
            y: 3
            color: "#ffffff"

            Behavior on x {
                NumberAnimation { duration: 140; easing.type: Easing.OutCubic }
            }
        }
    }

    contentItem: Item {}
}
