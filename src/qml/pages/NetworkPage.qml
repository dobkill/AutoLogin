import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"

Rectangle {
    id: networkPage

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
                    text: "网卡扫描"
                    font.pixelSize: 20
                    font.weight: Font.Bold
                    font.family: theme.fontFamily
                    color: theme.text
                }

                Text {
                    text: "5 个接口，4 个可用，默认出口为以太网 1"
                    font.pixelSize: 12
                    font.family: theme.fontFamily
                    color: theme.textSoft
                }
            }

            UiButton {
                text: "扫描网卡"
                icon: "\u21BB"
                variant: "primary"
                minimumWidth: 104
            }

            UiButton {
                text: "刷新状态"
                icon: "\u21BB"
                variant: "secondary"
                minimumWidth: 104
            }
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 16

            UiCard {
                Layout.fillWidth: true
                Layout.fillHeight: true
                padding: 0

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 0

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 44
                        color: theme.surfaceMuted

                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 16
                            anchors.rightMargin: 16
                            spacing: 0

                            TableHead { text: "网卡名称"; Layout.fillWidth: true }
                            TableHead { text: "类型"; Layout.preferredWidth: 70 }
                            TableHead { text: "IP 地址"; Layout.preferredWidth: 140 }
                            TableHead { text: "MAC 地址"; Layout.preferredWidth: 158 }
                            TableHead { text: "状态"; Layout.preferredWidth: 92 }
                            TableHead { text: "默认"; Layout.preferredWidth: 54 }
                            TableHead { text: "可用性"; Layout.preferredWidth: 92 }
                        }
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 1
                        color: theme.borderSoft
                    }

                    ListView {
                        id: cardList
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        clip: true
                        currentIndex: 0
                        spacing: 0

                        model: ListModel {
                            ListElement { name: "以太网 1 (Intel Ethernet)"; cardType: "有线"; ip: "192.168.1.20"; mac: "10:1C:2B:3A:4D:5E"; connected: true; isDefault: true; available: true }
                            ListElement { name: "Wi-Fi (Intel Wireless-AC 9560)"; cardType: "无线"; ip: "192.168.31.15"; mac: "3C:52:82:7D:6E:11"; connected: true; isDefault: false; available: true }
                            ListElement { name: "蓝牙网络连接"; cardType: "无线"; ip: "-"; mac: "7C:5B:90:12:34:56"; connected: false; isDefault: false; available: false }
                            ListElement { name: "VMware Network Adapter VMnet1"; cardType: "有线"; ip: "192.168.96.1"; mac: "00:50:56:C0:00:01"; connected: true; isDefault: false; available: true }
                            ListElement { name: "VMware Network Adapter VMnet8"; cardType: "有线"; ip: "192.168.239.1"; mac: "00:50:56:C0:00:08"; connected: true; isDefault: false; available: true }
                        }

                        delegate: Rectangle {
                            width: cardList.width
                            height: 48
                            color: cardList.currentIndex === index ? theme.primarySoft : (rowMouse.containsMouse ? "#f5f9ff" : (index % 2 === 0 ? "#fbfcfe" : theme.surface))

                            RowLayout {
                                anchors.fill: parent
                                anchors.leftMargin: 16
                                anchors.rightMargin: 16
                                spacing: 0

                                TableCell { text: model.name; strong: true; Layout.fillWidth: true }
                                TypeBadge { Layout.preferredWidth: 70; text: model.cardType; wired: model.cardType === "有线" }
                                TableCell { text: model.ip; Layout.preferredWidth: 140 }
                                TableCell { text: model.mac; muted: true; mono: true; Layout.preferredWidth: 158 }
                                StatusBadge { Layout.preferredWidth: 92; text: model.connected ? "已连接" : "未连接"; ok: model.connected }

                                Text {
                                    text: model.isDefault ? "\u25C9" : "-"
                                    font.pixelSize: 14
                                    font.weight: Font.Bold
                                    color: model.isDefault ? theme.primary : theme.textSoft
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    Layout.preferredWidth: 54
                                }

                                StatusBadge { Layout.preferredWidth: 92; text: model.available ? "可用" : "不可用"; ok: model.available }
                            }

                            Rectangle {
                                anchors.bottom: parent.bottom
                                anchors.left: parent.left
                                anchors.right: parent.right
                                height: 1
                                color: theme.borderSoft
                            }

                            MouseArea {
                                id: rowMouse
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor
                                onClicked: cardList.currentIndex = index
                            }
                        }
                    }
                }
            }

            UiCard {
                Layout.preferredWidth: 324
                Layout.fillHeight: true

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 14

                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 10

                        Rectangle {
                            Layout.preferredWidth: 34
                            Layout.preferredHeight: 34
                            radius: 8
                            color: theme.tint(theme.accent, 0.12)

                            Text {
                                anchors.centerIn: parent
                                text: "\u25A3"
                                font.pixelSize: 15
                                font.weight: Font.Bold
                                color: theme.accent
                            }
                        }

                        ColumnLayout {
                            Layout.fillWidth: true
                            spacing: 1

                            Text {
                                text: "网卡详情"
                                font.pixelSize: 15
                                font.weight: Font.Bold
                                font.family: theme.fontFamily
                                color: theme.text
                            }

                            Text {
                                text: "Intel Ethernet"
                                font.pixelSize: 11
                                font.family: theme.fontFamily
                                color: theme.textSoft
                            }
                        }
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 1
                        color: theme.borderSoft
                    }

                    DetailRow { label: "网络接口"; value: "以太网 1 (Intel Ethernet)" }
                    DetailRow { label: "子网掩码"; value: "255.255.255.0" }
                    DetailRow { label: "网关"; value: "192.168.1.1" }
                    DetailRow { label: "DNS"; value: "192.168.1.1, 114.114.114.114" }
                    DetailRow { label: "链路速度"; value: "1.00 Gbps" }
                    DetailRow { label: "描述"; value: "Intel(R) Ethernet Connection (14) I219-V"; wrap: true }

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 1
                        Layout.topMargin: 4
                        color: theme.borderSoft
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 78
                        radius: theme.radius
                        color: theme.successSoft
                        border.color: theme.tint(theme.success, 0.24)
                        border.width: 1

                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 12
                            spacing: 4

                            Text {
                                text: "可用于登录任务"
                                font.pixelSize: 13
                                font.weight: Font.Bold
                                font.family: theme.fontFamily
                                color: theme.success
                            }

                            Text {
                                text: "API 与 WebView 任务将通过该接口发送请求。"
                                font.pixelSize: 12
                                font.family: theme.fontFamily
                                color: theme.textMuted
                                wrapMode: Text.WordWrap
                                Layout.fillWidth: true
                            }
                        }
                    }

                    Item { Layout.fillHeight: true }

                    UiButton {
                        Layout.fillWidth: true
                        text: "设为默认出口"
                        icon: "\u2713"
                        variant: "secondary"
                    }
                }
            }
        }
    }

    component TableHead: Text {
        font.pixelSize: 12
        font.weight: Font.DemiBold
        font.family: theme.fontFamily
        color: theme.textMuted
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    component TableCell: Text {
        property bool strong: false
        property bool muted: false
        property bool mono: false

        font.pixelSize: 13
        font.weight: strong ? Font.DemiBold : Font.Normal
        font.family: mono ? theme.monoFontFamily : theme.fontFamily
        color: muted ? theme.textMuted : theme.text
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    component TypeBadge: Item {
        property string text: ""
        property bool wired: true

        Rectangle {
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            width: 50
            height: 24
            radius: 12
            color: wired ? theme.tint(theme.primary, 0.11) : theme.tint(theme.accent, 0.12)

            Text {
                anchors.centerIn: parent
                text: parent.parent.text
                font.pixelSize: 11
                font.weight: Font.DemiBold
                font.family: theme.fontFamily
                color: wired ? theme.primary : theme.accent
            }
        }
    }

    component StatusBadge: Item {
        property string text: ""
        property bool ok: true

        Rectangle {
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            width: label.implicitWidth + 20
            height: 24
            radius: 12
            color: ok ? theme.successSoft : theme.surfaceStrong

            Text {
                id: label
                anchors.centerIn: parent
                text: parent.parent.text
                font.pixelSize: 12
                font.weight: Font.DemiBold
                font.family: theme.fontFamily
                color: ok ? theme.success : theme.textSoft
            }
        }
    }

    component DetailRow: RowLayout {
        property string label: ""
        property string value: ""
        property bool wrap: false

        Layout.fillWidth: true
        spacing: 12

        Text {
            text: label
            font.pixelSize: 12
            font.weight: Font.DemiBold
            font.family: theme.fontFamily
            color: theme.textMuted
            Layout.preferredWidth: 72
            verticalAlignment: Text.AlignTop
        }

        Text {
            text: value
            font.pixelSize: 12
            font.family: theme.fontFamily
            color: theme.text
            wrapMode: wrap ? Text.WordWrap : Text.NoWrap
            elide: wrap ? Text.ElideNone : Text.ElideRight
            Layout.fillWidth: true
        }
    }
}
