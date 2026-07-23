import QtQuick

QtObject {
    readonly property string fontFamily: Qt.platform.os === "windows" ? "Microsoft YaHei UI" : "Inter"
    readonly property string monoFontFamily: Qt.platform.os === "windows" ? "Cascadia Mono" : "Consolas"

    readonly property color page: "#eef3f7"
    readonly property color surface: "#ffffff"
    readonly property color surfaceMuted: "#f6f8fb"
    readonly property color surfaceStrong: "#edf2f7"
    readonly property color border: "#d8e0ea"
    readonly property color borderSoft: "#e7edf4"
    readonly property color text: "#172033"
    readonly property color textMuted: "#607086"
    readonly property color textSoft: "#8a98aa"

    readonly property color primary: "#2563eb"
    readonly property color primaryHover: "#1d4ed8"
    readonly property color primaryPressed: "#1e40af"
    readonly property color primarySoft: "#eaf2ff"

    readonly property color accent: "#0891b2"
    readonly property color violet: "#7c3aed"
    readonly property color success: "#16a34a"
    readonly property color successSoft: "#e9f8ef"
    readonly property color warning: "#d97706"
    readonly property color warningSoft: "#fff7e6"
    readonly property color danger: "#dc2626"
    readonly property color dangerSoft: "#fff1f2"

    readonly property int radius: 8
    readonly property int controlHeight: 38

    function tint(c, alpha) {
        return Qt.rgba(c.r, c.g, c.b, alpha)
    }
}
