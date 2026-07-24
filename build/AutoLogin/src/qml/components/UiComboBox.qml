import QtQuick
import QtQuick.Controls

ComboBox {
    id: root

    implicitHeight: theme.controlHeight
    font.pixelSize: 13
    font.family: theme.fontFamily
    leftPadding: 12
    rightPadding: 32

    Theme { id: theme }

    delegate: ItemDelegate {
        width: root.width
        height: 34
        highlighted: root.highlightedIndex === index

        contentItem: Text {
            text: modelData
            font.pixelSize: 13
            font.family: theme.fontFamily
            color: highlighted ? theme.primary : theme.text
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
        }

        background: Rectangle {
            color: highlighted ? theme.primarySoft : "transparent"
            radius: 6
        }
    }

    indicator: Text {
        x: root.width - width - 12
        y: root.topPadding + (root.availableHeight - height) / 2
        text: "\u2304"
        font.pixelSize: 14
        color: theme.textMuted
    }

    contentItem: Text {
        leftPadding: 12
        rightPadding: 32
        text: root.displayText
        font: root.font
        color: root.enabled ? theme.text : theme.textSoft
        elide: Text.ElideRight
        verticalAlignment: Text.AlignVCenter
    }

    background: Rectangle {
        radius: theme.radius
        color: root.enabled ? theme.surface : theme.surfaceStrong
        border.color: root.activeFocus ? theme.primary : theme.border
        border.width: 1
    }

    popup: Popup {
        y: root.height + 5
        width: root.width
        implicitHeight: Math.min(contentItem.implicitHeight + 8, 240)
        padding: 4

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: root.popup.visible ? root.delegateModel : null
            currentIndex: root.highlightedIndex
        }

        background: Rectangle {
            color: theme.surface
            radius: theme.radius
            border.color: theme.border
            border.width: 1
        }
    }
}
