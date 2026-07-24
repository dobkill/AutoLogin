import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    property alias text: input.text
    property string placeholder: ""
    property string prefix: ""
    property bool password: false
    property string fontFamily: theme.fontFamily

    implicitHeight: theme.controlHeight
    radius: theme.radius
    color: theme.surface
    border.color: input.activeFocus ? theme.primary : theme.border
    border.width: 1

    Theme { id: theme }

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 12
        anchors.rightMargin: 12
        spacing: 8

        Text {
            visible: root.prefix.length > 0
            text: root.prefix
            font.pixelSize: 13
            font.weight: Font.DemiBold
            color: theme.textSoft
        }

        TextInput {
            id: input
            Layout.fillWidth: true
            font.pixelSize: 13
            font.family: root.fontFamily
            color: theme.text
            selectionColor: theme.primarySoft
            selectedTextColor: theme.text
            verticalAlignment: Text.AlignVCenter
            echoMode: root.password ? TextInput.Password : TextInput.Normal

            Text {
                anchors.fill: parent
                text: root.placeholder
                font: parent.font
                color: theme.textSoft
                visible: parent.text.length === 0 && !parent.activeFocus
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
        }
    }
}
