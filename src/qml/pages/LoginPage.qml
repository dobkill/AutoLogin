import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: loginPage
    color: "#f7f9fc"

    property int currentTab: 0  // 0: API, 1: WebView

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 16

        // 标题
        Text {
            text: "登录配置"
            font.pixelSize: 20
            font.weight: Font.Bold
            font.family: "Inter"
            color: "#172033"
        }

        // Tab 切换
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 40
            color: "transparent"

            RowLayout {
                anchors.fill: parent
                spacing: 4

                Rectangle {
                    Layout.preferredWidth: 120
                    Layout.preferredHeight: 36
                    radius: 8
                    color: currentTab === 0 ? "#1677ff" : "#ffffff"
                    border.color: currentTab === 0 ? "#1677ff" : "#d1d5db"
                    border.width: 1

                    Text {
                        anchors.centerIn: parent
                        text: "API 登录"
                        font.pixelSize: 13
                        font.weight: Font.Medium
                        font.family: "Inter"
                        color: currentTab === 0 ? "#ffffff" : "#374151"
                    }

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: currentTab = 0
                    }
                }

                Rectangle {
                    Layout.preferredWidth: 140
                    Layout.preferredHeight: 36
                    radius: 8
                    color: currentTab === 1 ? "#1677ff" : "#ffffff"
                    border.color: currentTab === 1 ? "#1677ff" : "#d1d5db"
                    border.width: 1

                    Text {
                        anchors.centerIn: parent
                        text: "WebView 登录"
                        font.pixelSize: 13
                        font.weight: Font.Medium
                        font.family: "Inter"
                        color: currentTab === 1 ? "#ffffff" : "#374151"
                    }

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: currentTab = 1
                    }
                }

                Item { Layout.fillWidth: true }
            }
        }

        // 配置表单区域
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#ffffff"
            radius: 10
            border.color: "#e5e7eb"
            border.width: 1

            // API 登录配置
            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 24
                spacing: 16
                visible: currentTab === 0

                // URL 输入
                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 6

                    Text {
                        text: "请求 URL"
                        font.pixelSize: 13
                        font.weight: Font.Medium
                        color: "#374151"
                        font.family: "Inter"
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 40
                        radius: 8
                        color: "#f9fafb"
                        border.color: "#d1d5db"
                        border.width: 1

                        TextInput {
                            anchors.fill: parent
                            anchors.margins: 12
                            font.pixelSize: 14
                            font.family: "Inter"
                            color: "#172033"
                            verticalAlignment: Text.AlignVCenter

                            Text {
                                anchors.fill: parent
                                text: "https://example.com/api/login"
                                font.pixelSize: 14
                                font.family: "Inter"
                                color: "#9ca3af"
                                visible: !parent.text && !parent.activeFocus
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                    }
                }

                // 请求方法 + 网卡选择
                RowLayout {
                    Layout.fillWidth: true
                    spacing: 16

                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 6

                        Text {
                            text: "请求方法"
                            font.pixelSize: 13
                            font.weight: Font.Medium
                            color: "#374151"
                            font.family: "Inter"
                        }

                        ComboBox {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 40
                            model: ["POST", "GET", "PUT"]
                            font.pixelSize: 14
                            font.family: "Inter"
                        }
                    }

                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 6

                        Text {
                            text: "绑定网卡"
                            font.pixelSize: 13
                            font.weight: Font.Medium
                            color: "#374151"
                            font.family: "Inter"
                        }

                        ComboBox {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 40
                            model: ["以太网 1 / 192.168.1.20", "Wi-Fi / 192.168.31.15"]
                            font.pixelSize: 14
                            font.family: "Inter"
                        }
                    }
                }

                // 请求参数
                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    spacing: 6

                    RowLayout {
                        Layout.fillWidth: true

                        Text {
                            text: "请求参数"
                            font.pixelSize: 13
                            font.weight: Font.Medium
                            color: "#374151"
                            font.family: "Inter"
                        }

                        Item { Layout.fillWidth: true }

                        Text {
                            text: "+ 添加参数"
                            font.pixelSize: 12
                            color: "#1677ff"
                            font.family: "Inter"

                            MouseArea {
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                            }
                        }
                    }

                    // 参数表头
                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 8

                        Text { text: "Key"; font.pixelSize: 12; font.weight: Font.Bold; color: "#6b7280"; Layout.preferredWidth: 200 }
                        Text { text: "Value"; font.pixelSize: 12; font.weight: Font.Bold; color: "#6b7280"; Layout.fillWidth: true }
                    }

                    // 参数行
                    ListView {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        clip: true
                        model: ListModel {
                            ListElement { pKey: "username"; pValue: "admin" }
                            ListElement { pKey: "password"; pValue: "******" }
                        }
                        spacing: 6

                        delegate: RowLayout {
                            width: ListView.view.width
                            spacing: 8

                            Rectangle {
                                Layout.preferredWidth: 200
                                Layout.preferredHeight: 36
                                radius: 6
                                color: "#f9fafb"
                                border.color: "#d1d5db"
                                border.width: 1

                                TextInput {
                                    anchors.fill: parent
                                    anchors.margins: 10
                                    text: model.pKey
                                    font.pixelSize: 13
                                    font.family: "Inter"
                                    color: "#172033"
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }

                            Rectangle {
                                Layout.fillWidth: true
                                Layout.preferredHeight: 36
                                radius: 6
                                color: "#f9fafb"
                                border.color: "#d1d5db"
                                border.width: 1

                                TextInput {
                                    anchors.fill: parent
                                    anchors.margins: 10
                                    text: model.pValue
                                    font.pixelSize: 13
                                    font.family: "Inter"
                                    color: "#172033"
                                    verticalAlignment: Text.AlignVCenter
                                    echoMode: model.pKey === "password" ? TextInput.Password : TextInput.Normal
                                }
                            }
                        }
                    }
                }

                // 操作按钮
                RowLayout {
                    Layout.fillWidth: true
                    spacing: 12

                    Item { Layout.fillWidth: true }

                    Button {
                        text: "测试登录"
                        font.pixelSize: 13
                        font.family: "Inter"

                        background: Rectangle {
                            radius: 8
                            color: "#ffffff"
                            border.color: "#1677ff"
                            border.width: 1
                        }

                        contentItem: Text {
                            text: parent.text
                            font: parent.font
                            color: "#1677ff"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Button {
                        text: "保存配置"
                        font.pixelSize: 13
                        font.family: "Inter"

                        background: Rectangle {
                            radius: 8
                            color: "#1677ff"
                        }

                        contentItem: Text {
                            text: parent.text
                            font: parent.font
                            color: "#ffffff"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }
            }

            // WebView 登录配置
            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 24
                spacing: 16
                visible: currentTab === 1

                // URL 列表
                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 6

                    RowLayout {
                        Layout.fillWidth: true

                        Text {
                            text: "URL 访问序列"
                            font.pixelSize: 13
                            font.weight: Font.Medium
                            color: "#374151"
                            font.family: "Inter"
                        }

                        Item { Layout.fillWidth: true }

                        Text {
                            text: "+ 添加 URL"
                            font.pixelSize: 12
                            color: "#1677ff"
                            font.family: "Inter"

                            MouseArea {
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                            }
                        }
                    }

                    ListView {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 120
                        clip: true
                        model: ListModel {
                            ListElement { urlIndex: 1; url: "https://portal.example.com/login" }
                            ListElement { urlIndex: 2; url: "https://portal.example.com/auth" }
                        }
                        spacing: 6

                        delegate: Rectangle {
                            width: ListView.view.width
                            height: 40
                            radius: 6
                            color: "#f9fafb"
                            border.color: "#d1d5db"
                            border.width: 1

                            RowLayout {
                                anchors.fill: parent
                                anchors.margins: 10
                                spacing: 8

                                Text {
                                    text: model.urlIndex + "."
                                    font.pixelSize: 13
                                    font.weight: Font.Bold
                                    color: "#1677ff"
                                }

                                Text {
                                    text: model.url
                                    font.pixelSize: 13
                                    color: "#172033"
                                    font.family: "Inter"
                                    Layout.fillWidth: true
                                }
                            }
                        }
                    }
                }

                // 操作流程配置
                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    spacing: 6

                    Text {
                        text: "操作流程配置 (XPath)"
                        font.pixelSize: 13
                        font.weight: Font.Medium
                        color: "#374151"
                        font.family: "Inter"
                    }

                    // 表头
                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 8

                        Text { text: "XPath";           font.pixelSize: 12; font.weight: Font.Bold; color: "#6b7280"; Layout.fillWidth: true }
                        Text { text: "操作类型";        font.pixelSize: 12; font.weight: Font.Bold; color: "#6b7280"; Layout.preferredWidth: 100 }
                        Text { text: "值";              font.pixelSize: 12; font.weight: Font.Bold; color: "#6b7280"; Layout.preferredWidth: 120 }
                    }

                    ListView {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        clip: true
                        model: ListModel {
                            ListElement { xpath: "//input[@id='username']"; opType: "input"; opValue: "admin" }
                            ListElement { xpath: "//input[@id='password']"; opType: "input"; opValue: "******" }
                            ListElement { xpath: "//button[@type='submit']"; opType: "click"; opValue: "" }
                        }
                        spacing: 6

                        delegate: RowLayout {
                            width: ListView.view.width
                            spacing: 8

                            Rectangle {
                                Layout.fillWidth: true
                                Layout.preferredHeight: 36
                                radius: 6
                                color: "#f9fafb"
                                border.color: "#d1d5db"
                                border.width: 1

                                TextInput {
                                    anchors.fill: parent
                                    anchors.margins: 10
                                    text: model.xpath
                                    font.pixelSize: 12
                                    font.family: "Consolas"
                                    color: "#172033"
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }

                            ComboBox {
                                Layout.preferredWidth: 100
                                Layout.preferredHeight: 36
                                model: ["click", "input", "wait"]
                                currentIndex: model.opType === "click" ? 0 : (model.opType === "input" ? 1 : 2)
                                font.pixelSize: 12
                            }

                            Rectangle {
                                Layout.preferredWidth: 120
                                Layout.preferredHeight: 36
                                radius: 6
                                color: "#f9fafb"
                                border.color: "#d1d5db"
                                border.width: 1

                                TextInput {
                                    anchors.fill: parent
                                    anchors.margins: 10
                                    text: model.opValue
                                    font.pixelSize: 12
                                    font.family: "Inter"
                                    color: "#172033"
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }
                        }
                    }
                }

                // 网卡选择 + 操作按钮
                RowLayout {
                    Layout.fillWidth: true
                    spacing: 16

                    ColumnLayout {
                        spacing: 6

                        Text {
                            text: "绑定网卡"
                            font.pixelSize: 13
                            font.weight: Font.Medium
                            color: "#374151"
                            font.family: "Inter"
                        }

                        ComboBox {
                            Layout.preferredWidth: 260
                            Layout.preferredHeight: 40
                            model: ["以太网 1 / 192.168.1.20", "Wi-Fi / 192.168.31.15"]
                            font.pixelSize: 14
                            font.family: "Inter"
                        }
                    }

                    Item { Layout.fillWidth: true }

                    Button {
                        text: "预览测试"
                        font.pixelSize: 13
                        font.family: "Inter"

                        background: Rectangle {
                            radius: 8
                            color: "#ffffff"
                            border.color: "#1677ff"
                            border.width: 1
                        }

                        contentItem: Text {
                            text: parent.text
                            font: parent.font
                            color: "#1677ff"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Button {
                        text: "保存配置"
                        font.pixelSize: 13
                        font.family: "Inter"

                        background: Rectangle {
                            radius: 8
                            color: "#1677ff"
                        }

                        contentItem: Text {
                            text: parent.text
                            font: parent.font
                            color: "#ffffff"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }
            }
        }
    }
}
