import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    property string text: ""
    property string icon: ""
    property string variant: "primary"
    property bool compact: false
    property int minimumWidth: 0
    signal clicked()

    implicitWidth: Math.max(minimumWidth, contentRow.implicitWidth + (compact ? 22 : 28))
    implicitHeight: compact ? 32 : theme.controlHeight
    radius: theme.radius
    opacity: enabled ? 1.0 : 0.55

    color: {
        if (!enabled)
            return theme.surfaceStrong
        if (variant === "primary")
            return buttonMouse.pressed ? theme.primaryPressed : (buttonMouse.containsMouse ? theme.primaryHover : theme.primary)
        if (variant === "danger")
            return buttonMouse.containsMouse ? "#ffe4e6" : theme.dangerSoft
        if (variant === "success")
            return buttonMouse.containsMouse ? "#dcfce7" : theme.successSoft
        if (variant === "ghost")
            return buttonMouse.containsMouse ? theme.surfaceStrong : "transparent"
        return buttonMouse.containsMouse ? theme.surfaceStrong : theme.surface
    }

    border.width: variant === "secondary" ? 1 : 0
    border.color: theme.border

    Theme { id: theme }

    RowLayout {
        id: contentRow
        anchors.centerIn: parent
        spacing: root.icon.length > 0 ? 7 : 0

        Text {
            visible: root.icon.length > 0
            text: root.icon
            font.pixelSize: root.compact ? 12 : 13
            font.weight: Font.DemiBold
            color: label.color
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            id: label
            text: root.text
            font.pixelSize: root.compact ? 12 : 13
            font.weight: Font.DemiBold
            font.family: theme.fontFamily
            color: {
                if (root.variant === "primary")
                    return "#ffffff"
                if (root.variant === "danger")
                    return theme.danger
                if (root.variant === "success")
                    return theme.success
                return theme.text
            }
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    MouseArea {
        id: buttonMouse
        anchors.fill: parent
        enabled: root.enabled
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: root.clicked()
    }
}
