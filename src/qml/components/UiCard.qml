import QtQuick

Rectangle {
    id: root

    default property alias content: body.data
    property int padding: 16
    property color cardColor: theme.surface

    color: cardColor
    radius: theme.radius
    border.color: theme.borderSoft
    border.width: 1
    clip: true

    Theme { id: theme }

    Item {
        id: body
        anchors.fill: parent
        anchors.margins: root.padding
    }
}
