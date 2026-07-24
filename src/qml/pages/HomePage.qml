import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"

Rectangle {
    id: homePage

    signal navigateRequested(int pageIndex)

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
                Layout.fillWidth: true
                Layout.preferredHeight: 42
                radius: theme.radius
                color: appController.networkStatus.isOnline ? theme.primarySoft : theme.warningSoft
                border.color: appController.networkStatus.isOnline ? theme.tint(theme.primary, 0.24) : theme.tint(theme.warning, 0.28)
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
                        color: appController.networkStatus.isOnline ? theme.tint(theme.primary, 0.14) : theme.tint(theme.warning, 0.14)

                        Text {
                            anchors.centerIn: parent
                            text: appController.networkStatus.isOnline ? "\u2713" : "!"
                            font.pixelSize: 13
                            font.weight: Font.Bold
                            font.family: theme.fontFamily
                            color: appController.networkStatus.isOnline ? theme.primary : theme.warning
                        }
                    }

                    Text {
                        text: appController.networkStatus.isOnline
                              ? "当前出口：" + appController.primaryNetworkLabel + "，最后检测 " + appController.networkStatus.lastCheckedText
                              : "当前未检测到可用网络，请扫描网卡或检查连接。"
                        font.pixelSize: 13
                        font.family: theme.fontFamily
                        color: appController.networkStatus.isOnline ? theme.primaryPressed : "#8a4b08"
                        elide: Text.ElideRight
                        Layout.fillWidth: true
                    }

                    UiButton {
                        text: "扫描"
                        icon: "\u21BB"
                        variant: "secondary"
                        compact: true
                        minimumWidth: 66
                        onClicked: appController.scanNetworkCards()
                    }
                }
            }

            GridLayout {
                Layout.fillWidth: true
                columns: homePage.width > 1100 ? 5 : 3
                columnSpacing: 14
                rowSpacing: 14

                StatusCard {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 106
                    title: "网络状态"
                    value: appController.summary.networkStateText
                    detail: appController.summary.primaryIP
                    icon: appController.summary.isOnline ? "\u2713" : "!"
                    accent: appController.summary.isOnline ? theme.success : theme.warning
                }

                StatusCard {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 106
                    title: "站点总数"
                    value: appController.summary.siteCount
                    detail: appController.summary.enabledCount + " 个已启用"
                    icon: "\u25A6"
                    accent: theme.primary
                }

                StatusCard {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 106
                    title: "登录状态"
                    value: appController.summary.loggedInCount + " / " + appController.summary.siteCount
                    detail: appController.summary.notLoggedInCount + " 个未登录"
                    icon: "\u25C9"
                    accent: theme.success
                }

                StatusCard {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 106
                    title: "当前任务"
                    value: appController.summary.currentSite
                    detail: appController.summary.currentType
                    icon: "API"
                    accent: theme.violet
                }

                StatusCard {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 106
                    title: "自动登录"
                    value: appController.summary.autoLoginText
                    detail: appController.summary.autoStartText
                    icon: "\u23FB"
                    accent: appController.settings.autoLogin ? theme.success : theme.textMuted
                }
            }

            RowLayout {
                Layout.fillWidth: true
                Layout.preferredHeight: 456
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
                                    text: "站点状态"
                                    font.pixelSize: 15
                                    font.weight: Font.Bold
                                    font.family: theme.fontFamily
                                    color: theme.text
                                }

                                Text {
                                    text: appController.summary.siteCount + " 个站点，" + appController.summary.apiCount + " 个 API，" + appController.summary.webViewCount + " 个 WebView"
                                    font.pixelSize: 11
                                    font.family: theme.fontFamily
                                    color: theme.textSoft
                                }
                            }

                            UiButton {
                                text: "站点管理"
                                icon: "\u2192"
                                variant: "secondary"
                                compact: true
                                onClicked: homePage.navigateRequested(1)
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

                                TableHead { text: "站点名称"; Layout.fillWidth: true }
                                TableHead { text: "登录方式"; Layout.preferredWidth: 110 }
                                TableHead { text: "状态"; Layout.preferredWidth: 92 }
                                TableHead { text: "绑定网卡"; Layout.preferredWidth: 210 }
                                TableHead { text: "更新"; Layout.preferredWidth: 130 }
                            }
                        }

                        ListView {
                            id: siteList
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            clip: true
                            spacing: 0
                            model: appController.loginConfigs

                            delegate: Rectangle {
                                width: siteList.width
                                height: 46
                                color: rowMouse.containsMouse ? theme.primarySoft : (index % 2 === 0 ? theme.surfaceMuted : theme.surface)

                                RowLayout {
                                    anchors.fill: parent
                                    anchors.leftMargin: 16
                                    anchors.rightMargin: 16
                                    spacing: 0

                                    TableCell { text: modelData.name; Layout.fillWidth: true; strong: true }
                                    TableCell { text: modelData.typeLabel; Layout.preferredWidth: 110; muted: true }
                                    StatusPill { Layout.preferredWidth: 92; text: modelData.statusLabel; ok: modelData.statusOk }
                                    TableCell { text: modelData.networkLabel; Layout.preferredWidth: 210; muted: true }
                                    TableCell { text: modelData.updatedAtText; Layout.preferredWidth: 130; muted: true }
                                }

                                MouseArea {
                                    id: rowMouse
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    cursorShape: Qt.PointingHandCursor
                                    onClicked: homePage.navigateRequested(1)
                                }
                            }

                            Text {
                                anchors.centerIn: parent
                                visible: siteList.count === 0
                                text: "还没有站点配置"
                                font.pixelSize: 14
                                font.family: theme.fontFamily
                                color: theme.textSoft
                            }
                        }
                    }
                }

                UiCard {
                    Layout.preferredWidth: 280
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
                            text: appController.busy ? "登录中" : "一键全部登录"
                            icon: "\u25B6"
                            variant: "primary"
                            enabled: !appController.busy
                            onClicked: appController.executeAll()
                        }

                        UiButton {
                            Layout.fillWidth: true
                            text: "新增配置"
                            icon: "+"
                            variant: "secondary"
                            onClicked: homePage.navigateRequested(2)
                        }

                        UiButton {
                            Layout.fillWidth: true
                            text: "扫描网卡"
                            icon: "\u25A3"
                            variant: "secondary"
                            onClicked: appController.scanNetworkCards()
                        }

                        UiButton {
                            Layout.fillWidth: true
                            text: "刷新状态"
                            icon: "\u21BB"
                            variant: "success"
                            onClicked: appController.refreshAll()
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 1
                            Layout.topMargin: 4
                            Layout.bottomMargin: 4
                            color: theme.borderSoft
                        }

                        Text {
                            text: appController.lastMessage || "等待操作"
                            font.pixelSize: 12
                            font.family: theme.fontFamily
                            color: theme.textSoft
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                        }

                        Text {
                            text: "最近记录"
                            font.pixelSize: 13
                            font.weight: Font.Bold
                            font.family: theme.fontFamily
                            color: theme.text
                            Layout.topMargin: 8
                        }

                        ListView {
                            id: historyList
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            clip: true
                            spacing: 8
                            model: appController.loginHistory

                            delegate: Rectangle {
                                width: historyList.width
                                height: 62
                                radius: theme.radius
                                color: theme.surfaceMuted
                                border.color: theme.borderSoft
                                border.width: 1

                                ColumnLayout {
                                    anchors.fill: parent
                                    anchors.margins: 10
                                    spacing: 2

                                    RowLayout {
                                        Layout.fillWidth: true
                                        spacing: 8
                                        Text {
                                            text: modelData.siteName
                                            font.pixelSize: 13
                                            font.weight: Font.DemiBold
                                            font.family: theme.fontFamily
                                            color: theme.text
                                            elide: Text.ElideRight
                                            Layout.fillWidth: true
                                        }
                                        Text {
                                            text: modelData.resultText
                                            font.pixelSize: 12
                                            font.weight: Font.DemiBold
                                            color: modelData.success ? theme.success : theme.danger
                                        }
                                    }

                                    Text {
                                        text: modelData.executedAtText + " / " + modelData.durationText
                                        font.pixelSize: 11
                                        font.family: theme.fontFamily
                                        color: theme.textSoft
                                        elide: Text.ElideRight
                                        Layout.fillWidth: true
                                    }
                                }
                            }

                            Text {
                                anchors.centerIn: parent
                                visible: historyList.count === 0
                                text: "暂无登录记录"
                                font.pixelSize: 12
                                font.family: theme.fontFamily
                                color: theme.textSoft
                            }
                        }
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

            Text {
                id: pillText
                anchors.centerIn: parent
                text: parent.parent.text
                font.pixelSize: 12
                font.weight: Font.DemiBold
                font.family: pillTheme.fontFamily
                color: ok ? pillTheme.success : pillTheme.danger
            }
        }
    }
}
