import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"

Rectangle {
    id: settingsPage

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
                    text: "系统设置"
                    font.pixelSize: 20
                    font.weight: Font.Bold
                    font.family: theme.fontFamily
                    color: theme.text
                }

                Text {
                    text: "偏好、路径与应用信息"
                    font.pixelSize: 12
                    font.family: theme.fontFamily
                    color: theme.textSoft
                }
            }

            UiButton {
                text: "恢复默认"
                variant: "secondary"
                minimumWidth: 92
            }

            UiButton {
                text: "保存设置"
                variant: "primary"
                minimumWidth: 92
            }
        }

        UiCard {
            Layout.fillWidth: true
            Layout.fillHeight: true
            padding: 0

            Flickable {
                anchors.fill: parent
                clip: true
                contentWidth: width
                contentHeight: settingsLayout.implicitHeight + 44

                ColumnLayout {
                    id: settingsLayout
                    x: 22
                    y: 22
                    width: parent.width - 44
                    spacing: 0

                    SectionTitle { text: "功能" }

                    SettingRow {
                        title: "开机自启"
                        description: "系统启动后自动运行"
                        UiSwitch { checked: false }
                    }

                    Separator {}

                    SettingRow {
                        title: "自动登录"
                        description: "启动后执行已启用站点"
                        UiSwitch { checked: false }
                    }

                    Separator {}

                    SettingRow {
                        title: "最小化到托盘"
                        description: "关闭窗口时保留后台任务"
                        UiSwitch { checked: false }
                    }

                    SectionTitle {
                        text: "路径"
                        Layout.topMargin: 16
                    }

                    PathSettingRow {
                        title: "日志目录"
                        path: "./logs"
                    }

                    Separator {}

                    PathSettingRow {
                        title: "数据目录"
                        path: "./data"
                    }

                    SectionTitle {
                        text: "外观"
                        Layout.topMargin: 16
                    }

                    SettingRow {
                        title: "主题"
                        description: "界面颜色模式"
                        UiComboBox {
                            Layout.preferredWidth: 170
                            model: ["浅色", "深色", "跟随系统"]
                        }
                    }

                    Separator {}

                    SettingRow {
                        title: "语言"
                        description: "界面显示语言"
                        UiComboBox {
                            Layout.preferredWidth: 170
                            model: ["中文", "English"]
                        }
                    }

                    SectionTitle {
                        text: "关于"
                        Layout.topMargin: 16
                    }

                    RowLayout {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 58
                        spacing: 12

                        Rectangle {
                            Layout.preferredWidth: 36
                            Layout.preferredHeight: 36
                            radius: 9
                            color: theme.primarySoft

                            Text {
                                anchors.centerIn: parent
                                text: "A"
                                font.pixelSize: 16
                                font.weight: Font.Black
                                font.family: theme.fontFamily
                                color: theme.primary
                            }
                        }

                        ColumnLayout {
                            Layout.fillWidth: true
                            spacing: 2

                            Text {
                                text: "自动登录器 v1.0.0"
                                font.pixelSize: 14
                                font.weight: Font.DemiBold
                                font.family: theme.fontFamily
                                color: theme.text
                            }

                            Text {
                                text: "Qt / C++ desktop application"
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

    component SectionTitle: Text {
        Layout.fillWidth: true
        Layout.bottomMargin: 10
        font.pixelSize: 13
        font.weight: Font.Bold
        font.family: theme.fontFamily
        color: theme.text
    }

    component SettingRow: RowLayout {
        id: settingRow

        property string title: ""
        property string description: ""
        default property alias action: actionSlot.data

        Layout.fillWidth: true
        Layout.preferredHeight: 58
        spacing: 12

        ColumnLayout {
            Layout.fillWidth: true
            spacing: 3

            Text {
                text: settingRow.title
                font.pixelSize: 14
                font.weight: Font.DemiBold
                font.family: theme.fontFamily
                color: theme.text
                elide: Text.ElideRight
                Layout.fillWidth: true
            }

            Text {
                text: settingRow.description
                font.pixelSize: 12
                font.family: theme.fontFamily
                color: theme.textMuted
                visible: text.length > 0
                elide: Text.ElideRight
                Layout.fillWidth: true
            }
        }

        RowLayout {
            id: actionSlot
            spacing: 0
            Layout.preferredWidth: Math.max(implicitWidth, 44)
            Layout.preferredHeight: theme.controlHeight
        }
    }

    component PathSettingRow: RowLayout {
        id: pathRow

        property string title: ""
        property string path: ""

        Layout.fillWidth: true
        Layout.preferredHeight: 58
        spacing: 12

        Text {
            text: pathRow.title
            font.pixelSize: 14
            font.weight: Font.DemiBold
            font.family: theme.fontFamily
            color: theme.text
            Layout.fillWidth: true
            elide: Text.ElideRight
        }

        Rectangle {
            Layout.preferredWidth: 360
            Layout.preferredHeight: theme.controlHeight
            radius: theme.radius
            color: theme.surfaceMuted
            border.color: theme.border
            border.width: 1

            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 12
                anchors.rightMargin: 4
                spacing: 8

                Text {
                    text: pathRow.path
                    font.pixelSize: 13
                    font.family: theme.fontFamily
                    color: theme.text
                    elide: Text.ElideMiddle
                    verticalAlignment: Text.AlignVCenter
                    Layout.fillWidth: true
                }

                UiButton {
                    text: "选择"
                    variant: "secondary"
                    compact: true
                    minimumWidth: 58
                }
            }
        }
    }

    component Separator: Rectangle {
        Layout.fillWidth: true
        Layout.preferredHeight: 1
        color: theme.borderSoft
    }
}
