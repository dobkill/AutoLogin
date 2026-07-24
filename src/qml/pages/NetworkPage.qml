import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"

Rectangle {
    id: networkPage

    property var cards: appController.networkCards
    property var selectedCard: cards.length > 0 ? cards[Math.max(0, Math.min(cardList.currentIndex, cards.length - 1))] : ({})

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
                    text: cards.length + " 个接口，默认出口为 " + appController.primaryNetworkLabel
                    font.pixelSize: 12
                    font.family: theme.fontFamily
                    color: theme.textSoft
                }
            }

            StatusBadge {
                Layout.preferredWidth: 96
                text: appController.networkStatus.stateText
                ok: appController.networkStatus.isOnline
            }

            UiButton {
                text: "扫描网卡"
                icon: "\u21BB"
                variant: "primary"
                minimumWidth: 104
                onClicked: appController.scanNetworkCards()
            }

            UiButton {
                text: "刷新状态"
                icon: "\u21BB"
                variant: "secondary"
                minimumWidth: 104
                onClicked: appController.refreshAll()
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
                            TableHead { text: "绑定"; Layout.preferredWidth: 92 }
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
                        model: networkPage.cards

                        delegate: Rectangle {
                            width: cardList.width
                            height: 48
                            color: cardList.currentIndex === index ? theme.primarySoft : (rowMouse.containsMouse ? theme.surfaceStrong : (index % 2 === 0 ? theme.surfaceMuted : theme.surface))

                            RowLayout {
                                anchors.fill: parent
                                anchors.leftMargin: 16
                                anchors.rightMargin: 16
                                spacing: 0

                                TableCell { text: modelData.name; strong: true; Layout.fillWidth: true }
                                TypeBadge { Layout.preferredWidth: 70; text: modelData.cardType; wired: modelData.type !== "wireless" }
                                TableCell { text: modelData.ip; Layout.preferredWidth: 140 }
                                TableCell { text: modelData.macAddress || "-"; muted: true; mono: true; Layout.preferredWidth: 158 }
                                StatusBadge { Layout.preferredWidth: 92; text: modelData.connected ? "已连接" : "未连接"; ok: modelData.connected }

                                Text {
                                    text: modelData.isDefault ? "\u25C9" : "-"
                                    font.pixelSize: 14
                                    font.weight: Font.Bold
                                    color: modelData.isDefault ? theme.primary : theme.textSoft
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    Layout.preferredWidth: 54
                                }

                                TableCell { text: modelData.boundText; muted: modelData.boundCount === 0; Layout.preferredWidth: 92 }
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

                        Text {
                            anchors.centerIn: parent
                            visible: cardList.count === 0
                            text: "尚未扫描到网卡"
                            font.pixelSize: 14
                            font.family: theme.fontFamily
                            color: theme.textSoft
                        }
                    }
                }
            }

            UiCard {
                Layout.preferredWidth: 330
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
                                text: selectedCard.name || "-"
                                font.pixelSize: 11
                                font.family: theme.fontFamily
                                color: theme.textSoft
                                elide: Text.ElideRight
                                Layout.fillWidth: true
                            }
                        }
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 1
                        color: theme.borderSoft
                    }

                    DetailRow { label: "网络接口"; value: selectedCard.name || "-" }
                    DetailRow { label: "IP 地址"; value: selectedCard.ip || "-" }
                    DetailRow { label: "子网掩码"; value: selectedCard.subnetMask || "-" }
                    DetailRow { label: "网关"; value: selectedCard.gateway || "-" }
                    DetailRow { label: "DNS"; value: selectedCard.dnsText || "-" ; wrap: true }
                    DetailRow { label: "MAC"; value: selectedCard.macAddress || "-" }
                    DetailRow { label: "绑定站点"; value: selectedCard.boundText || "-" }

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 82
                        Layout.topMargin: 4
                        radius: theme.radius
                        color: selectedCard.available ? theme.successSoft : theme.warningSoft
                        border.color: selectedCard.available ? theme.tint(theme.success, 0.24) : theme.tint(theme.warning, 0.24)
                        border.width: 1

                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 12
                            spacing: 4

                            Text {
                                text: selectedCard.available ? "可用于登录任务" : "当前不可用于绑定请求"
                                font.pixelSize: 13
                                font.weight: Font.Bold
                                font.family: theme.fontFamily
                                color: selectedCard.available ? theme.success : theme.warning
                            }

                            Text {
                                text: selectedCard.available ? "API 请求可绑定到该本地 IP 发起。" : "未连接或缺少 IPv4 地址。"
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
                        text: "刷新扫描"
                        icon: "\u21BB"
                        variant: "secondary"
                        onClicked: appController.scanNetworkCards()
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
