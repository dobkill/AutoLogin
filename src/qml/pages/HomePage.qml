import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"

Rectangle {
    id: homePage

    color: theme.page

    Theme { id: theme }

    Flickable {
        id: homeFlick
        anchors.fill: parent
        clip: true
        contentWidth: width
        contentHeight: contentLayout.y + contentLayout.implicitHeight + 24

        ColumnLayout {
            id: contentLayout
            x: 24
            y: 22
            width: homeFlick.width - 48
            spacing: 16

            Rectangle {
                id: tipBar
                Layout.fillWidth: true
                Layout.preferredHeight: 42
                radius: theme.radius
                color: theme.warningSoft
                border.color: theme.tint(theme.warning, 0.28)
                border.width: 1

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: 14
                    anchors.rightMargin: 10
                    spacing: 10

                    Rectangle {
                        Layout.preferredWidth: 22
                        Layout.preferredHeight: 22
                        radius: 11
                        color: theme.tint(theme.warning, 0.13)

                        Text {
                            anchors.centerIn: parent
                            text: "i"
                            font.pixelSize: 13
                            font.weight: Font.Bold
                            font.family: theme.fontFamily
                            color: theme.warning
                        }
                    }

                    Text {
                        text: "登录任务已绑定网络接口，当前出口为以太网 1。"
                        font.pixelSize: 13
                        font.family: theme.fontFamily
                        color: "#8a4b08"
                        elide: Text.ElideRight
                        Layout.fillWidth: true
                    }

                    UiButton {
                        text: "\u00D7"
                        variant: "ghost"
                        compact: true
                        minimumWidth: 32
                        onClicked: tipBar.visible = false
                    }
                }
            }

            GridLayout {
                Layout.fillWidth: true
                columns: homePage.width > 1080 ? 5 : 3
                columnSpacing: 14
                rowSpacing: 14

                StatusCard {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 106
                    title: "登录状态"
                    value: "已登录"
                    detail: "最后同步 10:15"
                    icon: "\u2713"
                    accent: theme.success
                }

                StatusCard {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 106
                    title: "当前站点"
                    value: "内部系统"
                    detail: "API 通道"
                    icon: "\u25A6"
                    accent: theme.primary
                }

                StatusCard {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 106
                    title: "登录方式"
                    value: "API 登录"
                    detail: "POST / login"
                    icon: "API"
                    accent: theme.violet
                }

                StatusCard {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 106
                    title: "当前网卡"
                    value: "以太网 1"
                    detail: "192.168.1.20"
                    icon: "\u25A3"
                    accent: theme.accent
                }

                StatusCard {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 106
                    title: "自启动"
                    value: "已启用"
                    detail: "随系统启动"
                    icon: "\u23FB"
                    accent: theme.success
                }
            }

            RowLayout {
                Layout.fillWidth: true
                Layout.preferredHeight: 438
                spacing: 16

                UiCard {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    padding: 0

                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 0

                        RowLayout {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 56
                            Layout.leftMargin: 16
                            Layout.rightMargin: 14
                            spacing: 10

                            ColumnLayout {
                                Layout.fillWidth: true
                                spacing: 1

                                Text {
                                    text: "最近登录记录"
                                    font.pixelSize: 15
                                    font.weight: Font.Bold
                                    font.family: theme.fontFamily
                                    color: theme.text
                                }

                                Text {
                                    text: "最近 24 小时 4 次成功"
                                    font.pixelSize: 11
                                    font.family: theme.fontFamily
                                    color: theme.textSoft
                                }
                            }

                            UiButton {
                                text: "查看全部"
                                icon: "\u2192"
                                variant: "secondary"
                                compact: true
                            }
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 38
                            color: theme.surfaceMuted

                            RowLayout {
                                anchors.fill: parent
                                anchors.leftMargin: 16
                                anchors.rightMargin: 16
                                spacing: 0

                                TableHead { text: "时间"; Layout.preferredWidth: 160 }
                                TableHead { text: "站点名称"; Layout.fillWidth: true }
                                TableHead { text: "登录方式"; Layout.preferredWidth: 110 }
                                TableHead { text: "结果"; Layout.preferredWidth: 92 }
                                TableHead { text: "耗时"; Layout.preferredWidth: 86 }
                            }
                        }

                        ListView {
                            id: loginList
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            clip: true
                            spacing: 0
                            model: ListModel {
                                ListElement { time: "2025-05-24 10:15:32"; site: "内部系统"; method: "API 登录"; result: "成功"; duration: "1.23 秒"; success: true }
                                ListElement { time: "2025-05-24 09:05:18"; site: "内部系统"; method: "API 登录"; result: "成功"; duration: "1.18 秒"; success: true }
                                ListElement { time: "2025-05-23 18:40:07"; site: "内部系统"; method: "密码登录"; result: "成功"; duration: "2.45 秒"; success: true }
                                ListElement { time: "2025-05-23 08:32:51"; site: "内部系统"; method: "API 登录"; result: "成功"; duration: "1.30 秒"; success: true }
                            }

                            delegate: Rectangle {
                                width: loginList.width
                                height: 44
                                color: loginMouse.containsMouse ? theme.primarySoft : (index % 2 === 0 ? "#fbfcfe" : theme.surface)

                                RowLayout {
                                    anchors.fill: parent
                                    anchors.leftMargin: 16
                                    anchors.rightMargin: 16
                                    spacing: 0

                                    TableCell { text: model.time; Layout.preferredWidth: 160; muted: true }
                                    TableCell { text: model.site; Layout.fillWidth: true; strong: true }
                                    TableCell { text: model.method; Layout.preferredWidth: 110; muted: true }
                                    StatusPill { Layout.preferredWidth: 92; text: model.result; ok: model.success }
                                    TableCell { text: model.duration; Layout.preferredWidth: 86; muted: true }
                                }

                                MouseArea {
                                    id: loginMouse
                                    anchors.fill: parent
                                    hoverEnabled: true
                                }
                            }
                        }
                    }
                }

                UiCard {
                    Layout.preferredWidth: 264
                    Layout.fillHeight: true

                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 12

                        Text {
                            text: "快捷操作"
                            font.pixelSize: 15
                            font.weight: Font.Bold
                            font.family: theme.fontFamily
                            color: theme.text
                        }

                        UiButton {
                            Layout.fillWidth: true
                            text: "立即登录"
                            icon: "\u25B6"
                            variant: "primary"
                        }

                        UiButton {
                            Layout.fillWidth: true
                            text: "打开配置"
                            icon: "API"
                            variant: "secondary"
                        }

                        UiButton {
                            Layout.fillWidth: true
                            text: "扫描网卡"
                            icon: "\u25A3"
                            variant: "secondary"
                        }

                        UiButton {
                            Layout.fillWidth: true
                            text: "刷新状态"
                            icon: "\u21BB"
                            variant: "success"
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 1
                            Layout.topMargin: 4
                            Layout.bottomMargin: 4
                            color: theme.borderSoft
                        }

                        Text {
                            text: "下一次自检 14:00"
                            font.pixelSize: 12
                            font.family: theme.fontFamily
                            color: theme.textSoft
                            Layout.fillWidth: true
                        }

                        Item { Layout.fillHeight: true }
                    }
                }
            }
        }
    }

    component StatusCard: UiCard {
        property string title: ""
        property string value: ""
        property string detail: ""
        property string icon: ""
        property color accent: "#2563eb"

        Theme { id: statusTheme }

        ColumnLayout {
            anchors.fill: parent
            spacing: 8

            RowLayout {
                Layout.fillWidth: true
                spacing: 8

                Rectangle {
                    Layout.preferredWidth: 30
                    Layout.preferredHeight: 30
                    radius: 7
                    color: statusTheme.tint(accent, 0.12)

                    Text {
                        anchors.centerIn: parent
                        text: icon
                        font.pixelSize: icon === "API" ? 10 : 14
                        font.weight: Font.Bold
                        font.family: statusTheme.fontFamily
                        color: accent
                    }
                }

                Text {
                    text: title
                    font.pixelSize: 12
                    font.family: statusTheme.fontFamily
                    color: statusTheme.textMuted
                    Layout.fillWidth: true
                    elide: Text.ElideRight
                }
            }

            Text {
                text: value
                font.pixelSize: 18
                font.weight: Font.Bold
                font.family: statusTheme.fontFamily
                color: statusTheme.text
                Layout.fillWidth: true
                elide: Text.ElideRight
            }

            Text {
                text: detail
                font.pixelSize: 11
                font.family: statusTheme.fontFamily
                color: statusTheme.textSoft
                Layout.fillWidth: true
                elide: Text.ElideRight
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

    component StatusPill: Item {
        property string text: ""
        property bool ok: true

        Theme { id: pillTheme }

        Rectangle {
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            width: pillText.implicitWidth + 20
            height: 24
            radius: 12
            color: ok ? pillTheme.successSoft : pillTheme.dangerSoft

            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                spacing: 6

                Rectangle {
                    Layout.preferredWidth: 6
                    Layout.preferredHeight: 6
                    radius: 3
                    color: ok ? pillTheme.success : pillTheme.danger
                }

                Text {
                    id: pillText
                    text: parent.parent.parent.text
                    font.pixelSize: 12
                    font.weight: Font.DemiBold
                    font.family: pillTheme.fontFamily
                    color: ok ? pillTheme.success : pillTheme.danger
                }
            }
        }
    }
}
