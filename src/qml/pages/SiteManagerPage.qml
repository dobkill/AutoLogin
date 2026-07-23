import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"

Rectangle {
    id: siteManagerPage

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
                    text: "站点管理"
                    font.pixelSize: 20
                    font.weight: Font.Bold
                    font.family: theme.fontFamily
                    color: theme.text
                }

                Text {
                    text: "3 个站点，2 个已启用"
                    font.pixelSize: 12
                    font.family: theme.fontFamily
                    color: theme.textSoft
                }
            }

            UiTextField {
                Layout.preferredWidth: 260
                placeholder: "搜索站点"
                prefix: "\u2315"
            }

            UiComboBox {
                Layout.preferredWidth: 128
                model: ["全部类型", "API", "WebView"]
            }

            UiButton {
                text: "新增站点"
                icon: "+"
                variant: "primary"
                minimumWidth: 108
            }
        }

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

                        UiCheckBox { Layout.preferredWidth: 36 }
                        TableHead { text: "站点名称"; Layout.preferredWidth: 184 }
                        TableHead { text: "类型"; Layout.preferredWidth: 100 }
                        TableHead { text: "绑定网卡"; Layout.fillWidth: true }
                        TableHead { text: "状态"; Layout.preferredWidth: 96 }
                        TableHead { text: "启用"; Layout.preferredWidth: 66 }
                        TableHead { text: "最后更新"; Layout.preferredWidth: 150 }
                        TableHead { text: "操作"; Layout.preferredWidth: 142 }
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 1
                    color: theme.borderSoft
                }

                ListView {
                    id: siteList
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    clip: true
                    spacing: 0

                    model: ListModel {
                        ListElement { name: "内部系统"; type: "API"; networkCard: "以太网 1 / 192.168.1.20"; status: "已登录"; statusOk: true; enabled: true; updatedAt: "2025-05-24 10:15" }
                        ListElement { name: "外部认证网关"; type: "WebView"; networkCard: "Wi-Fi / 192.168.31.15"; status: "未登录"; statusOk: false; enabled: true; updatedAt: "2025-05-24 09:30" }
                        ListElement { name: "访客网络"; type: "API"; networkCard: "以太网 1 / 192.168.1.20"; status: "已登录"; statusOk: true; enabled: false; updatedAt: "2025-05-23 18:40" }
                    }

                    delegate: Rectangle {
                        width: siteList.width
                        height: 52
                        color: rowMouse.containsMouse ? theme.primarySoft : (index % 2 === 0 ? "#fbfcfe" : theme.surface)

                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 16
                            anchors.rightMargin: 16
                            spacing: 0

                            UiCheckBox {
                                Layout.preferredWidth: 36
                                checked: false
                            }

                            TableCell {
                                text: model.name
                                strong: true
                                Layout.preferredWidth: 184
                            }

                            TypeBadge {
                                Layout.preferredWidth: 100
                                text: model.type
                                api: model.type === "API"
                            }

                            TableCell {
                                text: model.networkCard
                                muted: true
                                Layout.fillWidth: true
                            }

                            StatusBadge {
                                Layout.preferredWidth: 96
                                text: model.status
                                ok: model.statusOk
                            }

                            UiSwitch {
                                Layout.preferredWidth: 66
                                checked: model.enabled
                            }

                            TableCell {
                                text: model.updatedAt
                                muted: true
                                Layout.preferredWidth: 150
                            }

                            RowLayout {
                                Layout.preferredWidth: 142
                                spacing: 8

                                ActionLink { text: "登录"; color: theme.primary }
                                ActionLink { text: "编辑"; color: theme.textMuted }
                                ActionLink { text: "删除"; color: theme.danger }
                            }
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
                            acceptedButtons: Qt.NoButton
                            hoverEnabled: true
                        }
                    }
                }
            }
        }
    }

    component TableHead: Text {
        Theme { id: headTheme }
        font.pixelSize: 12
        font.weight: Font.DemiBold
        font.family: headTheme.fontFamily
        color: headTheme.textMuted
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    component TableCell: Text {
        property bool strong: false
        property bool muted: false

        Theme { id: cellTheme }
        font.pixelSize: 13
        font.weight: strong ? Font.DemiBold : Font.Normal
        font.family: cellTheme.fontFamily
        color: muted ? cellTheme.textMuted : cellTheme.text
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    component TypeBadge: Item {
        property string text: ""
        property bool api: true

        Theme { id: badgeTheme }

        Rectangle {
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            width: 72
            height: 24
            radius: 12
            color: api ? badgeTheme.tint(badgeTheme.violet, 0.12) : badgeTheme.tint(badgeTheme.accent, 0.13)

            Text {
                anchors.centerIn: parent
                text: parent.parent.text
                font.pixelSize: 11
                font.weight: Font.DemiBold
                font.family: badgeTheme.fontFamily
                color: api ? badgeTheme.violet : badgeTheme.accent
            }
        }
    }

    component StatusBadge: Item {
        property string text: ""
        property bool ok: true

        Theme { id: badgeTheme }

        Rectangle {
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            width: statusText.implicitWidth + 20
            height: 24
            radius: 12
            color: ok ? badgeTheme.successSoft : badgeTheme.dangerSoft

            Text {
                id: statusText
                anchors.centerIn: parent
                text: parent.parent.text
                font.pixelSize: 12
                font.weight: Font.DemiBold
                font.family: badgeTheme.fontFamily
                color: ok ? badgeTheme.success : badgeTheme.danger
            }
        }
    }

    component ActionLink: Text {
        Theme { id: linkTheme }

        font.pixelSize: 12
        font.weight: Font.DemiBold
        font.family: linkTheme.fontFamily

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
        }
    }
}
