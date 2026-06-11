import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: siteManagerPage
    color: "#f7f9fc"

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 16

        // 顶部操作栏
        RowLayout {
            Layout.fillWidth: true
            spacing: 12

            Text {
                text: "站点管理"
                font.pixelSize: 20
                font.weight: Font.Bold
                font.family: "Inter"
                color: "#172033"
            }

            Item { Layout.fillWidth: true }

            // 搜索框
            Rectangle {
                Layout.preferredWidth: 240
                Layout.preferredHeight: 36
                radius: 8
                color: "#ffffff"
                border.color: "#d1d5db"
                border.width: 1

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 8
                    spacing: 6

                    Text {
                        text: "\uD83D\uDD0D"
                        font.pixelSize: 14
                    }

                    TextInput {
                        id: searchInput
                        Layout.fillWidth: true
                        font.pixelSize: 13
                        font.family: "Inter"
                        color: "#172033"
                        verticalAlignment: Text.AlignVCenter

                        Text {
                            anchors.fill: parent
                            text: "搜索站点..."
                            font.pixelSize: 13
                            font.family: "Inter"
                            color: "#9ca3af"
                            visible: !parent.text && !parent.activeFocus
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }
            }

            // 筛选下拉
            ComboBox {
                id: filterCombo
                Layout.preferredWidth: 120
                Layout.preferredHeight: 36
                model: ["全部", "API", "WebView"]
                font.pixelSize: 13
                font.family: "Inter"
            }

            // 新增按钮
            Button {
                text: "+ 新增站点"
                font.pixelSize: 13
                font.family: "Inter"
                font.weight: Font.Medium

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

        // 站点列表
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#ffffff"
            radius: 10
            border.color: "#e5e7eb"
            border.width: 1

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 0
                spacing: 0

                // 表头
                RowLayout {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 44
                    Layout.leftMargin: 16
                    Layout.rightMargin: 16
                    spacing: 0

                    CheckBox { Layout.preferredWidth: 36 }
                    Text { text: "站点名称";   font.pixelSize: 12; font.weight: Font.Bold; color: "#6b7280"; font.family: "Inter"; Layout.preferredWidth: 180 }
                    Text { text: "类型";       font.pixelSize: 12; font.weight: Font.Bold; color: "#6b7280"; font.family: "Inter"; Layout.preferredWidth: 100 }
                    Text { text: "绑定网卡";   font.pixelSize: 12; font.weight: Font.Bold; color: "#6b7280"; font.family: "Inter"; Layout.fillWidth: true }
                    Text { text: "状态";       font.pixelSize: 12; font.weight: Font.Bold; color: "#6b7280"; font.family: "Inter"; Layout.preferredWidth: 100 }
                    Text { text: "启用";       font.pixelSize: 12; font.weight: Font.Bold; color: "#6b7280"; font.family: "Inter"; Layout.preferredWidth: 60 }
                    Text { text: "最后更新";   font.pixelSize: 12; font.weight: Font.Bold; color: "#6b7280"; font.family: "Inter"; Layout.preferredWidth: 160 }
                    Text { text: "操作";       font.pixelSize: 12; font.weight: Font.Bold; color: "#6b7280"; font.family: "Inter"; Layout.preferredWidth: 140 }
                }

                Rectangle { Layout.fillWidth: true; height: 1; color: "#e5e7eb" }

                // 数据行
                ListView {
                    id: siteList
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    clip: true
                    spacing: 0

                    model: ListModel {
                        ListElement { name: "内部系统";       type: "API";      networkCard: "以太网 1 / 192.168.1.20"; status: "已登录";   statusOk: true;  enabled: true;  updatedAt: "2025-05-24 10:15" }
                        ListElement { name: "外部认证网关";   type: "WebView";  networkCard: "Wi-Fi / 192.168.31.15";  status: "未登录";   statusOk: false; enabled: true;  updatedAt: "2025-05-24 09:30" }
                        ListElement { name: "访客网络";       type: "API";      networkCard: "以太网 1 / 192.168.1.20"; status: "已登录";   statusOk: true;  enabled: false; updatedAt: "2025-05-23 18:40" }
                    }

                    delegate: Rectangle {
                        width: siteList.width
                        height: 48
                        color: index % 2 === 0 ? "#f9fafb" : "#ffffff"

                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 16
                            anchors.rightMargin: 16
                            spacing: 0

                            CheckBox {
                                Layout.preferredWidth: 36
                                checked: false
                            }

                            Text {
                                text: model.name
                                font.pixelSize: 13
                                font.weight: Font.Medium
                                color: "#172033"
                                font.family: "Inter"
                                Layout.preferredWidth: 180
                            }

                            // 类型标签
                            Rectangle {
                                Layout.preferredWidth: 72
                                Layout.preferredHeight: 24
                                radius: 4
                                color: model.type === "API" ? "#ede9fe" : "#e0f2fe"

                                Text {
                                    anchors.centerIn: parent
                                    text: model.type
                                    font.pixelSize: 11
                                    font.weight: Font.Medium
                                    color: model.type === "API" ? "#7c3aed" : "#0284c7"
                                    font.family: "Inter"
                                }
                            }

                            Text {
                                text: model.networkCard
                                font.pixelSize: 12
                                color: "#6b7280"
                                font.family: "Inter"
                                Layout.fillWidth: true
                            }

                            Text {
                                text: model.status
                                font.pixelSize: 12
                                color: model.statusOk ? "#22c55e" : "#ef4444"
                                font.family: "Inter"
                                Layout.preferredWidth: 100
                            }

                            Switch {
                                Layout.preferredWidth: 60
                                checked: model.enabled
                            }

                            Text {
                                text: model.updatedAt
                                font.pixelSize: 12
                                color: "#6b7280"
                                font.family: "Inter"
                                Layout.preferredWidth: 160
                            }

                            RowLayout {
                                Layout.preferredWidth: 140
                                spacing: 4

                                Text {
                                    text: "登录"
                                    font.pixelSize: 12
                                    font.weight: Font.Medium
                                    color: "#1677ff"
                                    font.family: "Inter"

                                    MouseArea {
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                    }
                                }

                                Text { text: "|"; font.pixelSize: 12; color: "#d1d5db" }

                                Text {
                                    text: "编辑"
                                    font.pixelSize: 12
                                    font.weight: Font.Medium
                                    color: "#1677ff"
                                    font.family: "Inter"

                                    MouseArea {
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                    }
                                }

                                Text { text: "|"; font.pixelSize: 12; color: "#d1d5db" }

                                Text {
                                    text: "删除"
                                    font.pixelSize: 12
                                    font.weight: Font.Medium
                                    color: "#ef4444"
                                    font.family: "Inter"

                                    MouseArea {
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
