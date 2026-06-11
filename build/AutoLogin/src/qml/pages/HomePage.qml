import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: homePage
    color: "#f7f9fc"

    // 提示信息栏
    Rectangle {
        id: tipBar
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 20
        height: 40
        radius: 8
        color: "#fffbeb"
        border.color: "#fde68a"
        border.width: 1

        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 14
            anchors.rightMargin: 14
            spacing: 8

            Text {
                text: "\u2139"
                font.pixelSize: 14
                font.weight: Font.Bold
                color: "#d97706"
            }

            Text {
                text: "提示：登录任务支持绑定网络接口，确保使用指定网卡进行登录。"
                font.pixelSize: 13
                font.family: "Inter"
                color: "#92400e"
                Layout.fillWidth: true
            }

            Text {
                text: "\u00D7"
                font.pixelSize: 16
                color: "#92400e"
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: tipBar.visible = false
                }
            }
        }
    }

    // 状态卡片行
    RowLayout {
        id: statusCards
        anchors.top: tipBar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 20
        anchors.topMargin: 16
        spacing: 16

        // 登录状态卡片
        StatusCard {
            Layout.fillWidth: true
            Layout.preferredHeight: 100
            title: "登录状态"
            value: "已登录"
            valueColor: "#22c55e"
            icon: "\u2713"
            iconColor: "#22c55e"
        }

        // 当前站点卡片
        StatusCard {
            Layout.fillWidth: true
            Layout.preferredHeight: 100
            title: "当前站点"
            value: "内部系统"
            valueColor: "#172033"
            icon: "\u25A6"
            iconColor: "#1677ff"
        }

        // 登录方式卡片
        StatusCard {
            Layout.fillWidth: true
            Layout.preferredHeight: 100
            title: "登录方式"
            value: "API 登录"
            valueColor: "#172033"
            icon: "API"
            iconColor: "#8b5cf6"
            isTextIcon: true
        }

        // 当前网卡卡片
        StatusCard {
            Layout.fillWidth: true
            Layout.preferredHeight: 100
            title: "当前网卡"
            value: "以太网 1 / 192.168.1.20"
            valueColor: "#172033"
            icon: "\u25A3"
            iconColor: "#1677ff"
        }

        // 自启动状态卡片
        StatusCard {
            Layout.fillWidth: true
            Layout.preferredHeight: 100
            title: "自启动状态"
            value: "已启用"
            valueColor: "#22c55e"
            icon: "\u23FB"
            iconColor: "#22c55e"
        }
    }

    // 下方两列布局
    RowLayout {
        anchors.top: statusCards.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 20
        anchors.topMargin: 16
        spacing: 16

        // 左侧：最近登录记录
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#ffffff"
            radius: 10
            border.color: "#e5e7eb"
            border.width: 1

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 16
                spacing: 12

                // 标题行
                RowLayout {
                    Layout.fillWidth: true

                    Text {
                        text: "最近登录记录"
                        font.pixelSize: 15
                        font.weight: Font.Bold
                        font.family: "Inter"
                        color: "#172033"
                    }

                    Item { Layout.fillWidth: true }

                    Text {
                        text: "查看全部 \u2192"
                        font.pixelSize: 13
                        font.weight: Font.Bold
                        color: "#1677ff"
                        font.family: "Inter"

                        MouseArea {
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                        }
                    }
                }

                // 表头
                RowLayout {
                    Layout.fillWidth: true
                    spacing: 0

                    Text { text: "时间";       font.pixelSize: 12; font.weight: Font.Bold; color: "#6b7280"; font.family: "Inter"; Layout.preferredWidth: 160 }
                    Text { text: "站点名称";   font.pixelSize: 12; font.weight: Font.Bold; color: "#6b7280"; font.family: "Inter"; Layout.fillWidth: true }
                    Text { text: "登录方式";   font.pixelSize: 12; font.weight: Font.Bold; color: "#6b7280"; font.family: "Inter"; Layout.preferredWidth: 100 }
                    Text { text: "结果";       font.pixelSize: 12; font.weight: Font.Bold; color: "#6b7280"; font.family: "Inter"; Layout.preferredWidth: 80 }
                    Text { text: "耗时";       font.pixelSize: 12; font.weight: Font.Bold; color: "#6b7280"; font.family: "Inter"; Layout.preferredWidth: 80 }
                }

                Rectangle { Layout.fillWidth: true; height: 1; color: "#e5e7eb" }

                // 数据行（示例数据）
                ListView {
                    id: loginList
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    model: ListModel {
                        ListElement { time: "2025-05-24 10:15:32"; site: "内部系统"; method: "API 登录";  result: "\u25CF 成功"; duration: "1.23 秒"; success: true }
                        ListElement { time: "2025-05-24 09:05:18"; site: "内部系统"; method: "API 登录";  result: "\u25CF 成功"; duration: "1.18 秒"; success: true }
                        ListElement { time: "2025-05-23 18:40:07"; site: "内部系统"; method: "密码登录";   result: "\u25CF 成功"; duration: "2.45 秒"; success: true }
                        ListElement { time: "2025-05-23 08:32:51"; site: "内部系统"; method: "API 登录";  result: "\u25CF 成功"; duration: "1.30 秒"; success: true }
                    }
                    spacing: 0
                    clip: true

                    delegate: RowLayout {
                        width: loginList.width
                        height: 40
                        spacing: 0

                        Rectangle {
                            anchors.fill: parent
                            color: index % 2 === 0 ? "#f9fafb" : "#ffffff"
                            radius: 0
                        }

                        Text { text: model.time;     font.pixelSize: 13; color: "#374151"; font.family: "Inter"; Layout.preferredWidth: 160 }
                        Text { text: model.site;      font.pixelSize: 13; color: "#374151"; font.family: "Inter"; Layout.fillWidth: true; font.weight: Font.Medium }
                        Text { text: model.method;    font.pixelSize: 13; color: "#6b7280"; font.family: "Inter"; Layout.preferredWidth: 100 }
                        Text { text: model.result;    font.pixelSize: 13; color: model.success ? "#22c55e" : "#ef4444"; font.family: "Inter"; Layout.preferredWidth: 80 }
                        Text { text: model.duration;  font.pixelSize: 13; color: "#6b7280"; font.family: "Inter"; Layout.preferredWidth: 80 }
                    }
                }
            }
        }

        // 右侧：快捷操作
        Rectangle {
            Layout.preferredWidth: 240
            Layout.fillHeight: true
            color: "#ffffff"
            radius: 10
            border.color: "#e5e7eb"
            border.width: 1

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 16
                spacing: 10

                Text {
                    text: "快捷操作"
                    font.pixelSize: 15
                    font.weight: Font.Bold
                    font.family: "Inter"
                    color: "#172033"
                }

                // 操作按钮
                ActionButton {
                    Layout.fillWidth: true
                    icon: "\u25B6"
                    text: "立即登录"
                    buttonColor: "#1677ff"
                }

                ActionButton {
                    Layout.fillWidth: true
                    icon: "\u25A4"
                    text: "打开配置"
                    buttonColor: "#8b5cf6"
                }

                ActionButton {
                    Layout.fillWidth: true
                    icon: "\u25A3"
                    text: "扫描网卡"
                    buttonColor: "#0891b2"
                }

                ActionButton {
                    Layout.fillWidth: true
                    icon: "\u21BB"
                    text: "刷新状态"
                    buttonColor: "#059669"
                }

                Item { Layout.fillHeight: true }
            }
        }
    }

    // 状态卡片组件
    component StatusCard: Rectangle {
        property string title: ""
        property string value: ""
        property color valueColor: "#172033"
        property string icon: ""
        property color iconColor: "#1677ff"
        property bool isTextIcon: false

        color: "#ffffff"
        radius: 10
        border.color: "#e5e7eb"
        border.width: 1

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 12
            spacing: 4

            RowLayout {
                Layout.fillWidth: true
                spacing: 8

                Rectangle {
                    width: 28
                    height: 28
                    radius: 6
                    color: Qt.rgba(parent.parent.parent.iconColor.r, parent.parent.parent.iconColor.g, parent.parent.parent.iconColor.b, 0.1)

                    Text {
                        anchors.centerIn: parent
                        text: isTextIcon ? icon : icon
                        font.pixelSize: isTextIcon ? 10 : 14
                        font.weight: Font.Bold
                        color: iconColor
                    }
                }

                Text {
                    text: title
                    font.pixelSize: 12
                    color: "#6b7280"
                    font.family: "Inter"
                }
            }

            Text {
                text: value
                font.pixelSize: 16
                font.weight: Font.Bold
                font.family: "Inter"
                color: valueColor
            }
        }
    }

    // 操作按钮组件
    component ActionButton: Rectangle {
        property string icon: ""
        property string text: ""
        property color buttonColor: "#1677ff"

        height: 40
        radius: 8
        color: buttonMouse.containsMouse ? Qt.lighter(buttonColor, 1.1) : buttonColor

        RowLayout {
            anchors.centerIn: parent
            spacing: 6

            Text {
                text: icon
                font.pixelSize: 12
                font.weight: Font.Bold
                color: "#ffffff"
            }

            Text {
                text: parent.parent.text
                font.pixelSize: 13
                font.weight: Font.Bold
                font.family: "Inter"
                color: "#ffffff"
            }
        }

        MouseArea {
            id: buttonMouse
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
        }
    }
}
