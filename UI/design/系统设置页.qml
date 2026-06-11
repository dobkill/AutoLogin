import QtQuick
import QtQuick.Shapes

Rectangle {
    id: element

    height: 1024
    width: 1440

    clip: true
    color: "transparent"

    Shape {
        id: _vector

        x: 0.50
        y: 0.50

        height: 1023
        width: 1439

        ShapePath {
            id: _vector_ShapePath0

            fillColor: "#f7f9fc"
            strokeColor: "#9aa7b7"
            strokeWidth: 1

            PathSvg {
                id: _vector_ShapePath0_PathSvg0

                path: "M 12 0 L 1427 0 C 1433.627417087555 0 1439 5.372582912445068 1439 12 L 1439 1011 C 1439 1017.6274170875549 1433.627417087555 1023 1427 1023 L 12 1023 C 5.372582912445068 1023 0 1017.6274170875549 0 1011 L 0 12 C 0 5.372582912445068 5.372582912445068 0 12 0 Z"
            }
        }
    }
    Shape {
        id: _vector_1

        height: 58
        width: 1440

        ShapePath {
            id: _vector_1_ShapePath0

            fillColor: "#ffffff"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_1_ShapePath0_PathSvg0

                path: "M 12 0 L 1428 0 C 1434.627417087555 0 1440 5.372582912445068 1440 12 L 1440 46 C 1440 52.62741708755493 1434.627417087555 58 1428 58 L 12 58 C 5.372582912445068 58 0 52.62741708755493 0 46 L 0 12 C 0 5.372582912445068 5.372582912445068 0 12 0 Z"
            }
        }
    }
    Shape {
        id: _vector_2

        y: 58

        height: 0
        width: 1440

        ShapePath {
            id: _vector_2_ShapePath0

            fillColor: "#000000"
            strokeColor: "#d9e1ec"
            strokeWidth: 1

            PathSvg {
                id: _vector_2_ShapePath0_PathSvg0

                path: "M 0 0 L 1440 0"
            }
        }
    }
    Shape {
        id: _vector_3

        x: 19
        y: 13

        height: 32
        width: 32

        ShapePath {
            id: _vector_3_ShapePath0

            fillColor: "#1677ff"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_3_ShapePath0_PathSvg0

                path: "M 32 16 C 32 24.836556434631348 24.836556434631348 32 16 32 C 7.163443565368652 32 0 24.836556434631348 0 16 C 0 7.163443565368652 7.163443565368652 0 16 0 C 24.836556434631348 0 32 7.163443565368652 32 16 Z"
            }
        }
    }
    Shape {
        id: _vector_4

        x: 28
        y: 20

        height: 18
        width: 14

        ShapePath {
            id: _vector_4_ShapePath0

            fillColor: "#00000000"
            fillRule: ShapePath.WindingFill
            strokeColor: "#ffffff"
            strokeWidth: 2

            PathSvg {
                id: _vector_4_ShapePath0_PathSvg0

                path: "M 0 4 L 7 0 L 14 4 L 14 14 L 7 18 L 0 14 L 0 4 Z"
            }
        }
    }
    Text {
        id: element_1

        x: 64
        y: 15

        height: 27
        width: 111

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 22
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "自动登录器"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_2

        x: 1270
        y: 12

        height: 29
        width: 17

        color: "#111827"
        font.family: "Inter"
        font.pixelSize: 24
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "−"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_5

        x: 1330
        y: 20

        height: 14
        width: 14

        ShapePath {
            id: _vector_5_ShapePath0

            fillColor: "#00000000"
            strokeColor: "#111827"
            strokeWidth: 2

            PathSvg {
                id: _vector_5_ShapePath0_PathSvg0

                path: "M 1 0 L 13 0 C 13.55228477716446 0 14 0.44771522283554077 14 1 L 14 13 C 14 13.55228477716446 13.55228477716446 14 13 14 L 1 14 C 0.44771522283554077 14 0 13.55228477716446 0 13 L 0 1 C 0 0.44771522283554077 0.44771522283554077 0 1 0 Z"
            }
        }
    }
    Text {
        id: element_3

        x: 1385
        y: 9

        height: 34
        width: 20

        color: "#111827"
        font.family: "Inter"
        font.pixelSize: 28
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "×"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_6

        y: 58

        height: 966
        width: 250

        ShapePath {
            id: _vector_6_ShapePath0

            fillColor: "#ffffff"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_6_ShapePath0_PathSvg0

                path: "M 0 0 L 250 0 L 250 966 L 0 966 L 0 0 Z"
            }
        }
    }
    Shape {
        id: _vector_7

        x: 250
        y: 58

        height: 966
        width: 0

        ShapePath {
            id: _vector_7_ShapePath0

            fillColor: "#000000"
            strokeColor: "#d9e1ec"
            strokeWidth: 1

            PathSvg {
                id: _vector_7_ShapePath0_PathSvg0

                path: "M 0 0 L 0 966"
            }
        }
    }
    Text {
        id: element_4

        x: 30
        y: 104

        height: 29
        width: 19

        color: "#637083"
        font.family: "Inter"
        font.pixelSize: 24
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "⌂"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_5

        x: 72
        y: 107

        height: 24
        width: 41

        color: "#344054"
        font.family: "Inter"
        font.pixelSize: 20
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "首页"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_6

        x: 30
        y: 180

        height: 29
        width: 22

        color: "#637083"
        font.family: "Inter"
        font.pixelSize: 24
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "▦"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_7

        x: 72
        y: 183

        height: 24
        width: 81

        color: "#344054"
        font.family: "Inter"
        font.pixelSize: 20
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "站点管理"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_8

        x: 30
        y: 256

        height: 29
        width: 32

        color: "#637083"
        font.family: "Inter"
        font.pixelSize: 24
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "⟳"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_9

        x: 72
        y: 259

        height: 24
        width: 81

        color: "#344054"
        font.family: "Inter"
        font.pixelSize: 20
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "登录配置"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_10

        x: 30
        y: 332

        height: 29
        width: 22

        color: "#637083"
        font.family: "Inter"
        font.pixelSize: 24
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "▣"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_11

        x: 72
        y: 335

        height: 24
        width: 81

        color: "#344054"
        font.family: "Inter"
        font.pixelSize: 20
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "网卡扫描"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_8

        y: 396

        height: 58
        width: 5

        ShapePath {
            id: _vector_8_ShapePath0

            fillColor: "#1677ff"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_8_ShapePath0_PathSvg0

                path: "M 0 0 L 5 0 L 5 58 L 0 58 L 0 0 Z"
            }
        }
    }
    Shape {
        id: _vector_9

        x: 12
        y: 396

        height: 58
        width: 226

        ShapePath {
            id: _vector_9_ShapePath0

            fillColor: "#eaf3ff"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_9_ShapePath0_PathSvg0

                path: "M 8 0 L 218 0 C 222.41827821731567 0 226 3.581721782684326 226 8 L 226 50 C 226 54.418278217315674 222.41827821731567 58 218 58 L 8 58 C 3.581721782684326 58 0 54.418278217315674 0 50 L 0 8 C 0 3.581721782684326 3.581721782684326 0 8 0 Z"
            }
        }
    }
    Text {
        id: element_12

        x: 30
        y: 408

        height: 24
        width: 25

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 24
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "⚙"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_13

        x: 72
        y: 411

        height: 24
        width: 81

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 20
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "系统设置"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_10

        x: 18
        y: 879

        height: 0
        width: 214

        ShapePath {
            id: _vector_10_ShapePath0

            fillColor: "#000000"
            strokeColor: "#e7edf5"
            strokeWidth: 1

            PathSvg {
                id: _vector_10_ShapePath0_PathSvg0

                path: "M 0 0 L 214 0"
            }
        }
    }
    Shape {
        id: _vector_11

        x: 29
        y: 912

        height: 14
        width: 14

        ShapePath {
            id: _vector_11_ShapePath0

            fillColor: "#18a058"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_11_ShapePath0_PathSvg0

                path: "M 14 7 C 14 10.86599326133728 10.86599326133728 14 7 14 C 3.1340067386627197 14 0 10.86599326133728 0 7 C 0 3.1340067386627197 3.1340067386627197 0 7 0 C 10.86599326133728 0 14 3.1340067386627197 14 7 Z"
            }
        }
    }
    Text {
        id: element_14

        x: 56
        y: 910

        height: 19
        width: 81

        color: "#344054"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "服务运行中"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_15

        x: 32
        y: 951

        height: 18
        width: 68

        color: "#69758a"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "版本 1.0.0"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_12

        x: 250
        y: 962

        height: 62
        width: 1190

        ShapePath {
            id: _vector_12_ShapePath0

            fillColor: "#ffffff"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_12_ShapePath0_PathSvg0

                path: "M 0 0 L 1190 0 L 1190 62 L 0 62 L 0 0 Z"
            }
        }
    }
    Shape {
        id: _vector_13

        x: 250
        y: 962

        height: 0
        width: 1190

        ShapePath {
            id: _vector_13_ShapePath0

            fillColor: "#000000"
            strokeColor: "#d9e1ec"
            strokeWidth: 1

            PathSvg {
                id: _vector_13_ShapePath0_PathSvg0

                path: "M 0 0 L 1190 0"
            }
        }
    }
    Text {
        id: intel_Ethernet_192_168_1_20

        x: 585
        y: 984

        height: 19
        width: 381

        color: "#4b5563"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "▣ 当前网卡：以太网 1 / Intel Ethernet / 192.168.1.20"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_14

        x: 1045
        y: 979

        height: 28
        width: 0

        ShapePath {
            id: _vector_14_ShapePath0

            fillColor: "#000000"
            strokeColor: "#c9d2df"
            strokeWidth: 1

            PathSvg {
                id: _vector_14_ShapePath0_PathSvg0

                path: "M 0 0 L 0 28"
            }
        }
    }
    Text {
        id: element_16

        x: 1080
        y: 984

        height: 19
        width: 258

        color: "#4b5563"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "◷ 系统时间：2025-05-24 10:16:08"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_17

        x: 282
        y: 70

        height: 36
        width: 121

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 30
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "系统设置"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_18

        x: 282
        y: 116

        height: 19
        width: 337

        color: "#69758a"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "配置全局应用偏好设置，管理应用行为和外观。"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_15

        x: 280
        y: 182

        height: 345
        width: 1090

        ShapePath {
            id: _vector_15_ShapePath0

            fillColor: "#ffffff"
            strokeColor: "#d9e1ec"
            strokeWidth: 1

            PathSvg {
                id: _vector_15_ShapePath0_PathSvg0

                path: "M 8 0 L 1082 0 C 1086.4182782173157 0 1090 3.581721782684326 1090 8 L 1090 337 C 1090 341.4182782173157 1086.4182782173157 345 1082 345 L 8 345 C 3.581721782684326 345 0 341.4182782173157 0 337 L 0 8 C 0 3.581721782684326 3.581721782684326 0 8 0 Z"
            }
        }
    }
    Text {
        id: element_19

        x: 302
        y: 197

        height: 25
        width: 85

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 21
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "应用行为"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_16

        x: 304
        y: 230

        height: 40
        width: 40

        ShapePath {
            id: _vector_16_ShapePath0

            fillColor: "#eaf3ff"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_16_ShapePath0_PathSvg0

                path: "M 40 20 C 40 31.045695304870605 31.045695304870605 40 20 40 C 8.954304695129395 40 0 31.045695304870605 0 20 C 0 8.954304695129395 8.954304695129395 0 20 0 C 31.045695304870605 0 40 8.954304695129395 40 20 Z"
            }
        }
    }
    Text {
        id: element_20

        x: 315
        y: 237

        height: 24
        width: 19

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 20
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignHCenter
        text: "⏻"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_21

        x: 368
        y: 244

        height: 22
        width: 91

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 18
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "开机自启动"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: windows_

        x: 525
        y: 247

        height: 18
        width: 225

        color: "#4b5563"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "启动 Windows 时自动运行本应用"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_17

        x: 1282
        y: 237

        height: 26
        width: 48

        ShapePath {
            id: _vector_17_ShapePath0

            fillColor: "#1677ff"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_17_ShapePath0_PathSvg0

                path: "M 13 0 L 35 0 C 42.179701805114746 0 48 5.820298194885254 48 13 C 48 20.179701805114746 42.179701805114746 26 35 26 L 13 26 C 5.820298194885254 26 0 20.179701805114746 0 13 C 0 5.820298194885254 5.820298194885254 0 13 0 Z"
            }
        }
    }
    Shape {
        id: _vector_18

        x: 1307
        y: 240

        height: 20
        width: 20

        ShapePath {
            id: _vector_18_ShapePath0

            fillColor: "#ffffff"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_18_ShapePath0_PathSvg0

                path: "M 20 10 C 20 15.522847652435303 15.522847652435303 20 10 20 C 4.477152347564697 20 0 15.522847652435303 0 10 C 0 4.477152347564697 4.477152347564697 0 10 0 C 15.522847652435303 0 20 4.477152347564697 20 10 Z"
            }
        }
    }
    Shape {
        id: _vector_19

        x: 304
        y: 290

        height: 0
        width: 1042

        ShapePath {
            id: _vector_19_ShapePath0

            fillColor: "#000000"
            strokeColor: "#edf1f7"
            strokeWidth: 1

            PathSvg {
                id: _vector_19_ShapePath0_PathSvg0

                path: "M 0 0 L 1042 0"
            }
        }
    }
    Shape {
        id: _vector_20

        x: 304
        y: 288

        height: 40
        width: 40

        ShapePath {
            id: _vector_20_ShapePath0

            fillColor: "#eaf3ff"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_20_ShapePath0_PathSvg0

                path: "M 40 20 C 40 31.045695304870605 31.045695304870605 40 20 40 C 8.954304695129395 40 0 31.045695304870605 0 20 C 0 8.954304695129395 8.954304695129395 0 20 0 C 31.045695304870605 0 40 8.954304695129395 40 20 Z"
            }
        }
    }
    Text {
        id: element_22

        x: 314
        y: 295

        height: 24
        width: 21

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 20
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignHCenter
        text: "♙"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_23

        x: 368
        y: 302

        height: 22
        width: 127

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 18
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "启动后自动登录"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_24

        x: 525
        y: 305

        height: 18
        width: 316

        color: "#4b5563"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "应用启动后自动使用上次的站点和登录方式登录"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_21

        x: 1282
        y: 295

        height: 26
        width: 48

        ShapePath {
            id: _vector_21_ShapePath0

            fillColor: "#1677ff"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_21_ShapePath0_PathSvg0

                path: "M 13 0 L 35 0 C 42.179701805114746 0 48 5.820298194885254 48 13 C 48 20.179701805114746 42.179701805114746 26 35 26 L 13 26 C 5.820298194885254 26 0 20.179701805114746 0 13 C 0 5.820298194885254 5.820298194885254 0 13 0 Z"
            }
        }
    }
    Shape {
        id: _vector_22

        x: 1307
        y: 298

        height: 20
        width: 20

        ShapePath {
            id: _vector_22_ShapePath0

            fillColor: "#ffffff"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_22_ShapePath0_PathSvg0

                path: "M 20 10 C 20 15.522847652435303 15.522847652435303 20 10 20 C 4.477152347564697 20 0 15.522847652435303 0 10 C 0 4.477152347564697 4.477152347564697 0 10 0 C 15.522847652435303 0 20 4.477152347564697 20 10 Z"
            }
        }
    }
    Shape {
        id: _vector_23

        x: 304
        y: 348

        height: 0
        width: 1042

        ShapePath {
            id: _vector_23_ShapePath0

            fillColor: "#000000"
            strokeColor: "#edf1f7"
            strokeWidth: 1

            PathSvg {
                id: _vector_23_ShapePath0_PathSvg0

                path: "M 0 0 L 1042 0"
            }
        }
    }
    Shape {
        id: _vector_24

        x: 304
        y: 346

        height: 40
        width: 40

        ShapePath {
            id: _vector_24_ShapePath0

            fillColor: "#eaf3ff"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_24_ShapePath0_PathSvg0

                path: "M 40 20 C 40 31.045695304870605 31.045695304870605 40 20 40 C 8.954304695129395 40 0 31.045695304870605 0 20 C 0 8.954304695129395 8.954304695129395 0 20 0 C 31.045695304870605 0 40 8.954304695129395 40 20 Z"
            }
        }
    }
    Text {
        id: element_25

        x: 314
        y: 353

        height: 20
        width: 21

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 20
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignHCenter
        text: "⚙"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_26

        x: 368
        y: 360

        height: 22
        width: 73

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 18
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "调试模式"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_27

        x: 525
        y: 363

        height: 18
        width: 346

        color: "#4b5563"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "启用后将输出详细日志，便于排查问题（重启生效）"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_25

        x: 1282
        y: 353

        height: 26
        width: 48

        ShapePath {
            id: _vector_25_ShapePath0

            fillColor: "#b8c0cc"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_25_ShapePath0_PathSvg0

                path: "M 13 0 L 35 0 C 42.179701805114746 0 48 5.820298194885254 48 13 C 48 20.179701805114746 42.179701805114746 26 35 26 L 13 26 C 5.820298194885254 26 0 20.179701805114746 0 13 C 0 5.820298194885254 5.820298194885254 0 13 0 Z"
            }
        }
    }
    Shape {
        id: _vector_26

        x: 1285
        y: 356

        height: 20
        width: 20

        ShapePath {
            id: _vector_26_ShapePath0

            fillColor: "#ffffff"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_26_ShapePath0_PathSvg0

                path: "M 20 10 C 20 15.522847652435303 15.522847652435303 20 10 20 C 4.477152347564697 20 0 15.522847652435303 0 10 C 0 4.477152347564697 4.477152347564697 0 10 0 C 15.522847652435303 0 20 4.477152347564697 20 10 Z"
            }
        }
    }
    Shape {
        id: _vector_27

        x: 304
        y: 406

        height: 0
        width: 1042

        ShapePath {
            id: _vector_27_ShapePath0

            fillColor: "#000000"
            strokeColor: "#edf1f7"
            strokeWidth: 1

            PathSvg {
                id: _vector_27_ShapePath0_PathSvg0

                path: "M 0 0 L 1042 0"
            }
        }
    }
    Shape {
        id: _vector_28

        x: 304
        y: 404

        height: 40
        width: 40

        ShapePath {
            id: _vector_28_ShapePath0

            fillColor: "#eaf3ff"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_28_ShapePath0_PathSvg0

                path: "M 40 20 C 40 31.045695304870605 31.045695304870605 40 20 40 C 8.954304695129395 40 0 31.045695304870605 0 20 C 0 8.954304695129395 8.954304695129395 0 20 0 C 31.045695304870605 0 40 8.954304695129395 40 20 Z"
            }
        }
    }
    Text {
        id: element_28

        x: 315.50
        y: 411

        height: 24
        width: 18

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 20
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignHCenter
        text: "▣"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_29

        x: 368
        y: 418

        height: 22
        width: 109

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 18
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "最小化到托盘"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_30

        x: 525
        y: 421

        height: 18
        width: 226

        color: "#4b5563"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "点击关闭按钮时最小化到系统托盘"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_29

        x: 1282
        y: 411

        height: 26
        width: 48

        ShapePath {
            id: _vector_29_ShapePath0

            fillColor: "#1677ff"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_29_ShapePath0_PathSvg0

                path: "M 13 0 L 35 0 C 42.179701805114746 0 48 5.820298194885254 48 13 C 48 20.179701805114746 42.179701805114746 26 35 26 L 13 26 C 5.820298194885254 26 0 20.179701805114746 0 13 C 0 5.820298194885254 5.820298194885254 0 13 0 Z"
            }
        }
    }
    Shape {
        id: _vector_30

        x: 1307
        y: 414

        height: 20
        width: 20

        ShapePath {
            id: _vector_30_ShapePath0

            fillColor: "#ffffff"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_30_ShapePath0_PathSvg0

                path: "M 20 10 C 20 15.522847652435303 15.522847652435303 20 10 20 C 4.477152347564697 20 0 15.522847652435303 0 10 C 0 4.477152347564697 4.477152347564697 0 10 0 C 15.522847652435303 0 20 4.477152347564697 20 10 Z"
            }
        }
    }
    Shape {
        id: _vector_31

        x: 304
        y: 464

        height: 0
        width: 1042

        ShapePath {
            id: _vector_31_ShapePath0

            fillColor: "#000000"
            strokeColor: "#edf1f7"
            strokeWidth: 1

            PathSvg {
                id: _vector_31_ShapePath0_PathSvg0

                path: "M 0 0 L 1042 0"
            }
        }
    }
    Shape {
        id: _vector_32

        x: 304
        y: 462

        height: 40
        width: 40

        ShapePath {
            id: _vector_32_ShapePath0

            fillColor: "#e8f8ef"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_32_ShapePath0_PathSvg0

                path: "M 40 20 C 40 31.045695304870605 31.045695304870605 40 20 40 C 8.954304695129395 40 0 31.045695304870605 0 20 C 0 8.954304695129395 8.954304695129395 0 20 0 C 31.045695304870605 0 40 8.954304695129395 40 20 Z"
            }
        }
    }
    Text {
        id: element_31

        x: 314
        y: 469

        height: 20
        width: 21

        color: "#18a058"
        font.family: "Inter"
        font.pixelSize: 20
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignHCenter
        text: "🛡"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_32

        x: 368
        y: 476

        height: 22
        width: 73

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 18
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "证书校验"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: sSL_TLS_

        x: 525
        y: 479

        height: 18
        width: 400

        color: "#4b5563"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "验证服务器 SSL/TLS 证书有效性（关闭可能存在安全风险）"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_33

        x: 1282
        y: 469

        height: 26
        width: 48

        ShapePath {
            id: _vector_33_ShapePath0

            fillColor: "#1677ff"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_33_ShapePath0_PathSvg0

                path: "M 13 0 L 35 0 C 42.179701805114746 0 48 5.820298194885254 48 13 C 48 20.179701805114746 42.179701805114746 26 35 26 L 13 26 C 5.820298194885254 26 0 20.179701805114746 0 13 C 0 5.820298194885254 5.820298194885254 0 13 0 Z"
            }
        }
    }
    Shape {
        id: _vector_34

        x: 1307
        y: 472

        height: 20
        width: 20

        ShapePath {
            id: _vector_34_ShapePath0

            fillColor: "#ffffff"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_34_ShapePath0_PathSvg0

                path: "M 20 10 C 20 15.522847652435303 15.522847652435303 20 10 20 C 4.477152347564697 20 0 15.522847652435303 0 10 C 0 4.477152347564697 4.477152347564697 0 10 0 C 15.522847652435303 0 20 4.477152347564697 20 10 Z"
            }
        }
    }
    Shape {
        id: _vector_35

        x: 280
        y: 550

        height: 180
        width: 505

        ShapePath {
            id: _vector_35_ShapePath0

            fillColor: "#ffffff"
            strokeColor: "#d9e1ec"
            strokeWidth: 1

            PathSvg {
                id: _vector_35_ShapePath0_PathSvg0

                path: "M 8 0 L 497 0 C 501.4182782173157 0 505 3.581721782684326 505 8 L 505 172 C 505 176.41827821731567 501.4182782173157 180 497 180 L 8 180 C 3.581721782684326 180 0 176.41827821731567 0 172 L 0 8 C 0 3.581721782684326 3.581721782684326 0 8 0 Z"
            }
        }
    }
    Text {
        id: element_33

        x: 304
        y: 567

        height: 25
        width: 106

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 21
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "界面与区域"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_36

        x: 304
        y: 605

        height: 40
        width: 40

        ShapePath {
            id: _vector_36_ShapePath0

            fillColor: "#eaf3ff"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_36_ShapePath0_PathSvg0

                path: "M 40 20 C 40 31.045695304870605 31.045695304870605 40 20 40 C 8.954304695129395 40 0 31.045695304870605 0 20 C 0 8.954304695129395 8.954304695129395 0 20 0 C 31.045695304870605 0 40 8.954304695129395 40 20 Z"
            }
        }
    }
    Text {
        id: element_34

        x: 318
        y: 613

        height: 24
        width: 13

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 20
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignHCenter
        text: "◌"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_35

        x: 366
        y: 616

        height: 21
        width: 35

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 17
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "主题"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_37

        x: 460
        y: 608

        height: 42
        width: 300

        ShapePath {
            id: _vector_37_ShapePath0

            fillColor: "#ffffff"
            strokeColor: "#d6deea"
            strokeWidth: 1

            PathSvg {
                id: _vector_37_ShapePath0_PathSvg0

                path: "M 6 0 L 294 0 C 297.31370854377747 0 300 2.686291456222534 300 6 L 300 36 C 300 39.313708543777466 297.31370854377747 42 294 42 L 6 42 C 2.686291456222534 42 0 39.313708543777466 0 36 L 0 6 C 0 2.686291456222534 2.686291456222534 0 6 0 Z"
            }
        }
    }
    Text {
        id: element_36

        x: 476
        y: 620

        height: 18
        width: 61

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "跟随系统"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_37

        x: 729
        y: 617

        height: 22
        width: 11

        color: "#69758a"
        font.family: "Inter"
        font.pixelSize: 18
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignHCenter
        text: "⌄"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_38

        x: 304
        y: 665

        height: 40
        width: 40

        ShapePath {
            id: _vector_38_ShapePath0

            fillColor: "#eaf3ff"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_38_ShapePath0_PathSvg0

                path: "M 40 20 C 40 31.045695304870605 31.045695304870605 40 20 40 C 8.954304695129395 40 0 31.045695304870605 0 20 C 0 8.954304695129395 8.954304695129395 0 20 0 C 31.045695304870605 0 40 8.954304695129395 40 20 Z"
            }
        }
    }
    Text {
        id: element_38

        x: 315
        y: 673

        height: 24
        width: 19

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 20
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignHCenter
        text: "◎"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_39

        x: 366
        y: 676

        height: 21
        width: 35

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 17
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "语言"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_39

        x: 460
        y: 668

        height: 42
        width: 300

        ShapePath {
            id: _vector_39_ShapePath0

            fillColor: "#ffffff"
            strokeColor: "#d6deea"
            strokeWidth: 1

            PathSvg {
                id: _vector_39_ShapePath0_PathSvg0

                path: "M 6 0 L 294 0 C 297.31370854377747 0 300 2.686291456222534 300 6 L 300 36 C 300 39.313708543777466 297.31370854377747 42 294 42 L 6 42 C 2.686291456222534 42 0 39.313708543777466 0 36 L 0 6 C 0 2.686291456222534 2.686291456222534 0 6 0 Z"
            }
        }
    }
    Text {
        id: element_40

        x: 476
        y: 680

        height: 18
        width: 61

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "简体中文"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_41

        x: 729
        y: 677

        height: 22
        width: 11

        color: "#69758a"
        font.family: "Inter"
        font.pixelSize: 18
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignHCenter
        text: "⌄"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_40

        x: 805
        y: 550

        height: 180
        width: 565

        ShapePath {
            id: _vector_40_ShapePath0

            fillColor: "#ffffff"
            strokeColor: "#d9e1ec"
            strokeWidth: 1

            PathSvg {
                id: _vector_40_ShapePath0_PathSvg0

                path: "M 8 0 L 557 0 C 561.4182782173157 0 565 3.581721782684326 565 8 L 565 172 C 565 176.41827821731567 561.4182782173157 180 557 180 L 8 180 C 3.581721782684326 180 0 176.41827821731567 0 172 L 0 8 C 0 3.581721782684326 3.581721782684326 0 8 0 Z"
            }
        }
    }
    Text {
        id: element_42

        x: 830
        y: 567

        height: 25
        width: 106

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 21
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "网络与连接"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_41

        x: 830
        y: 605

        height: 40
        width: 40

        ShapePath {
            id: _vector_41_ShapePath0

            fillColor: "#eaf3ff"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_41_ShapePath0_PathSvg0

                path: "M 40 20 C 40 31.045695304870605 31.045695304870605 40 20 40 C 8.954304695129395 40 0 31.045695304870605 0 20 C 0 8.954304695129395 8.954304695129395 0 20 0 C 31.045695304870605 0 40 8.954304695129395 40 20 Z"
            }
        }
    }
    Text {
        id: element_43

        x: 841.50
        y: 613

        height: 24
        width: 18

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 20
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignHCenter
        text: "▣"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_44

        x: 892
        y: 616

        height: 21
        width: 103

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 17
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "默认网卡策略"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_42

        x: 1060
        y: 608

        height: 42
        width: 310

        ShapePath {
            id: _vector_42_ShapePath0

            fillColor: "#ffffff"
            strokeColor: "#d6deea"
            strokeWidth: 1

            PathSvg {
                id: _vector_42_ShapePath0_PathSvg0

                path: "M 6 0 L 304 0 C 307.31370854377747 0 310 2.686291456222534 310 6 L 310 36 C 310 39.313708543777466 307.31370854377747 42 304 42 L 6 42 C 2.686291456222534 42 0 39.313708543777466 0 36 L 0 6 C 0 2.686291456222534 2.686291456222534 0 6 0 Z"
            }
        }
    }
    Text {
        id: element_45

        x: 1076
        y: 620

        height: 18
        width: 151

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "优先使用系统默认网卡"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_46

        x: 1339
        y: 617

        height: 22
        width: 11

        color: "#69758a"
        font.family: "Inter"
        font.pixelSize: 18
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignHCenter
        text: "⌄"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_43

        x: 830
        y: 665

        height: 40
        width: 40

        ShapePath {
            id: _vector_43_ShapePath0

            fillColor: "#eaf3ff"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_43_ShapePath0_PathSvg0

                path: "M 40 20 C 40 31.045695304870605 31.045695304870605 40 20 40 C 8.954304695129395 40 0 31.045695304870605 0 20 C 0 8.954304695129395 8.954304695129395 0 20 0 C 31.045695304870605 0 40 8.954304695129395 40 20 Z"
            }
        }
    }
    Text {
        id: element_47

        x: 836.50
        y: 673

        height: 24
        width: 28

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 20
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignHCenter
        text: "↔"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_48

        x: 892
        y: 676

        height: 21
        width: 154

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 17
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "当指定网卡不可用时"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_44

        x: 1060
        y: 668

        height: 42
        width: 310

        ShapePath {
            id: _vector_44_ShapePath0

            fillColor: "#ffffff"
            strokeColor: "#d6deea"
            strokeWidth: 1

            PathSvg {
                id: _vector_44_ShapePath0_PathSvg0

                path: "M 6 0 L 304 0 C 307.31370854377747 0 310 2.686291456222534 310 6 L 310 36 C 310 39.313708543777466 307.31370854377747 42 304 42 L 6 42 C 2.686291456222534 42 0 39.313708543777466 0 36 L 0 6 C 0 2.686291456222534 2.686291456222534 0 6 0 Z"
            }
        }
    }
    Text {
        id: element_49

        x: 1076
        y: 680

        height: 18
        width: 136

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "自动切换到默认网卡"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_50

        x: 1339
        y: 677

        height: 22
        width: 11

        color: "#69758a"
        font.family: "Inter"
        font.pixelSize: 18
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignHCenter
        text: "⌄"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_45

        x: 280
        y: 750

        height: 180
        width: 1090

        ShapePath {
            id: _vector_45_ShapePath0

            fillColor: "#ffffff"
            strokeColor: "#d9e1ec"
            strokeWidth: 1

            PathSvg {
                id: _vector_45_ShapePath0_PathSvg0

                path: "M 8 0 L 1082 0 C 1086.4182782173157 0 1090 3.581721782684326 1090 8 L 1090 172 C 1090 176.41827821731567 1086.4182782173157 180 1082 180 L 8 180 C 3.581721782684326 180 0 176.41827821731567 0 172 L 0 8 C 0 3.581721782684326 3.581721782684326 0 8 0 Z"
            }
        }
    }
    Text {
        id: element_51

        x: 304
        y: 767

        height: 25
        width: 106

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 21
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "存储与日志"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_46

        x: 305
        y: 813

        height: 40
        width: 40

        ShapePath {
            id: _vector_46_ShapePath0

            fillColor: "#eaf3ff"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_46_ShapePath0_PathSvg0

                path: "M 40 20 C 40 31.045695304870605 31.045695304870605 40 20 40 C 8.954304695129395 40 0 31.045695304870605 0 20 C 0 8.954304695129395 8.954304695129395 0 20 0 C 31.045695304870605 0 40 8.954304695129395 40 20 Z"
            }
        }
    }
    Text {
        id: element_52

        x: 315.50
        y: 821

        height: 24
        width: 20

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 20
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignHCenter
        text: "□"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_53

        x: 368
        y: 824

        height: 21
        width: 69

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 17
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "数据目录"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_54

        x: 460
        y: 827

        height: 17
        width: 197

        color: "#69758a"
        font.family: "Inter"
        font.pixelSize: 14
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "存储站点配置、账号凭据等数据"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_47

        x: 710
        y: 815

        height: 42
        width: 535

        ShapePath {
            id: _vector_47_ShapePath0

            fillColor: "#ffffff"
            strokeColor: "#d6deea"
            strokeWidth: 1

            PathSvg {
                id: _vector_47_ShapePath0_PathSvg0

                path: "M 6 0 L 529 0 C 532.3137085437775 0 535 2.686291456222534 535 6 L 535 36 C 535 39.313708543777466 532.3137085437775 42 529 42 L 6 42 C 2.686291456222534 42 0 39.313708543777466 0 36 L 0 6 C 0 2.686291456222534 2.686291456222534 0 6 0 Z"
            }
        }
    }
    Text {
        id: c_ProgramData_AutoLogin_

        x: 726
        y: 827

        height: 18
        width: 196

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "C:\\ProgramData\\AutoLogin\\"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_48

        x: 1265
        y: 815

        height: 42
        width: 83

        ShapePath {
            id: _vector_48_ShapePath0

            fillColor: "#ffffff"
            strokeColor: "#9bc0ff"
            strokeWidth: 1

            PathSvg {
                id: _vector_48_ShapePath0_PathSvg0

                path: "M 7 0 L 76 0 C 79.86599326133728 0 83 3.1340067386627197 83 7 L 83 35 C 83 38.86599326133728 79.86599326133728 42 76 42 L 7 42 C 3.1340067386627197 42 0 38.86599326133728 0 35 L 0 7 C 0 3.1340067386627197 3.1340067386627197 0 7 0 Z"
            }
        }
    }
    Text {
        id: element_55

        x: 1290.50
        y: 827

        height: 19
        width: 33

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignHCenter
        text: "浏览"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_49

        x: 305
        y: 875

        height: 40
        width: 40

        ShapePath {
            id: _vector_49_ShapePath0

            fillColor: "#eaf3ff"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_49_ShapePath0_PathSvg0

                path: "M 40 20 C 40 31.045695304870605 31.045695304870605 40 20 40 C 8.954304695129395 40 0 31.045695304870605 0 20 C 0 8.954304695129395 8.954304695129395 0 20 0 C 31.045695304870605 0 40 8.954304695129395 40 20 Z"
            }
        }
    }
    Text {
        id: element_56

        x: 316.50
        y: 883

        height: 24
        width: 18

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 20
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignHCenter
        text: "▤"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_57

        x: 368
        y: 886

        height: 21
        width: 69

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 17
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "日志目录"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_58

        x: 460
        y: 889

        height: 17
        width: 141

        color: "#69758a"
        font.family: "Inter"
        font.pixelSize: 14
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "存储应用运行日志文件"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_50

        x: 710
        y: 877

        height: 42
        width: 535

        ShapePath {
            id: _vector_50_ShapePath0

            fillColor: "#ffffff"
            strokeColor: "#d6deea"
            strokeWidth: 1

            PathSvg {
                id: _vector_50_ShapePath0_PathSvg0

                path: "M 6 0 L 529 0 C 532.3137085437775 0 535 2.686291456222534 535 6 L 535 36 C 535 39.313708543777466 532.3137085437775 42 529 42 L 6 42 C 2.686291456222534 42 0 39.313708543777466 0 36 L 0 6 C 0 2.686291456222534 2.686291456222534 0 6 0 Z"
            }
        }
    }
    Text {
        id: c_ProgramData_AutoLogin_Logs_

        x: 726
        y: 889

        height: 18
        width: 235

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "C:\\ProgramData\\AutoLogin\\Logs\\"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_51

        x: 1265
        y: 877

        height: 42
        width: 83

        ShapePath {
            id: _vector_51_ShapePath0

            fillColor: "#ffffff"
            strokeColor: "#9bc0ff"
            strokeWidth: 1

            PathSvg {
                id: _vector_51_ShapePath0_PathSvg0

                path: "M 7 0 L 76 0 C 79.86599326133728 0 83 3.1340067386627197 83 7 L 83 35 C 83 38.86599326133728 79.86599326133728 42 76 42 L 7 42 C 3.1340067386627197 42 0 38.86599326133728 0 35 L 0 7 C 0 3.1340067386627197 3.1340067386627197 0 7 0 Z"
            }
        }
    }
    Text {
        id: element_59

        x: 1290.50
        y: 889

        height: 19
        width: 33

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignHCenter
        text: "浏览"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_52

        x: 1110
        y: 955

        height: 48
        width: 260

        ShapePath {
            id: _vector_52_ShapePath0

            fillColor: "#ffffff"
            strokeColor: "#9bc0ff"
            strokeWidth: 1

            PathSvg {
                id: _vector_52_ShapePath0_PathSvg0

                path: "M 7 0 L 253 0 C 256.8659932613373 0 260 3.1340067386627197 260 7 L 260 41 C 260 44.86599326133728 256.8659932613373 48 253 48 L 7 48 C 3.1340067386627197 48 0 44.86599326133728 0 41 L 0 7 C 0 3.1340067386627197 3.1340067386627197 0 7 0 Z"
            }
        }
    }
    Text {
        id: element_60

        x: 1132
        y: 968

        height: 22
        width: 19

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 18
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "↻"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_61

        x: 1158
        y: 970

        height: 19
        width: 97

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "恢复默认设置"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
}