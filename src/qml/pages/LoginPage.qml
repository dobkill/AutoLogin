import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"

Rectangle {
    id: loginPage

    property int currentTab: 0

    color: theme.page

    Theme { id: theme }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 24
        spacing: 16

        RowLayout {
            Layout.fillWidth: true
            spacing: 12

            ColumnLayout {
                Layout.fillWidth: true
                spacing: 2

                Text {
                    text: "登录配置"
                    font.pixelSize: 20
                    font.weight: Font.Bold
                    font.family: theme.fontFamily
                    color: theme.text
                }

                Text {
                    text: currentTab === 0 ? "内部系统 / API 登录" : "外部认证网关 / WebView 登录"
                    font.pixelSize: 12
                    font.family: theme.fontFamily
                    color: theme.textSoft
                }
            }

            Rectangle {
                Layout.preferredWidth: 282
                Layout.preferredHeight: 40
                radius: theme.radius
                color: theme.surfaceStrong
                border.color: theme.borderSoft
                border.width: 1

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 4
                    spacing: 4

                    TabButton {
                        Layout.fillWidth: true
                        text: "API 登录"
                        selected: currentTab === 0
                        onClicked: currentTab = 0
                    }

                    TabButton {
                        Layout.fillWidth: true
                        text: "WebView 登录"
                        selected: currentTab === 1
                        onClicked: currentTab = 1
                    }
                }
            }
        }

        UiCard {
            Layout.fillWidth: true
            Layout.fillHeight: true
            padding: 0

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 22
                spacing: 18
                visible: currentTab === 0

                GridLayout {
                    Layout.fillWidth: true
                    columns: 2
                    columnSpacing: 16
                    rowSpacing: 12

                    ColumnLayout {
                        Layout.fillWidth: true
                        Layout.columnSpan: 2
                        spacing: 7

                        FieldLabel { text: "请求 URL" }
                        UiTextField {
                            Layout.fillWidth: true
                            placeholder: "https://example.com/api/login"
                            prefix: "URL"
                        }
                    }

                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 7

                        FieldLabel { text: "请求方法" }
                        UiComboBox {
                            Layout.fillWidth: true
                            model: ["POST", "GET", "PUT"]
                        }
                    }

                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 7

                        FieldLabel { text: "绑定网卡" }
                        UiComboBox {
                            Layout.fillWidth: true
                            model: ["以太网 1 / 192.168.1.20", "Wi-Fi / 192.168.31.15"]
                        }
                    }
                }

                RowLayout {
                    Layout.fillWidth: true
                    spacing: 8

                    FieldLabel {
                        text: "请求参数"
                        Layout.fillWidth: true
                    }

                    UiButton {
                        text: "添加参数"
                        icon: "+"
                        variant: "secondary"
                        compact: true
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 38
                    radius: theme.radius
                    color: theme.surfaceMuted

                    RowLayout {
                        anchors.fill: parent
                        anchors.leftMargin: 12
                        anchors.rightMargin: 12
                        spacing: 10

                        TableHead { text: "Key"; Layout.preferredWidth: 230 }
                        TableHead { text: "Value"; Layout.fillWidth: true }
                    }
                }

                ListView {
                    id: apiParamList
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    clip: true
                    spacing: 8
                    model: ListModel {
                        ListElement { pKey: "username"; pValue: "admin" }
                        ListElement { pKey: "password"; pValue: "******" }
                    }

                    delegate: RowLayout {
                        width: apiParamList.width
                        height: 40
                        spacing: 10

                        UiTextField {
                            Layout.preferredWidth: 230
                            text: model.pKey
                        }

                        UiTextField {
                            Layout.fillWidth: true
                            text: model.pValue
                            password: model.pKey === "password"
                        }
                    }
                }

                RowLayout {
                    Layout.fillWidth: true
                    spacing: 10

                    Item { Layout.fillWidth: true }

                    UiButton {
                        text: "测试登录"
                        variant: "secondary"
                        minimumWidth: 92
                    }

                    UiButton {
                        text: "保存配置"
                        variant: "primary"
                        minimumWidth: 92
                    }
                }
            }

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 22
                spacing: 18
                visible: currentTab === 1

                RowLayout {
                    Layout.fillWidth: true
                    spacing: 8

                    FieldLabel {
                        text: "URL 访问序列"
                        Layout.fillWidth: true
                    }

                    UiButton {
                        text: "添加 URL"
                        icon: "+"
                        variant: "secondary"
                        compact: true
                    }
                }

                ListView {
                    id: urlList
                    Layout.fillWidth: true
                    Layout.preferredHeight: 104
                    clip: true
                    spacing: 8
                    model: ListModel {
                        ListElement { urlIndex: 1; url: "https://portal.example.com/login" }
                        ListElement { urlIndex: 2; url: "https://portal.example.com/auth" }
                    }

                    delegate: Rectangle {
                        width: urlList.width
                        height: 44
                        radius: theme.radius
                        color: theme.surfaceMuted
                        border.color: theme.borderSoft
                        border.width: 1

                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 12
                            anchors.rightMargin: 12
                            spacing: 10

                            Rectangle {
                                Layout.preferredWidth: 24
                                Layout.preferredHeight: 24
                                radius: 12
                                color: theme.primarySoft

                                Text {
                                    anchors.centerIn: parent
                                    text: model.urlIndex
                                    font.pixelSize: 12
                                    font.weight: Font.Bold
                                    font.family: theme.fontFamily
                                    color: theme.primary
                                }
                            }

                            Text {
                                text: model.url
                                font.pixelSize: 13
                                font.family: theme.fontFamily
                                color: theme.text
                                elide: Text.ElideRight
                                Layout.fillWidth: true
                            }
                        }
                    }
                }

                RowLayout {
                    Layout.fillWidth: true
                    spacing: 8

                    FieldLabel {
                        text: "操作流程配置"
                        Layout.fillWidth: true
                    }

                    UiButton {
                        text: "添加步骤"
                        icon: "+"
                        variant: "secondary"
                        compact: true
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 38
                    radius: theme.radius
                    color: theme.surfaceMuted

                    RowLayout {
                        anchors.fill: parent
                        anchors.leftMargin: 12
                        anchors.rightMargin: 12
                        spacing: 10

                        TableHead { text: "XPath"; Layout.fillWidth: true }
                        TableHead { text: "操作类型"; Layout.preferredWidth: 118 }
                        TableHead { text: "值"; Layout.preferredWidth: 150 }
                    }
                }

                ListView {
                    id: webStepList
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    clip: true
                    spacing: 8
                    model: ListModel {
                        ListElement { xpath: "//input[@id='username']"; opType: "input"; opValue: "admin" }
                        ListElement { xpath: "//input[@id='password']"; opType: "input"; opValue: "******" }
                        ListElement { xpath: "//button[@type='submit']"; opType: "click"; opValue: "" }
                    }

                    delegate: RowLayout {
                        width: webStepList.width
                        height: 40
                        spacing: 10
                        property string stepType: model.opType

                        UiTextField {
                            Layout.fillWidth: true
                            text: model.xpath
                            fontFamily: theme.monoFontFamily
                        }

                        UiComboBox {
                            Layout.preferredWidth: 118
                            model: ["click", "input", "wait"]
                            currentIndex: stepType === "click" ? 0 : (stepType === "input" ? 1 : 2)
                        }

                        UiTextField {
                            Layout.preferredWidth: 150
                            text: model.opValue
                            password: stepType === "input" && model.opValue === "******"
                        }
                    }
                }

                RowLayout {
                    Layout.fillWidth: true
                    spacing: 16

                    ColumnLayout {
                        Layout.preferredWidth: 320
                        spacing: 7

                        FieldLabel { text: "绑定网卡" }
                        UiComboBox {
                            Layout.fillWidth: true
                            model: ["以太网 1 / 192.168.1.20", "Wi-Fi / 192.168.31.15"]
                        }
                    }

                    Item { Layout.fillWidth: true }

                    UiButton {
                        text: "预览测试"
                        variant: "secondary"
                        minimumWidth: 92
                    }

                    UiButton {
                        text: "保存配置"
                        variant: "primary"
                        minimumWidth: 92
                    }
                }
            }
        }
    }

    component TabButton: Rectangle {
        property string text: ""
        property bool selected: false
        signal clicked()

        radius: theme.radius - 2
        color: selected ? theme.surface : "transparent"
        border.color: selected ? theme.borderSoft : "transparent"
        border.width: selected ? 1 : 0

        Text {
            anchors.centerIn: parent
            text: parent.text
            font.pixelSize: 13
            font.weight: parent.selected ? Font.DemiBold : Font.Medium
            font.family: theme.fontFamily
            color: parent.selected ? theme.primary : theme.textMuted
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: parent.clicked()
        }
    }

    component FieldLabel: Text {
        font.pixelSize: 13
        font.weight: Font.DemiBold
        font.family: theme.fontFamily
        color: theme.text
    }

    component TableHead: Text {
        font.pixelSize: 12
        font.weight: Font.DemiBold
        font.family: theme.fontFamily
        color: theme.textMuted
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }
}
