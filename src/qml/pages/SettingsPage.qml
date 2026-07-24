import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"

Rectangle {
    id: settingsPage

    property string logPath: "./logs"
    property string dataPath: "./data"

    color: theme.page

    Theme { id: theme }

    Popup {
        id: pathDialog

        property string target: "logs"

        modal: true
        focus: true
        width: Math.min(settingsPage.width - 48, 520)
        x: Math.round((settingsPage.width - width) / 2)
        y: Math.round((settingsPage.height - height) / 2)
        padding: 0

        background: Rectangle {
            radius: theme.radius * 1.4
            color: theme.surface
            border.color: theme.border
            border.width: 1
        }

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 18
            spacing: 14

            Text {
                text: pathDialog.target === "logs" ? "设置日志目录" : "设置数据目录"
                font.pixelSize: 16
                font.weight: Font.Bold
                font.family: theme.fontFamily
                color: theme.text
            }

            UiTextField {
                id: pathInput
                Layout.fillWidth: true
                placeholder: "/path/to/directory"
            }

            RowLayout {
                Layout.fillWidth: true
                spacing: 10

                Item { Layout.fillWidth: true }

                UiButton {
                    text: "取消"
                    variant: "secondary"
                    minimumWidth: 82
                    onClicked: pathDialog.close()
                }

                UiButton {
                    text: "确定"
                    variant: "primary"
                    minimumWidth: 82
                    onClicked: {
                        if (pathDialog.target === "logs")
                            settingsPage.logPath = pathInput.text
                        else
                            settingsPage.dataPath = pathInput.text
                        pathDialog.close()
                    }
                }
            }
        }
    }

    Connections {
        target: appController
        function onSettingsChanged() {
            settingsPage.loadSettings()
        }
    }

    Component.onCompleted: loadSettings()

    function themeIndex(themeName) {
        if (themeName === "dark")
            return 1
        if (themeName === "system")
            return 2
        return 0
    }

    function languageIndex(languageName) {
        return languageName === "en" ? 1 : 0
    }

    function themeValue(index) {
        return index === 1 ? "dark" : (index === 2 ? "system" : "light")
    }

    function languageValue(index) {
        return index === 1 ? "en" : "zh"
    }

    function loadSettings() {
        var s = appController.settings
        autoStartSwitch.checked = s.autoStart
        autoLoginSwitch.checked = s.autoLogin
        traySwitch.checked = s.minimizeToTray
        logPath = s.logDirectory
        dataPath = s.dataDirectory
        themeCombo.currentIndex = themeIndex(s.theme)
        languageCombo.currentIndex = languageIndex(s.language)
    }

    function saveSettings() {
        appController.saveSettings({
            autoStart: autoStartSwitch.checked,
            autoLogin: autoLoginSwitch.checked,
            minimizeToTray: traySwitch.checked,
            logDirectory: logPath,
            dataDirectory: dataPath,
            theme: themeValue(themeCombo.currentIndex),
            language: languageValue(languageCombo.currentIndex)
        })
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
                    text: "系统设置"
                    font.pixelSize: 20
                    font.weight: Font.Bold
                    font.family: theme.fontFamily
                    color: theme.text
                }

                Text {
                    text: appController.lastMessage || "偏好、路径与应用信息"
                    font.pixelSize: 12
                    font.family: theme.fontFamily
                    color: theme.textSoft
                    elide: Text.ElideRight
                    Layout.fillWidth: true
                }
            }

            UiButton {
                text: "恢复默认"
                variant: "secondary"
                minimumWidth: 92
                onClicked: appController.resetSettings()
            }

            UiButton {
                text: "保存设置"
                variant: "primary"
                minimumWidth: 92
                onClicked: settingsPage.saveSettings()
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
                        UiSwitch { id: autoStartSwitch }
                    }

                    Separator {}

                    SettingRow {
                        title: "自动登录"
                        description: "启动后执行已启用站点"
                        UiSwitch { id: autoLoginSwitch }
                    }

                    Separator {}

                    SettingRow {
                        title: "最小化到后台"
                        description: "关闭窗口时最小化而不是退出"
                        UiSwitch { id: traySwitch }
                    }

                    SectionTitle {
                        text: "路径"
                        Layout.topMargin: 16
                    }

                    PathSettingRow {
                        title: "日志目录"
                        path: settingsPage.logPath
                        onPathEdited: function(value) { settingsPage.logPath = value }
                        onChooseClicked: {
                            pathDialog.target = "logs"
                            pathInput.text = settingsPage.logPath
                            pathDialog.open()
                        }
                        onOpenClicked: appController.openPath(settingsPage.logPath)
                    }

                    Separator {}

                    PathSettingRow {
                        title: "数据目录"
                        path: settingsPage.dataPath
                        onPathEdited: function(value) { settingsPage.dataPath = value }
                        onChooseClicked: {
                            pathDialog.target = "data"
                            pathInput.text = settingsPage.dataPath
                            pathDialog.open()
                        }
                        onOpenClicked: appController.openPath(settingsPage.dataPath)
                    }

                    SectionTitle {
                        text: "外观"
                        Layout.topMargin: 16
                    }

                    SettingRow {
                        title: "主题"
                        description: "界面颜色模式"
                        UiComboBox {
                            id: themeCombo
                            Layout.preferredWidth: 170
                            model: ["浅色", "深色", "跟随系统"]
                        }
                    }

                    Separator {}

                    SettingRow {
                        title: "语言"
                        description: "界面显示语言"
                        UiComboBox {
                            id: languageCombo
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

                    Item {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 16
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
        signal chooseClicked()
        signal openClicked()
        signal pathEdited(string value)

        Layout.fillWidth: true
        Layout.preferredHeight: 58
        spacing: 12

        Text {
            text: pathRow.title
            font.pixelSize: 14
            font.weight: Font.DemiBold
            font.family: theme.fontFamily
            color: theme.text
            Layout.preferredWidth: 120
            elide: Text.ElideRight
        }

        UiTextField {
            Layout.fillWidth: true
            text: pathRow.path
            onTextChanged: pathRow.pathEdited(text)
        }

        UiButton {
            text: "打开"
            variant: "secondary"
            compact: true
            minimumWidth: 58
            onClicked: pathRow.openClicked()
        }

        UiButton {
            text: "选择"
            variant: "secondary"
            compact: true
            minimumWidth: 58
            onClicked: pathRow.chooseClicked()
        }
    }

    component Separator: Rectangle {
        Layout.fillWidth: true
        Layout.preferredHeight: 1
        color: theme.borderSoft
    }
}
