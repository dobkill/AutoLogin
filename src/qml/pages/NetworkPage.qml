import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: networkPage
    color: "#f7f9fc"

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 16

        // 标题行
        RowLayout {
            Layout.fillWidth: true

            ColumnLayout {
                spacing: 2

                Text {
                    text: "网卡扫描"
                    font.pixelSize: 20
                    font.weight: Font.Bold
                    font.family: "Inter"
                    color: "#172033"
                }

                Text {
                    text: "扫描并管理当前系统中可用的网络接口。"
                    font.pixelSize: 13
                    color: "#6b7280"
                    font.family: "Inter"
                }
            }

            Item { Layout.fillWidth: true }

            Button {
                text: "\u21BB 扫描网卡"
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

            Button {
                text: "\u21BB 刷新状态"
                font.pixelSize: 13
                font.family: "Inter"

                background: Rectangle {
                    radius: 8
                    color: "#ffffff"
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

        // 内容区：左侧列表 + 右侧详情
        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 16

            // 左侧：网卡列表
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

                        Text { text: "网卡名称";    font.pixelSize: 12; font.weight: Font.Bold; color: "#6b7280"; font.family: "Inter"; Layout.fillWidth: true }
                        Text { text: "类型";        font.pixelSize: 12; font.weight: Font.Bold; color: "#6b7280"; font.family: "Inter"; Layout.preferredWidth: 60 }
                        Text { text: "IP 地址";     font.pixelSize: 12; font.weight: Font.Bold; color: "#6b7280"; font.family: "Inter"; Layout.preferredWidth: 140 }
                        Text { text: "MAC 地址";    font.pixelSize: 12; font.weight: Font.Bold; color: "#6b7280"; font.family: "Inter"; Layout.preferredWidth: 150 }
                        Text { text: "状态";        font.pixelSize: 12; font.weight: Font.Bold; color: "#6b7280"; font.family: "Inter"; Layout.preferredWidth: 80 }
                        Text { text: "默认";        font.pixelSize: 12; font.weight: Font.Bold; color: "#6b7280"; font.family: "Inter"; Layout.preferredWidth: 50 }
                        Text { text: "可用性";      font.pixelSize: 12; font.weight: Font.Bold; color: "#6b7280"; font.family: "Inter"; Layout.preferredWidth: 80 }
                    }

                    Rectangle { Layout.fillWidth: true; height: 1; color: "#e5e7eb" }

                    ListView {
                        id: cardList
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        clip: true
                        spacing: 0

                        model: ListModel {
                            ListElement { name: "以太网 1 (Intel Ethernet)";               cardType: "有线"; ip: "192.168.1.20";    mac: "10:1C:2B:3A:4D:5E"; connected: true;  isDefault: true;  available: true }
                            ListElement { name: "Wi-Fi (Intel Wireless-AC 9560)";           cardType: "无线"; ip: "192.168.31.15";   mac: "3C:52:82:7D:6E:11"; connected: true;  isDefault: false; available: true }
                            ListElement { name: "蓝牙网络连接";                              cardType: "无线"; ip: "–";               mac: "7C:5B:90:12:34:56"; connected: false; isDefault: false; available: false }
                            ListElement { name: "VMware Network Adapter VMnet1";            cardType: "有线"; ip: "192.168.96.1";    mac: "00:50:56:C0:00:01"; connected: true;  isDefault: false; available: true }
                            ListElement { name: "VMware Network Adapter VMnet8";            cardType: "有线"; ip: "192.168.239.1";   mac: "00:50:56:C0:00:08"; connected: true;  isDefault: false; available: true }
                        }

                        delegate: ItemDelegate {
                            width: cardList.width
                            height: 44
                            highlighted: ListView.isCurrentItem

                            background: Rectangle {
                                color: parent.highlighted ? "#e8f0fe" : (index % 2 === 0 ? "#f9fafb" : "#ffffff")
                            }

                            contentItem: RowLayout {
                                spacing: 0

                                Text {
                                    text: model.name
                                    font.pixelSize: 13
                                    color: "#172033"
                                    font.family: "Inter"
                                    Layout.fillWidth: true
                                }

                                Text {
                                    text: model.cardType
                                    font.pixelSize: 13
                                    color: "#6b7280"
                                    font.family: "Inter"
                                    Layout.preferredWidth: 60
                                }

                                Text {
                                    text: model.ip
                                    font.pixelSize: 13
                                    color: "#172033"
                                    font.family: "Inter"
                                    Layout.preferredWidth: 140
                                }

                                Text {
                                    text: model.mac
                                    font.pixelSize: 13
                                    color: "#6b7280"
                                    font.family: "Consolas"
                                    Layout.preferredWidth: 150
                                }

                                Text {
                                    text: model.connected ? "\u25CF 已连接" : "\u25CF 未连接"
                                    font.pixelSize: 12
                                    color: model.connected ? "#22c55e" : "#9ca3af"
                                    font.family: "Inter"
                                    Layout.preferredWidth: 80
                                }

                                Text {
                                    text: model.isDefault ? "\u25C9" : "\u2013"
                                    font.pixelSize: 14
                                    color: model.isDefault ? "#1677ff" : "#d1d5db"
                                    Layout.preferredWidth: 50
                                    horizontalAlignment: Text.AlignHCenter
                                }

                                Text {
                                    text: model.available ? "\u2713 可用" : "! 不可用"
                                    font.pixelSize: 12
                                    color: model.available ? "#22c55e" : "#ef4444"
                                    font.family: "Inter"
                                    Layout.preferredWidth: 80
                                }
                            }

                            onClicked: cardList.currentIndex = index
                        }
                    }
                }
            }

            // 右侧：网卡详情
            Rectangle {
                Layout.preferredWidth: 300
                Layout.fillHeight: true
                color: "#ffffff"
                radius: 10
                border.color: "#e5e7eb"
                border.width: 1

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 16
                    spacing: 12

                    Text {
                        text: "网卡详情"
                        font.pixelSize: 15
                        font.weight: Font.Bold
                        font.family: "Inter"
                        color: "#172033"
                    }

                    // 详情字段
                    GridLayout {
                        Layout.fillWidth: true
                        columns: 2
                        rowSpacing: 10
                        columnSpacing: 8

                        Text { text: "网络接口：";  font.pixelSize: 12; font.weight: Font.Bold; color: "#374151"; font.family: "Inter" }
                        Text { text: "以太网 1 (Intel Ethernet)";  font.pixelSize: 12; color: "#172033"; font.family: "Inter"; Layout.fillWidth: true }

                        Text { text: "子网掩码：";  font.pixelSize: 12; font.weight: Font.Bold; color: "#374151"; font.family: "Inter" }
                        Text { text: "255.255.255.0";              font.pixelSize: 12; color: "#172033"; font.family: "Inter"; Layout.fillWidth: true }

                        Text { text: "网关：";      font.pixelSize: 12; font.weight: Font.Bold; color: "#374151"; font.family: "Inter" }
                        Text { text: "192.168.1.1";                 font.pixelSize: 12; color: "#172033"; font.family: "Inter"; Layout.fillWidth: true }

                        Text { text: "DNS：";       font.pixelSize: 12; font.weight: Font.Bold; color: "#374151"; font.family: "Inter" }
                        Text { text: "192.168.1.1, 114.114.114.114"; font.pixelSize: 12; color: "#172033"; font.family: "Inter"; Layout.fillWidth: true }

                        Text { text: "链路速度：";  font.pixelSize: 12; font.weight: Font.Bold; color: "#374151"; font.family: "Inter" }
                        Text { text: "1.00 Gbps";                  font.pixelSize: 12; color: "#172033"; font.family: "Inter"; Layout.fillWidth: true }

                        Text { text: "描述：";      font.pixelSize: 12; font.weight: Font.Bold; color: "#374151"; font.family: "Inter" }
                        Text { text: "Intel(R) Ethernet Connection (14) I219-V"; font.pixelSize: 12; color: "#172033"; font.family: "Inter"; Layout.fillWidth: true; wrapMode: Text.WordWrap }
                    }

                    Rectangle { Layout.fillWidth: true; height: 1; color: "#e5e7eb" }

                    // 说明区域
                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 6

                        Text {
                            text: "说明"
                            font.pixelSize: 13
                            font.weight: Font.Bold
                            color: "#172033"
                            font.family: "Inter"
                        }

                        Text {
                            text: "API 登录与 WebView 登录任务可绑定到指定的网卡进行网络通信。绑定后，任务将仅通过该网卡发送请求，以确保网络出口的一致性和稳定性。"
                            font.pixelSize: 12
                            color: "#6b7280"
                            font.family: "Inter"
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                        }
                    }

                    Item { Layout.fillHeight: true }

                    // 设为默认按钮
                    Button {
                        text: "\u2713 可用于 API / WebView 登录"
                        font.pixelSize: 12
                        font.family: "Inter"

                        background: Rectangle {
                            radius: 8
                            color: "#f0fdf4"
                            border.color: "#86efac"
                            border.width: 1
                        }

                        contentItem: Text {
                            text: parent.text
                            font: parent.font
                            color: "#16a34a"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }
            }
        }
    }
}
