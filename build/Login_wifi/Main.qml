import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.LocalStorage 2.0
import QtQuick.Dialogs 6.3

ApplicationWindow {
    id: win
    width: 980; height: 620; visible: true; title: "Neon Fetch — QML UI"

    /* 颜色定义略（同你原来） */
    readonly property color neon: "#39FF14"
    readonly property color bg0: "#070B0A"
    readonly property color bg1: "#0B1411"
    readonly property color panel: "#0B1712"
    readonly property color textColor: "#D7FFE2"
    readonly property color danger: "#FF4D4D"

    /* ===== 1. 本地存储封装 ===== */
    QtObject {
        id: store
        objectName: "store"  
        property var db: LocalStorage.openDatabaseSync("NeonFetch", "1.0", "Settings", 100000)

        function save(k, v) {
            db.transaction(function(tx) {
                tx.executeSql('CREATE TABLE IF NOT EXISTS cfg(key TEXT UNIQUE, value TEXT)');
                tx.executeSql('INSERT OR REPLACE INTO cfg VALUES(?,?)', [k, JSON.stringify(v)]);
            });
        }

        function load(k, def) {
            var res = def;
            db.transaction(function(tx) {
                var rs = tx.executeSql('SELECT value FROM cfg WHERE key=?', [k]);
                if (rs.rows.length) res = JSON.parse(rs.rows.item(0).value);
            });
            return res;
        }
    }

    MessageDialog { id: msg; title: "提示"; buttons: MessageDialog.Ok
        function showMessage(t) { text = t; open() }
    }

    /* ===== 2. 背景 / 主卡片 略（同你原来） ===== */
    Rectangle { anchors.fill: parent; gradient: Gradient {
        GradientStop { position: 0; color: bg0 }
        GradientStop { position: 1; color: bg1 }
    } }

    Rectangle {
        id: mainCard
        anchors.fill: parent; anchors.margins: 18
        radius: 18; color: panel
        border.color: Qt.rgba(0.22,1,0.45,0.35); border.width: 1

        ColumnLayout {
            anchors.fill: parent; anchors.margins: 18; spacing: 14

            /* Header 略 */
            RowLayout {
                Layout.fillWidth: true; spacing: 12
                Rectangle { width: 10; height: 10; radius: 5; color: neon; opacity: 0.9 }
                ColumnLayout {
                    Layout.fillWidth: true; spacing: 2
                    Label { text: "Neon Fetch"; color: textColor; font.pixelSize: 20; font.weight: Font.DemiBold }
                    Label { text: "输入 URL，点击访问，返回内容会显示在下方输出框"; color: Qt.rgba(0.84,1,0.89,0.7); font.pixelSize: 12 }
                }
                Rectangle {
                    id: badge
                    radius: 10; color: Qt.rgba(0.22,1,0.45,0.12); border.color: Qt.rgba(0.22,1,0.45,0.35); border.width: 1
                    implicitHeight: 28; implicitWidth: badgeText.implicitWidth + 18
                    Label {
                        id: badgeText; anchors.centerIn: parent; text: "IDLE"; color: neon
                        font.pixelSize: 12; font.weight: Font.Medium
                    }
                }
            }

            /* 输入区 */
            Rectangle {
                Layout.fillWidth: true; Layout.preferredHeight: 70
                radius: 14; color: Qt.rgba(0,0,0,0.25)
                border.color: Qt.rgba(0.22,1,0.45,0.22); border.width: 1
                RowLayout {
                    anchors.fill: parent; anchors.margins: 12; spacing: 10
                    TextField {
                        id: urlField
                        Layout.fillWidth: true; placeholderText: "https://example.com/api"
                        text: store.load("savedUrl", "")          // ← 启动时读取
                        color: textColor; selectByMouse: true; font.pixelSize: 14
                        background: Rectangle {
                            radius: 10; color: Qt.rgba(0,0,0,0.35)
                            border.color: urlField.activeFocus ? Qt.rgba(0.22,1,0.45,0.75) : Qt.rgba(0.22,1,0.45,0.25)
                            border.width: 1
                        }
                        Keys.onReturnPressed: fetchBtn.clicked()
                    }
                    Button {
                        id: fetchBtn
                        text: busy ? "访问中..." : "访问"
                        enabled: !busy && urlField.text.trim().length > 0
                        Layout.preferredWidth: 130; Layout.preferredHeight: 44
                        property bool busy: false
                        background: Rectangle {
                            radius: 12; color: fetchBtn.enabled ? Qt.rgba(0.22,1,0.45, fetchBtn.down ? 0.22 : 0.14) : Qt.rgba(0.22,1,0.45,0.06)
                            border.color: fetchBtn.enabled ? Qt.rgba(0.22,1,0.45,0.75) : Qt.rgba(0.22,1,0.45,0.20)
                            border.width: 1
                        }
                        contentItem: Label {
                            text: fetchBtn.text; color: fetchBtn.enabled ? neon : Qt.rgba(0.84,1,0.89,0.35)
                            font.pixelSize: 14; font.weight: Font.DemiBold
                            horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter
                        }
                        onClicked: {
                            const u = urlField.text.trim()
                            store.save("savedUrl", u)   // ← 立即保存
                            // msg.showMessage(u + " 已访问")
                            doRequest()
                        }
                    }
                }
            }

            /* 输出区 略 */
            RowLayout {
                Layout.fillWidth: true; spacing: 10
                Label { text: "输出"; color: Qt.rgba(0.84,1,0.89,0.85); font.pixelSize: 13; font.weight: Font.DemiBold }
                Rectangle { Layout.fillWidth: true; height: 1; color: Qt.rgba(0.22,1,0.45,0.18) }
                Button {
                    text: "清空"; Layout.preferredHeight: 30; Layout.preferredWidth: 80
                    background: Rectangle { radius: 10; color: Qt.rgba(0.22,1,0.45,0.08); border.color: Qt.rgba(0.22,1,0.45,0.28); border.width: 1 }
                    contentItem: Label { text: "清空"; color: neon; font.pixelSize: 12; horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter }
                    onClicked: outputArea.text = ""
                }
            }

            /* 开机自启 Switch 按钮 */
            RowLayout {
                Layout.fillWidth: true; spacing: 10
                Label {
                    text: "开机自启"
                    color: textColor
                    font.pixelSize: 14
                    font.weight: Font.Medium
                }
                Switch {
                    id: autoStartSwitch
                    checked: store.load("autoStart", false)  // ← 启动时读取状态
                    onCheckedChanged: {
                        store.save("autoStart", autoStartSwitch.checked)  // ← 保存状态
                    }
                    Layout.preferredWidth: 80
                }
            }

            /* 输出区 下略 */
            Rectangle {
                Layout.fillWidth: true; Layout.fillHeight: true
                radius: 14; color: Qt.rgba(0,0,0,0.28); border.color: Qt.rgba(0.22,1,0.45,0.22); border.width: 1
                ScrollView { anchors.fill: parent; anchors.margins: 10; clip: true
                    TextArea {
                        id: outputArea
                        wrapMode: TextArea.Wrap; text: "准备就绪。输入 URL 点击访问。\n"; readOnly: true; selectByMouse: true
                        color: textColor; font.family: "Monospace"; font.pixelSize: 13
                        background: Rectangle { radius: 10; color: Qt.rgba(0,0,0,0.15); border.color: Qt.rgba(0.22,1,0.45,0.10); border.width: 1 }
                    }
                }
            }
        }
    }

    /* ===== 3. 启动恢复 ===== */
    Component.onCompleted: {
        const last = store.load("savedUrl", "")
        const auto_Start = store.load("autoStart", false)
        if (last) {
            // msg.showMessage(auto_Start + "--- auto")
            doRequest()
        }
    }

    /* ===== 4. 网络请求函数 略（同你原来） ===== */
    function setStatus(label, isError) {
        badgeText.text = label
        if (isError) {
            badge.color = Qt.rgba(1.0,0.3,0.3,0.10); badge.border.color = Qt.rgba(1.0,0.3,0.3,0.45); badgeText.color = danger
        } else {
            badge.color = Qt.rgba(0.22,1,0.45,0.12); badge.border.color = Qt.rgba(0.22,1,0.45,0.35); badgeText.color = neon
        }
    }

    function appendLog(s) { outputArea.text += s + "\n"; outputArea.cursorPosition = outputArea.length }
    function doRequest() {
        const url = urlField.text.trim(); if (!url) return
        fetchBtn.busy = true; setStatus("LOADING", false); appendLog("→ GET " + url)
        const xhr = new XMLHttpRequest()
        xhr.onreadystatechange = function() {
            if (xhr.readyState !== XMLHttpRequest.DONE) return
            fetchBtn.busy = false
            if (xhr.status >= 200 && xhr.status < 300) {
                setStatus("OK " + xhr.status, false); appendLog("✓ HTTP " + xhr.status)
                appendLog("—— Response ——"); appendLog(xhr.responseText); appendLog("———————")
            } else {
                setStatus("ERR " + xhr.status, true); appendLog("✗ HTTP " + xhr.status)
                appendLog("—— Error / Response ——"); appendLog(xhr.responseText || "(no body)"); appendLog("———————")
            }
        }
        xhr.onerror = function() { fetchBtn.busy = false; setStatus("NETWORK ERR", true); appendLog("✗ Network error") }
        xhr.open("GET", url); xhr.send()
    }
}
