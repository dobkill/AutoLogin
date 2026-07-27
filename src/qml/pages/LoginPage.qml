import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"

Rectangle {
    id: loginPage

    signal saved()

    property int currentTab: 0
    property string editingConfigId: ""
    property string apiId: ""
    property string webId: ""
    property string localMessage: ""
    property bool ready: false
    property bool recorderVisible: false
    property bool recorderRecording: false
    property string recorderMessage: ""
    property int recorderUrlIndex: 1
    property string pendingRecorderUrl: ""

    color: theme.page

    Theme { id: theme }

    ListModel { id: apiParams }
    ListModel { id: apiHeaders }
    ListModel { id: webUrls }
    ListModel { id: webSteps }

    Component.onCompleted: {
        ready = true
        loadConfig(editingConfigId)
    }
    onEditingConfigIdChanged: {
        if (ready)
            loadConfig(editingConfigId)
    }

    function resetForms() {
        apiId = ""
        webId = ""
        apiRemark.text = ""
        apiUrl.text = ""
        apiMethod.currentIndex = 0
        apiNetwork.currentIndex = 0
        apiEnabled.checked = true
        apiParams.clear()
        apiHeaders.clear()
        apiParams.append({ pKey: "username", pValue: "" })
        apiParams.append({ pKey: "password", pValue: "" })

        webRemark.text = ""
        webNetwork.currentIndex = 0
        webEnabled.checked = true
        webUrls.clear()
        webSteps.clear()
        localMessage = ""
    }

    function networkIndex(ip) {
        var label = appController.networkLabelForIp(ip)
        var choices = appController.networkCardChoices
        for (var i = 0; i < choices.length; ++i) {
            if (choices[i] === label)
                return i
        }
        return 0
    }

    function methodIndex(method) {
        if (method === "GET")
            return 1
        if (method === "PUT")
            return 2
        return 0
    }

    function opIndex(type) {
        if (type === "input")
            return 1
        if (type === "wait")
            return 2
        return 0
    }

    function objectFromRows(model) {
        var object = {}
        for (var i = 0; i < model.count; ++i) {
            var row = model.get(i)
            var key = (row.pKey || "").trim()
            if (key.length > 0)
                object[key] = row.pValue
        }
        return object
    }

    function rowsFromObject(model, object) {
        model.clear()
        for (var key in object)
            model.append({ pKey: key, pValue: String(object[key]) })
    }

    function listFromModel(model, role) {
        var list = []
        for (var i = 0; i < model.count; ++i) {
            var value = String(model.get(i)[role] || "").trim()
            if (value.length > 0)
                list.push(value)
        }
        return list
    }

    function stepsFromModel() {
        var list = []
        for (var i = 0; i < webSteps.count; ++i) {
            var row = webSteps.get(i)
            if ((row.xpath || "").trim().length === 0 && row.opType !== "wait")
                continue
            list.push({
                urlIndex: Math.max(1, Number(row.urlIndex || 1)),
                xpath: row.xpath,
                type: row.opType,
                value: row.opValue,
                waitMs: Math.max(0, Number(row.waitMs || 0))
            })
        }
        return list
    }

    function loadConfig(siteId) {
        resetForms()
        if (!siteId)
            return

        var config = appController.getConfig(siteId)
        if (!config.id)
            return

        currentTab = config.type === "webview" ? 1 : 0
        if (currentTab === 0) {
            apiId = config.id
            apiRemark.text = config.remark || config.name
            apiUrl.text = config.url || ""
            apiMethod.currentIndex = methodIndex(config.method)
            apiNetwork.currentIndex = networkIndex(config.networkCard)
            apiEnabled.checked = config.enabled
            rowsFromObject(apiParams, config.args || {})
            rowsFromObject(apiHeaders, config.headers || {})
        } else {
            webId = config.id
            webRemark.text = config.remark || config.name
            webNetwork.currentIndex = networkIndex(config.networkCard)
            webEnabled.checked = config.enabled
            webUrls.clear()
            var urls = config.urls || []
            for (var i = 0; i < urls.length; ++i)
                webUrls.append({ url: urls[i] })
            webSteps.clear()
            var steps = config.operations || []
            for (var j = 0; j < steps.length; ++j) {
                webSteps.append({
                    urlIndex: steps[j].urlIndex || 1,
                    xpath: steps[j].xpath || "",
                    opType: steps[j].type || steps[j].opType || "click",
                    opValue: steps[j].value || steps[j].opValue || "",
                    waitMs: steps[j].waitMs || 0
                })
            }
        }
    }

    function apiConfigMap() {
        return {
            id: apiId,
            type: "api",
            remark: apiRemark.text,
            url: apiUrl.text,
            method: apiMethod.currentText,
            args: objectFromRows(apiParams),
            headers: objectFromRows(apiHeaders),
            networkCard: appController.networkIpFromChoice(apiNetwork.currentText),
            enabled: apiEnabled.checked
        }
    }

    function webConfigMap() {
        return {
            id: webId,
            type: "webview",
            remark: webRemark.text,
            urls: listFromModel(webUrls, "url"),
            operations: stepsFromModel(),
            networkCard: appController.networkIpFromChoice(webNetwork.currentText),
            enabled: webEnabled.checked
        }
    }

    function validateApi() {
        if (apiUrl.text.trim().length === 0) {
            localMessage = "请填写 API 请求 URL"
            return false
        }
        return true
    }

    function validateWeb() {
        if (listFromModel(webUrls, "url").length === 0) {
            localMessage = "请至少添加一个 WebView URL"
            return false
        }
        return true
    }

    function normalizedRecorderUrl(value) {
        var text = String(value || "").trim()
        if (text.length === 0)
            return ""
        if (!/^[a-zA-Z][a-zA-Z0-9+.-]*:\/\//.test(text))
            return "https://" + text
        return text
    }

    function ensureWebUrl(url) {
        var text = normalizedRecorderUrl(url)
        if (text.length === 0)
            return 1
        for (var i = 0; i < webUrls.count; ++i) {
            if (String(webUrls.get(i).url) === text)
                return i + 1
        }
        webUrls.append({ url: text })
        return webUrls.count
    }

    function startRecorder() {
        var target = webRecorderUrl.text.length > 0 ? webRecorderUrl.text : (webUrls.count > 0 ? webUrls.get(0).url : "")
        target = normalizedRecorderUrl(target)
        if (target.length === 0) {
            recorderMessage = "请输入要录制的登录页 URL"
            return
        }

        recorderUrlIndex = ensureWebUrl(target)
        webRecorderUrl.text = target
        recorderVisible = true
        recorderRecording = true
        recorderMessage = "正在打开录制页面..."
        pendingRecorderUrl = target
        if (webRecorderLoader.item)
            webRecorderLoader.item.open(target)
    }

    function stopRecorder() {
        recorderRecording = false
        recorderMessage = "录制已暂停，可继续手动调整步骤"
    }

    function appendRecorderEvent(event) {
        var xpath = String(event.xpath || "").trim()
        if (xpath.length === 0)
            return

        var urlIndex = ensureWebUrl(event.url || webRecorderUrl.text)
        var opType = event.type === "input" ? "input" : "click"
        var opValue = opType === "input" ? String(event.value || "") : ""
        var waitMs = opType === "input" ? 300 : 500

        if (webSteps.count > 0) {
            var last = webSteps.get(webSteps.count - 1)
            if (Number(last.urlIndex) === urlIndex && last.xpath === xpath && last.opType === opType) {
                if (opType === "input")
                    webSteps.setProperty(webSteps.count - 1, "opValue", opValue)
                recorderMessage = "已更新最后一步：" + opType + " " + xpath
                return
            }
        }

        webSteps.append({ urlIndex: urlIndex, xpath: xpath, opType: opType, opValue: opValue, waitMs: waitMs })
        recorderMessage = "已录制 " + webSteps.count + " 个步骤：" + opType + " " + xpath
    }

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
                    text: editingConfigId.length > 0 ? "编辑登录配置" : "登录配置"
                    font.pixelSize: 20
                    font.weight: Font.Bold
                    font.family: theme.fontFamily
                    color: theme.text
                }

                Text {
                    text: currentTab === 0 ? "API 登录配置" : "WebView 登录流程配置"
                    font.pixelSize: 12
                    font.family: theme.fontFamily
                    color: theme.textSoft
                }
            }

            Rectangle {
                Layout.preferredWidth: 282
                Layout.preferredHeight: 40
                radius: theme.radius
                color: theme.surfaceStrong
                border.color: theme.borderSoft
                border.width: 1

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 4
                    spacing: 4

                    TabButton {
                        Layout.fillWidth: true
                        text: "API 登录"
                        selected: currentTab === 0
                        onClicked: currentTab = 0
                    }

                    TabButton {
                        Layout.fillWidth: true
                        text: "WebView 登录"
                        selected: currentTab === 1
                        onClicked: currentTab = 1
                    }
                }
            }

            UiButton {
                text: "新建"
                variant: "secondary"
                minimumWidth: 76
                onClicked: {
                    editingConfigId = ""
                    resetForms()
                }
            }
        }

        UiCard {
            Layout.fillWidth: true
            Layout.fillHeight: true
            padding: 0

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 22
                spacing: 16
                visible: currentTab === 0

                GridLayout {
                    Layout.fillWidth: true
                    columns: 2
                    columnSpacing: 16
                    rowSpacing: 12

                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 7
                        FieldLabel { text: "站点备注" }
                        UiTextField {
                            id: apiRemark
                            Layout.fillWidth: true
                            placeholder: "如：内部认证系统"
                        }
                    }

                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 7
                        FieldLabel { text: "启用自动登录" }
                        UiSwitch { id: apiEnabled }
                    }

                    ColumnLayout {
                        Layout.fillWidth: true
                        Layout.columnSpan: 2
                        spacing: 7

                        FieldLabel { text: "请求 URL" }
                        UiTextField {
                            id: apiUrl
                            Layout.fillWidth: true
                            placeholder: "https://example.com/api/login"
                            prefix: "URL"
                        }
                    }

                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 7

                        FieldLabel { text: "请求方法" }
                        UiComboBox {
                            id: apiMethod
                            Layout.fillWidth: true
                            model: ["POST", "GET", "PUT"]
                        }
                    }

                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 7

                        FieldLabel { text: "绑定网卡" }
                        UiComboBox {
                            id: apiNetwork
                            Layout.fillWidth: true
                            model: appController.networkCardChoices
                        }
                    }
                }

                KeyValueEditor {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 188
                    title: "请求参数"
                    keyTitle: "Key"
                    valueTitle: "Value"
                    modelObject: apiParams
                    passwordForKey: "password"
                    onAddClicked: apiParams.append({ pKey: "", pValue: "" })
                    onRemoveClicked: function(row) { apiParams.remove(row) }
                }

                KeyValueEditor {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 154
                    title: "请求头"
                    keyTitle: "Header"
                    valueTitle: "Value"
                    modelObject: apiHeaders
                    onAddClicked: apiHeaders.append({ pKey: "", pValue: "" })
                    onRemoveClicked: function(row) { apiHeaders.remove(row) }
                }

                ActionBar {
                    message: localMessage || appController.lastMessage
                    onTestClicked: {
                        if (validateApi())
                            appController.testConfig(apiConfigMap())
                    }
                    onSaveClicked: {
                        if (!validateApi())
                            return
                        var id = appController.saveApiConfig(apiConfigMap())
                        if (id.length > 0)
                            loginPage.saved()
                    }
                }
            }

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 22
                spacing: 16
                visible: currentTab === 1

                GridLayout {
                    Layout.fillWidth: true
                    columns: 2
                    columnSpacing: 16
                    rowSpacing: 12

                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 7
                        FieldLabel { text: "站点备注" }
                        UiTextField {
                            id: webRemark
                            Layout.fillWidth: true
                            placeholder: "如：外部认证网关"
                        }
                    }

                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 7
                        FieldLabel { text: "绑定网卡" }
                        UiComboBox {
                            id: webNetwork
                            Layout.fillWidth: true
                            model: appController.networkCardChoices
                        }
                    }

                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 7
                        FieldLabel { text: "启用自动登录" }
                        UiSwitch { id: webEnabled }
                    }
                }

                RowLayout {
                    Layout.fillWidth: true
                    spacing: 8

                    FieldLabel {
                        text: "流程录制"
                        Layout.fillWidth: true
                    }

                    UiButton {
                        text: recorderRecording ? "重新打开" : "打开录制"
                        icon: "●"
                        variant: "secondary"
                        compact: true
                        onClicked: startRecorder()
                    }

                    UiButton {
                        text: "暂停"
                        variant: "secondary"
                        compact: true
                        enabled: recorderRecording
                        onClicked: stopRecorder()
                    }

                    UiButton {
                        text: "添加等待"
                        variant: "secondary"
                        compact: true
                        onClicked: webSteps.append({ urlIndex: recorderUrlIndex, xpath: "", opType: "wait", opValue: "", waitMs: 1000 })
                    }
                }

                RowLayout {
                    Layout.fillWidth: true
                    spacing: 10

                    UiTextField {
                        id: webRecorderUrl
                        Layout.fillWidth: true
                        text: webUrls.count > 0 ? webUrls.get(0).url : ""
                        placeholder: "https://portal.example.com/login"
                        prefix: "录制 URL"
                    }

                    Text {
                        Layout.preferredWidth: 340
                        text: recorderMessage.length > 0 ? recorderMessage : "录制支持输入、点击；回车提交建议改为点击登录按钮。"
                        font.pixelSize: 12
                        font.family: theme.fontFamily
                        color: theme.textSoft
                        elide: Text.ElideRight
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: recorderVisible ? 300 : 0
                    visible: recorderVisible
                    radius: theme.radius
                    color: theme.surfaceMuted
                    border.color: theme.borderSoft
                    border.width: 1
                    clip: true

                    Loader {
                        id: webRecorderLoader
                        anchors.fill: parent
                        anchors.margins: 1
                        source: appController.webEngineAvailable ? "../components/WebRecorderView.qml" : "../components/WebRecorderUnavailable.qml"

                        onLoaded: {
                            item.recording = Qt.binding(function() { return recorderRecording })
                            item.messageChanged.connect(function() { recorderMessage = item.message })
                            item.eventCaptured.connect(appendRecorderEvent)
                            item.pageUrlChanged.connect(function(pageUrl) {
                                webRecorderUrl.text = pageUrl
                                recorderUrlIndex = ensureWebUrl(pageUrl)
                            })
                            if (pendingRecorderUrl.length > 0)
                                item.open(pendingRecorderUrl)
                        }
                    }
                }

                RowLayout {
                    Layout.fillWidth: true
                    spacing: 8

                    FieldLabel {
                        text: "URL 访问序列"
                        Layout.fillWidth: true
                    }

                    UiButton {
                        text: "添加 URL"
                        icon: "+"
                        variant: "secondary"
                        compact: true
                        onClicked: webUrls.append({ url: "" })
                    }
                }

                ListView {
                    id: urlList
                    Layout.fillWidth: true
                    Layout.preferredHeight: 116
                    clip: true
                    spacing: 8
                    model: webUrls

                    delegate: RowLayout {
                        width: urlList.width
                        height: 40
                        spacing: 10
                        property int rowIndex: index

                        Text {
                            text: "#" + (index + 1)
                            font.pixelSize: 12
                            font.weight: Font.Bold
                            font.family: theme.fontFamily
                            color: theme.primary
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            Layout.preferredWidth: 38
                        }

                        UiTextField {
                            Layout.fillWidth: true
                            text: model.url
                            placeholder: "https://portal.example.com/login"
                            onTextChanged: webUrls.setProperty(rowIndex, "url", text)
                        }

                        UiButton {
                            text: "\u00D7"
                            variant: "ghost"
                            compact: true
                            minimumWidth: 34
                            onClicked: webUrls.remove(rowIndex)
                        }
                    }
                }

                RowLayout {
                    Layout.fillWidth: true
                    spacing: 8

                    FieldLabel {
                        text: "操作流程"
                        Layout.fillWidth: true
                    }

                    UiButton {
                        text: "添加步骤"
                        icon: "+"
                        variant: "secondary"
                        compact: true
                        onClicked: webSteps.append({ urlIndex: 1, xpath: "", opType: "click", opValue: "", waitMs: 0 })
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 38
                    radius: theme.radius
                    color: theme.surfaceMuted

                    RowLayout {
                        anchors.fill: parent
                        anchors.leftMargin: 12
                        anchors.rightMargin: 12
                        spacing: 10

                        TableHead { text: "URL"; Layout.preferredWidth: 70 }
                        TableHead { text: "XPath"; Layout.fillWidth: true }
                        TableHead { text: "操作"; Layout.preferredWidth: 118 }
                        TableHead { text: "值/等待毫秒"; Layout.preferredWidth: 160 }
                        TableHead { text: ""; Layout.preferredWidth: 38 }
                    }
                }

                ListView {
                    id: webStepList
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    clip: true
                    spacing: 8
                    model: webSteps

                    delegate: RowLayout {
                        width: webStepList.width
                        height: 40
                        spacing: 10
                        property int rowIndex: index

                        UiTextField {
                            Layout.preferredWidth: 70
                            text: model.urlIndex
                            prefix: "#"
                            onTextChanged: webSteps.setProperty(rowIndex, "urlIndex", text)
                        }

                        UiTextField {
                            Layout.fillWidth: true
                            text: model.xpath
                            placeholder: "//input[@id='username']"
                            fontFamily: theme.monoFontFamily
                            onTextChanged: webSteps.setProperty(rowIndex, "xpath", text)
                        }

                        UiComboBox {
                            Layout.preferredWidth: 118
                            model: ["click", "input", "wait"]
                            currentIndex: opIndex(model.opType)
                            onActivated: webSteps.setProperty(rowIndex, "opType", currentText)
                        }

                        UiTextField {
                            Layout.preferredWidth: 160
                            text: model.opType === "wait" ? model.waitMs : model.opValue
                            placeholder: model.opType === "wait" ? "1000" : "输入值"
                            password: model.opType === "input" && model.opValue === "******"
                            onTextChanged: {
                                if (model.opType === "wait")
                                    webSteps.setProperty(rowIndex, "waitMs", text)
                                else
                                    webSteps.setProperty(rowIndex, "opValue", text)
                            }
                        }

                        UiButton {
                            text: "\u00D7"
                            variant: "ghost"
                            compact: true
                            minimumWidth: 34
                            onClicked: webSteps.remove(rowIndex)
                        }
                    }
                }

                ActionBar {
                    message: localMessage || appController.lastMessage
                    onTestClicked: {
                        if (validateWeb())
                            appController.testConfig(webConfigMap())
                    }
                    onSaveClicked: {
                        if (!validateWeb())
                            return
                        var id = appController.saveWebViewConfig(webConfigMap())
                        if (id.length > 0)
                            loginPage.saved()
                    }
                }
            }
        }
    }

    component KeyValueEditor: ColumnLayout {
        id: editor

        property string title: ""
        property string keyTitle: "Key"
        property string valueTitle: "Value"
        property string passwordForKey: ""
        property var modelObject
        signal addClicked()
        signal removeClicked(int row)

        spacing: 8

        RowLayout {
            Layout.fillWidth: true
            spacing: 8

            FieldLabel {
                text: editor.title
                Layout.fillWidth: true
            }

            UiButton {
                text: "添加"
                icon: "+"
                variant: "secondary"
                compact: true
                onClicked: editor.addClicked()
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 34
            radius: theme.radius
            color: theme.surfaceMuted

            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 12
                anchors.rightMargin: 12
                spacing: 10

                TableHead { text: editor.keyTitle; Layout.preferredWidth: 230 }
                TableHead { text: editor.valueTitle; Layout.fillWidth: true }
                TableHead { text: ""; Layout.preferredWidth: 38 }
            }
        }

        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            spacing: 8
            model: editor.modelObject

            delegate: Component {
                RowLayout {
                    width: ListView.view.width
                    height: 38
                    spacing: 10
                    property int rowIndex: index

                    UiTextField {
                        Layout.preferredWidth: 230
                        text: model.pKey
                        onTextChanged: editor.modelObject.setProperty(rowIndex, "pKey", text)
                    }

                    UiTextField {
                        Layout.fillWidth: true
                        text: model.pValue
                        password: editor.passwordForKey.length > 0 && model.pKey.toLowerCase().indexOf(editor.passwordForKey) >= 0
                        onTextChanged: editor.modelObject.setProperty(rowIndex, "pValue", text)
                    }

                    UiButton {
                        text: "\u00D7"
                        variant: "ghost"
                        compact: true
                        minimumWidth: 34
                        onClicked: editor.removeClicked(rowIndex)
                    }
                }
            }
        }
    }

    component ActionBar: RowLayout {
        id: actionBar

        property string message: ""
        signal testClicked()
        signal saveClicked()

        Layout.fillWidth: true
        spacing: 10

        Text {
            text: actionBar.message
            font.pixelSize: 12
            font.family: theme.fontFamily
            color: theme.textSoft
            elide: Text.ElideRight
            Layout.fillWidth: true
        }

        UiButton {
            text: appController.busy ? "测试中" : "测试登录"
            variant: "secondary"
            minimumWidth: 92
            enabled: !appController.busy
            onClicked: actionBar.testClicked()
        }

        UiButton {
            text: "保存配置"
            variant: "primary"
            minimumWidth: 92
            onClicked: actionBar.saveClicked()
        }
    }

    component TabButton: Rectangle {
        property string text: ""
        property bool selected: false
        signal clicked()

        radius: theme.radius - 2
        color: selected ? theme.surface : "transparent"
        border.color: selected ? theme.borderSoft : "transparent"
        border.width: selected ? 1 : 0

        Text {
            anchors.centerIn: parent
            text: parent.text
            font.pixelSize: 13
            font.weight: parent.selected ? Font.DemiBold : Font.Medium
            font.family: theme.fontFamily
            color: parent.selected ? theme.primary : theme.textMuted
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: parent.clicked()
        }
    }

    component FieldLabel: Text {
        font.pixelSize: 13
        font.weight: Font.DemiBold
        font.family: theme.fontFamily
        color: theme.text
    }

    component TableHead: Text {
        font.pixelSize: 12
        font.weight: Font.DemiBold
        font.family: theme.fontFamily
        color: theme.textMuted
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }
}
