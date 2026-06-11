import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: settingsPage
    color: "#f7f9fc"

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 16

        // 标题
        Text {
            text: "系统设置"
            font.pixelSize: 20
            font.weight: Font.Bold
            font.family: "Inter"
            color: "#172033"
        }

        // 设置内容
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#ffffff"
            radius: 10
            border.color: "#e5e7eb"
            border.width: 1

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 24
                spacing: 0

                // === 功能设置 ===
                Text {
                    text: "功能设置"
                    font.pixelSize: 14
                    font.weight: Font.Bold
                    color: "#172033"
                    font.family: "Inter"
                    Layout.bottomMargin: 12
                }

                // 开机自启
                SettingRow {
                    Layout.fillWidth: true
                    title: "开机自启"
                    description: "系统启动后自动运行程序"
                    Switch { checked: false }
                }

                SettingSeparator { Layout.fillWidth: true }

                // 自动登录
                SettingRow {
                    Layout.fillWidth: true
                    title: "自动登录"
                    description: "程序启动后自动执行所有已启用站点的登录"
                    Switch { checked: false }
                }

                SettingSeparator { Layout.fillWidth: true }

                // 最小化到托盘
                SettingRow {
                    Layout.fillWidth: true
                    title: "最小化到托盘"
                    description: "关闭窗口时最小化到系统托盘而非退出"
                    Switch { checked: false }
                }

                SettingSeparator { Layout.fillWidth: true }

                // === 路径设置 ===
                Text {
                    text: "路径设置"
                    font.pixelSize: 14
                    font.weight: Font.Bold
                    color: "#172033"
                    font.family: "Inter"
                    Layout.topMargin: 8
                    Layout.bottomMargin: 12
                }

                // 日志目录
                PathSettingRow {
                    Layout.fillWidth: true
                    title: "日志目录"
                    path: "./logs"
                }

                SettingSeparator { Layout.fillWidth: true }

                // 数据目录
                PathSettingRow {
                    Layout.fillWidth: true
                    title: "数据目录"
                    path: "./data"
                }

                SettingSeparator { Layout.fillWidth: true }

                // === 外观设置 ===
                Text {
                    text: "外观设置"
                    font.pixelSize: 14
                    font.weight: Font.Bold
                    color: "#172033"
                    font.family: "Inter"
                    Layout.topMargin: 8
                    Layout.bottomMargin: 12
                }

                // 主题
                SettingRow {
                    Layout.fillWidth: true
                    title: "主题"
                    description: "选择应用界面主题"

                    ComboBox {
                        Layout.preferredWidth: 160
                        Layout.preferredHeight: 36
                        model: ["浅色", "深色", "跟随系统"]
                        font.pixelSize: 13
                        font.family: "Inter"
                    }
                }

                SettingSeparator { Layout.fillWidth: true }

                // 语言
                SettingRow {
                    Layout.fillWidth: true
                    title: "语言"
                    description: "选择应用界面语言"

                    ComboBox {
                        Layout.preferredWidth: 160
                        Layout.preferredHeight: 36
                        model: ["中文", "English"]
                        font.pixelSize: 13
                        font.family: "Inter"
                    }
                }

                SettingSeparator { Layout.fillWidth: true }

                // === 关于 ===
                Text {
                    text: "关于"
                    font.pixelSize: 14
                    font.weight: Font.Bold
                    color: "#172033"
                    font.family: "Inter"
                    Layout.topMargin: 8
                    Layout.bottomMargin: 12
                }

                RowLayout {
                    Layout.fillWidth: true
                    spacing: 12

                    Text {
                        text: "自动登录器 v1.0.0"
                        font.pixelSize: 13
                        color: "#6b7280"
                        font.family: "Inter"
                    }

                    Item { Layout.fillWidth: true }

                    Text {
                        text: "基于 Qt/C++ 构建 | 跨平台桌面工具"
                        font.pixelSize: 12
                        color: "#9ca3af"
                        font.family: "Inter"
                    }
                }

                Item { Layout.fillHeight: true }
            }
        }
    }

    // 设置行组件
    component SettingRow: RowLayout {
        property string title: ""
        property string description: ""

        spacing: 12

        ColumnLayout {
            Layout.fillWidth: true
            spacing: 2

            Text {
                text: title
                font.pixelSize: 14
                font.weight: Font.Medium
                color: "#172033"
                font.family: "Inter"
            }

            Text {
                text: description
                font.pixelSize: 12
                color: "#6b7280"
                font.family: "Inter"
                visible: text.length > 0
            }
        }

        Item { Layout.fillWidth: true }
    }

    // 路径设置行组件
    component PathSettingRow: RowLayout {
        property string title: ""
        property string path: ""

        spacing: 12

        ColumnLayout {
            Layout.fillWidth: true
            spacing: 2

            Text {
                text: title
                font.pixelSize: 14
                font.weight: Font.Medium
                color: "#172033"
                font.family: "Inter"
            }
        }

        Rectangle {
            Layout.preferredWidth: 300
            Layout.preferredHeight: 36
            radius: 6
            color: "#f9fafb"
            border.color: "#d1d5db"
            border.width: 1

            RowLayout {
                anchors.fill: parent
                anchors.margins: 8
                spacing: 8

                Text {
                    text: path
                    font.pixelSize: 13
                    color: "#172033"
                    font.family: "Inter"
                    Layout.fillWidth: true
                    elide: Text.ElideMiddle
                }

                Button {
                    text: "选择"
                    font.pixelSize: 11
                    font.family: "Inter"

                    background: Rectangle {
                        radius: 4
                        color: "#f3f4f6"
                        border.color: "#d1d5db"
                        border.width: 1
                    }

                    contentItem: Text {
                        text: parent.text
                        font: parent.font
                        color: "#374151"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }
        }
    }

    // 分隔线组件
    component SettingSeparator: Rectangle {
        height: 1
        color: "#f3f4f6"
    }
}
