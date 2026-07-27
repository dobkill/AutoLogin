import QtQuick

Rectangle {
    id: root

    property bool recording: false
    property string message: "当前 Qt 环境未安装 Qt WebEngine，无法嵌入页面录制；仍可手动填写 URL 和 XPath 步骤。"

    signal eventCaptured(var event)
    signal pageUrlChanged(string url)

    function open(targetUrl) {
        root.pageUrlChanged(targetUrl)
        root.message = "缺少 Qt WebEngine：请安装 Qt WebEngine 组件后重新配置构建。"
    }

    color: "#00000000"

    Text {
        anchors.centerIn: parent
        anchors.margins: 24
        width: parent.width - 48
        text: root.message
        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter
        color: "#8a98aa"
        font.pixelSize: 13
    }
}
