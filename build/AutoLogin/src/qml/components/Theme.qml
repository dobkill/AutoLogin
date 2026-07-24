import QtQuick

QtObject {
    readonly property string fontFamily: Qt.platform.os === "windows" ? "Microsoft YaHei UI" : "Inter"
    readonly property string monoFontFamily: Qt.platform.os === "windows" ? "Cascadia Mono" : "Consolas"
    readonly property bool dark: appController.settings.theme === "dark"

    readonly property color page: dark ? "#101820" : "#eef3f7"
    readonly property color surface: dark ? "#182330" : "#ffffff"
    readonly property color surfaceMuted: dark ? "#202d3a" : "#f6f8fb"
    readonly property color surfaceStrong: dark ? "#273545" : "#edf2f7"
    readonly property color border: dark ? "#3a4a5c" : "#d8e0ea"
    readonly property color borderSoft: dark ? "#2b3a49" : "#e7edf4"
    readonly property color text: dark ? "#edf4fb" : "#172033"
    readonly property color textMuted: dark ? "#b0bfce" : "#607086"
    readonly property color textSoft: dark ? "#7f90a3" : "#8a98aa"

    readonly property color primary: dark ? "#60a5fa" : "#2563eb"
    readonly property color primaryHover: dark ? "#3b82f6" : "#1d4ed8"
    readonly property color primaryPressed: dark ? "#2563eb" : "#1e40af"
    readonly property color primarySoft: dark ? "#1f3655" : "#eaf2ff"

    readonly property color accent: dark ? "#22d3ee" : "#0891b2"
    readonly property color violet: "#7c3aed"
    readonly property color success: dark ? "#4ade80" : "#16a34a"
    readonly property color successSoft: dark ? "#193b2a" : "#e9f8ef"
    readonly property color warning: dark ? "#f59e0b" : "#d97706"
    readonly property color warningSoft: dark ? "#3c2d13" : "#fff7e6"
    readonly property color danger: dark ? "#fb7185" : "#dc2626"
    readonly property color dangerSoft: dark ? "#43202a" : "#fff1f2"

    readonly property int radius: 8
    readonly property int controlHeight: 38

    function tint(c, alpha) {
        return Qt.rgba(c.r, c.g, c.b, alpha)
    }
}
