import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"

Rectangle {
    id: siteManagerPage

    signal editRequested(string siteId)

    property string searchText: ""
    property int typeFilterIndex: 0
    property int statusFilterIndex: 0
    property var selectedIds: ({})
    property int selectedCount: 0
    property string pendingDeleteId: ""
    property bool pendingDeleteBatch: false
    property var filteredConfigs: appController.loginConfigs.filter(function(item) {
        var keyword = searchText.trim().toLowerCase()
        var matchesSearch = keyword.length === 0
                || item.name.toLowerCase().indexOf(keyword) >= 0
                || item.networkLabel.toLowerCase().indexOf(keyword) >= 0
        var matchesType = typeFilterIndex === 0
                || (typeFilterIndex === 1 && item.type === "api")
                || (typeFilterIndex === 2 && item.type === "webview")
        var matchesStatus = statusFilterIndex === 0
                || (statusFilterIndex === 1 && item.status === "logged_in")
                || (statusFilterIndex === 2 && item.status !== "logged_in")
        return matchesSearch && matchesType && matchesStatus
    })

    color: theme.page

    Theme { id: theme }

    function selectedIdList() {
        var ids = []
        for (var id in selectedIds) {
            if (selectedIds[id])
                ids.push(id)
        }
        return ids
    }

    function updateSelectedCount() {
        selectedCount = selectedIdList().length
    }

    function setSelected(siteId, selected) {
        var copy = {}
        for (var id in selectedIds)
            copy[id] = selectedIds[id]
        copy[siteId] = selected
        selectedIds = copy
        updateSelectedCount()
    }

    function selectAllFiltered(selected) {
        var copy = {}
        if (selected) {
            for (var i = 0; i < filteredConfigs.length; ++i)
                copy[filteredConfigs[i].id] = true
        }
        selectedIds = copy
        updateSelectedCount()
    }

    function clearSelection() {
        selectedIds = {}
        selectedCount = 0
    }

    onFilteredConfigsChanged: {
        var copy = {}
        for (var i = 0; i < filteredConfigs.length; ++i) {
            var id = filteredConfigs[i].id
            if (selectedIds[id])
                copy[id] = true
        }
        selectedIds = copy
        updateSelectedCount()
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
                    text: "站点管理"
                    font.pixelSize: 20
                    font.weight: Font.Bold
                    font.family: theme.fontFamily
                    color: theme.text
                }

                Text {
                    text: appController.summary.siteCount + " 个站点，" + appController.summary.enabledCount + " 个已启用"
                    font.pixelSize: 12
                    font.family: theme.fontFamily
                    color: theme.textSoft
                }
            }

            UiTextField {
                Layout.preferredWidth: 240
                placeholder: "搜索站点"
                prefix: "\u2315"
                text: siteManagerPage.searchText
                onTextChanged: siteManagerPage.searchText = text
            }

            UiComboBox {
                Layout.preferredWidth: 122
                model: ["全部类型", "API", "WebView"]
                currentIndex: siteManagerPage.typeFilterIndex
                onActivated: siteManagerPage.typeFilterIndex = currentIndex
            }

            UiComboBox {
                Layout.preferredWidth: 122
                model: ["全部状态", "已登录", "未登录"]
                currentIndex: siteManagerPage.statusFilterIndex
                onActivated: siteManagerPage.statusFilterIndex = currentIndex
            }

            UiButton {
                text: "新增站点"
                icon: "+"
                variant: "primary"
                minimumWidth: 108
                onClicked: siteManagerPage.editRequested("")
            }
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 8

            Text {
                text: selectedCount > 0 ? "已选择 " + selectedCount + " 个站点" : "可批量管理已选择站点"
                font.pixelSize: 12
                font.family: theme.fontFamily
                color: selectedCount > 0 ? theme.primary : theme.textSoft
                Layout.fillWidth: true
            }

            UiButton {
                text: "批量登录"
                icon: "\u25B6"
                variant: "secondary"
                compact: true
                enabled: selectedCount > 0 && !appController.busy
                onClicked: appController.executeBatch(siteManagerPage.selectedIdList())
            }

            UiButton {
                text: "启用"
                variant: "secondary"
                compact: true
                enabled: selectedCount > 0
                onClicked: {
                    var ids = siteManagerPage.selectedIdList()
                    for (var i = 0; i < ids.length; ++i)
                        appController.setConfigEnabled(ids[i], true)
                }
            }

            UiButton {
                text: "禁用"
                variant: "secondary"
                compact: true
                enabled: selectedCount > 0
                onClicked: {
                    var ids = siteManagerPage.selectedIdList()
                    for (var i = 0; i < ids.length; ++i)
                        appController.setConfigEnabled(ids[i], false)
                }
            }

            UiButton {
                text: "删除"
                variant: "danger"
                compact: true
                enabled: selectedCount > 0
                onClicked: {
                    pendingDeleteBatch = true
                    pendingDeleteId = ""
                    deleteDialog.open()
                }
            }
        }

        UiCard {
            Layout.fillWidth: true
            Layout.fillHeight: true
            padding: 0

            ColumnLayout {
                anchors.fill: parent
                spacing: 0

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 44
                    color: theme.surfaceMuted

                    RowLayout {
                        anchors.fill: parent
                        anchors.leftMargin: 16
                        anchors.rightMargin: 16
                        spacing: 0

                        UiCheckBox {
                            Layout.preferredWidth: 36
                            checked: filteredConfigs.length > 0 && selectedCount === filteredConfigs.length
                            onToggled: siteManagerPage.selectAllFiltered(checked)
                        }
                        TableHead { text: "站点名称"; Layout.preferredWidth: 184 }
                        TableHead { text: "类型"; Layout.preferredWidth: 100 }
                        TableHead { text: "绑定网卡"; Layout.fillWidth: true }
                        TableHead { text: "状态"; Layout.preferredWidth: 96 }
                        TableHead { text: "启用"; Layout.preferredWidth: 66 }
                        TableHead { text: "最后更新"; Layout.preferredWidth: 150 }
                        TableHead { text: "操作"; Layout.preferredWidth: 212 }
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 1
                    color: theme.borderSoft
                }

                ListView {
                    id: siteList
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    clip: true
                    spacing: 0
                    model: siteManagerPage.filteredConfigs

                    delegate: Rectangle {
                        width: siteList.width
                        height: 52
                        color: rowMouse.containsMouse ? theme.primarySoft : (index % 2 === 0 ? theme.surfaceMuted : theme.surface)

                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 16
                            anchors.rightMargin: 16
                            spacing: 0

                            UiCheckBox {
                                Layout.preferredWidth: 36
                                checked: !!siteManagerPage.selectedIds[modelData.id]
                                onToggled: siteManagerPage.setSelected(modelData.id, checked)
                            }

                            TableCell {
                                text: modelData.name
                                strong: true
                                Layout.preferredWidth: 184
                            }

                            TypeBadge {
                                Layout.preferredWidth: 100
                                text: modelData.typeLabel
                                api: modelData.type === "api"
                            }

                            TableCell {
                                text: modelData.networkLabel
                                muted: true
                                Layout.fillWidth: true
                            }

                            StatusBadge {
                                Layout.preferredWidth: 96
                                text: modelData.statusLabel
                                ok: modelData.statusOk
                            }

                            UiSwitch {
                                Layout.preferredWidth: 66
                                checked: modelData.enabled
                                onToggled: appController.setConfigEnabled(modelData.id, checked)
                            }

                            TableCell {
                                text: modelData.updatedAtText
                                muted: true
                                Layout.preferredWidth: 150
                            }

                            RowLayout {
                                Layout.preferredWidth: 212
                                spacing: 10

                                ActionLink {
                                    text: appController.busy ? "执行中" : "登录"
                                    color: theme.primary
                                    enabled: !appController.busy
                                    onClicked: appController.executeOne(modelData.id)
                                }
                                ActionLink {
                                    text: "编辑"
                                    color: theme.textMuted
                                    onClicked: siteManagerPage.editRequested(modelData.id)
                                }
                                ActionLink {
                                    text: "复制"
                                    color: theme.textMuted
                                    onClicked: appController.duplicateConfig(modelData.id)
                                }
                                ActionLink {
                                    text: "删除"
                                    color: theme.danger
                                    onClicked: {
                                        pendingDeleteBatch = false
                                        pendingDeleteId = modelData.id
                                        deleteDialog.open()
                                    }
                                }
                            }
                        }

                        Rectangle {
                            anchors.bottom: parent.bottom
                            anchors.left: parent.left
                            anchors.right: parent.right
                            height: 1
                            color: theme.borderSoft
                        }

                        MouseArea {
                            id: rowMouse
                            anchors.fill: parent
                            acceptedButtons: Qt.NoButton
                            hoverEnabled: true
                        }
                    }

                    Text {
                        anchors.centerIn: parent
                        visible: siteList.count === 0
                        text: appController.loginConfigs.length === 0 ? "还没有站点配置" : "没有匹配的站点"
                        font.pixelSize: 14
                        font.family: theme.fontFamily
                        color: theme.textSoft
                    }
                }
            }
        }
    }

    Dialog {
        id: deleteDialog
        modal: true
        title: "确认删除"
        standardButtons: Dialog.Yes | Dialog.No
        anchors.centerIn: parent

        Text {
            text: pendingDeleteBatch ? "确定删除已选择的站点配置？" : "确定删除这个站点配置？"
            font.pixelSize: 13
            font.family: theme.fontFamily
            color: theme.text
        }

        onAccepted: {
            if (pendingDeleteBatch) {
                var ids = siteManagerPage.selectedIdList()
                for (var i = 0; i < ids.length; ++i)
                    appController.deleteConfig(ids[i])
                siteManagerPage.clearSelection()
            } else {
                appController.deleteConfig(pendingDeleteId)
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

    component TypeBadge: Item {
        property string text: ""
        property bool api: true

        Theme { id: badgeTheme }

        Rectangle {
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            width: 72
            height: 24
            radius: 12
            color: api ? badgeTheme.tint(badgeTheme.violet, 0.12) : badgeTheme.tint(badgeTheme.accent, 0.13)

            Text {
                anchors.centerIn: parent
                text: parent.parent.text
                font.pixelSize: 11
                font.weight: Font.DemiBold
                font.family: badgeTheme.fontFamily
                color: api ? badgeTheme.violet : badgeTheme.accent
            }
        }
    }

    component StatusBadge: Item {
        property string text: ""
        property bool ok: true

        Theme { id: badgeTheme }

        Rectangle {
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            width: statusText.implicitWidth + 20
            height: 24
            radius: 12
            color: ok ? badgeTheme.successSoft : badgeTheme.dangerSoft

            Text {
                id: statusText
                anchors.centerIn: parent
                text: parent.parent.text
                font.pixelSize: 12
                font.weight: Font.DemiBold
                font.family: badgeTheme.fontFamily
                color: ok ? badgeTheme.success : badgeTheme.danger
            }
        }
    }

    component ActionLink: Text {
        id: actionLink

        signal clicked()

        Theme { id: linkTheme }

        font.pixelSize: 12
        font.weight: Font.DemiBold
        font.family: linkTheme.fontFamily
        opacity: enabled ? 1 : 0.45

        MouseArea {
            anchors.fill: parent
            enabled: actionLink.enabled
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: actionLink.clicked()
        }
    }
}
