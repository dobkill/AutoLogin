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
    Shape {
        id: _vector_8

        y: 320

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
        y: 320

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
        id: element_10

        x: 30
        y: 332

        height: 29
        width: 22

        color: "#1677ff"
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

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 20
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "网卡扫描"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_12

        x: 30
        y: 408

        height: 24
        width: 25

        color: "#637083"
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

        color: "#344054"
        font.family: "Inter"
        font.pixelSize: 20
        font.weight: Font.Normal
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
        text: "网卡扫描"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_18

        x: 282
        y: 116

        height: 19
        width: 289

        color: "#69758a"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "扫描并管理当前系统中可用的网络接口。"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_15

        x: 824
        y: 102

        height: 58
        width: 174

        ShapePath {
            id: _vector_15_ShapePath0

            strokeColor: "#0f5eea"
            strokeWidth: 1

            fillGradient: LinearGradient {
                id: _vector_15_ShapePath0_LinearGradient_1
            
                x1: _vector_15.width * 0
                x2: _vector_15.width * 1
                y1: _vector_15.height * 0
                y2: _vector_15.height * 1
            
                GradientStop {
                    id: _vector_15_ShapePath0_LinearGradient_1_GradientS
            
                    color: "#ff1d7cff"
                    position: 0
                }
                GradientStop {
                    id: _vector_15_ShapePath0_LinearGradient_1_GradientS_1
            
                    color: "#ff0f5eea"
                    position: 1
                }
            }

            PathSvg {
                id: _vector_15_ShapePath0_PathSvg0

                path: "M 7 0 L 167 0 C 170.86599326133728 0 174 3.1340067386627197 174 7 L 174 51 C 174 54.86599326133728 170.86599326133728 58 167 58 L 7 58 C 3.1340067386627197 58 0 54.86599326133728 0 51 L 0 7 C 0 3.1340067386627197 3.1340067386627197 0 7 0 Z"
            }
        }
    }
    Text {
        id: element_19

        x: 846
        y: 120

        height: 22
        width: 19

        color: "#ffffff"
        font.family: "Inter"
        font.pixelSize: 18
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "↻"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_20

        x: 872
        y: 122

        height: 19
        width: 65

        color: "#ffffff"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "扫描网卡"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_16

        x: 1015
        y: 102

        height: 58
        width: 170

        ShapePath {
            id: _vector_16_ShapePath0

            fillColor: "#ffffff"
            strokeColor: "#9bc0ff"
            strokeWidth: 1

            PathSvg {
                id: _vector_16_ShapePath0_PathSvg0

                path: "M 7 0 L 163 0 C 166.86599326133728 0 170 3.1340067386627197 170 7 L 170 51 C 170 54.86599326133728 166.86599326133728 58 163 58 L 7 58 C 3.1340067386627197 58 0 54.86599326133728 0 51 L 0 7 C 0 3.1340067386627197 3.1340067386627197 0 7 0 Z"
            }
        }
    }
    Text {
        id: element_21

        x: 1037
        y: 120

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
        id: element_22

        x: 1063
        y: 122

        height: 19
        width: 65

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "刷新状态"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_17

        x: 1202
        y: 102

        height: 58
        width: 168

        ShapePath {
            id: _vector_17_ShapePath0

            fillColor: "#ffffff"
            strokeColor: "#9bc0ff"
            strokeWidth: 1

            PathSvg {
                id: _vector_17_ShapePath0_PathSvg0

                path: "M 7 0 L 161 0 C 164.86599326133728 0 168 3.1340067386627197 168 7 L 168 51 C 168 54.86599326133728 164.86599326133728 58 161 58 L 7 58 C 3.1340067386627197 58 0 54.86599326133728 0 51 L 0 7 C 0 3.1340067386627197 3.1340067386627197 0 7 0 Z"
            }
        }
    }
    Text {
        id: element_23

        x: 1224
        y: 120

        height: 22
        width: 17

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 18
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "✓"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_24

        x: 1250
        y: 122

        height: 19
        width: 65

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "设为默认"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_18

        x: 286
        y: 199

        height: 392
        width: 1084

        ShapePath {
            id: _vector_18_ShapePath0

            fillColor: "#ffffff"
            strokeColor: "#d9e1ec"
            strokeWidth: 1

            PathSvg {
                id: _vector_18_ShapePath0_PathSvg0

                path: "M 8 0 L 1076 0 C 1080.4182782173157 0 1084 3.581721782684326 1084 8 L 1084 384 C 1084 388.4182782173157 1080.4182782173157 392 1076 392 L 8 392 C 3.581721782684326 392 0 388.4182782173157 0 384 L 0 8 C 0 3.581721782684326 3.581721782684326 0 8 0 Z"
            }
        }
    }
    Shape {
        id: _vector_19

        x: 286
        y: 199

        height: 64
        width: 1084

        ShapePath {
            id: _vector_19_ShapePath0

            fillColor: "#f8fafc"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_19_ShapePath0_PathSvg0

                path: "M 8 0 L 1076 0 C 1080.4182782173157 0 1084 3.581721782684326 1084 8 L 1084 56 C 1084 60.418278217315674 1080.4182782173157 64 1076 64 L 8 64 C 3.581721782684326 64 0 60.418278217315674 0 56 L 0 8 C 0 3.581721782684326 3.581721782684326 0 8 0 Z"
            }
        }
    }
    Text {
        id: element_25

        x: 316
        y: 225

        height: 19
        width: 65

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "网卡名称"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_26

        x: 611
        y: 225

        height: 19
        width: 33

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "类型"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: iP_

        x: 736
        y: 225

        height: 19
        width: 52

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "IP 地址"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: mAC_

        x: 871
        y: 225

        height: 19
        width: 75

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "MAC 地址"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_27

        x: 1084
        y: 225

        height: 19
        width: 33

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "状态"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_28

        x: 1196
        y: 225

        height: 19
        width: 33

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "默认"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_29

        x: 1301
        y: 225

        height: 19
        width: 49

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "可用性"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_20

        x: 286
        y: 263

        height: 0
        width: 1084

        ShapePath {
            id: _vector_20_ShapePath0

            fillColor: "#000000"
            strokeColor: "#edf1f7"
            strokeWidth: 1

            PathSvg {
                id: _vector_20_ShapePath0_PathSvg0

                path: "M 0 0 L 1084 0"
            }
        }
    }
    Text {
        id: intel_Ethernet_

        x: 316
        y: 284

        height: 18
        width: 168

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "以太网 1 (Intel Ethernet)"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_30

        x: 611
        y: 284

        height: 18
        width: 31

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "有线"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_31

        x: 736
        y: 284

        height: 18
        width: 87

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "192.168.1.20"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: c_2B_3A_4D_5E

        x: 871
        y: 284

        height: 18
        width: 133

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "10:1C:2B:3A:4D:5E"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_32

        x: 1084
        y: 284

        height: 18
        width: 64

        color: "#18a058"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "● 已连接"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_33

        x: 1206
        y: 284

        height: 18
        width: 15

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "◉"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_34

        x: 1301
        y: 284

        height: 18
        width: 49

        color: "#18a058"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "✓ 可用"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_21

        x: 286
        y: 327

        height: 0
        width: 1084

        ShapePath {
            id: _vector_21_ShapePath0

            fillColor: "#000000"
            strokeColor: "#edf1f7"
            strokeWidth: 1

            PathSvg {
                id: _vector_21_ShapePath0_PathSvg0

                path: "M 0 0 L 1084 0"
            }
        }
    }
    Text {
        id: wi_Fi_Intel_Wireless_AC_9560_

        x: 316
        y: 348

        height: 18
        width: 217

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "Wi-Fi (Intel Wireless-AC 9560)"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_35

        x: 611
        y: 348

        height: 18
        width: 31

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "无线"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_36

        x: 736
        y: 348

        height: 18
        width: 94

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "192.168.31.15"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: c_52_82_7D_6E_11

        x: 871
        y: 348

        height: 18
        width: 131

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "3C:52:82:7D:6E:11"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_37

        x: 1084
        y: 348

        height: 18
        width: 64

        color: "#18a058"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "● 已连接"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_38

        x: 1206
        y: 348

        height: 18
        width: 9

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "–"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_39

        x: 1301
        y: 348

        height: 18
        width: 49

        color: "#18a058"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "✓ 可用"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_22

        x: 286
        y: 391

        height: 0
        width: 1084

        ShapePath {
            id: _vector_22_ShapePath0

            fillColor: "#000000"
            strokeColor: "#edf1f7"
            strokeWidth: 1

            PathSvg {
                id: _vector_22_ShapePath0_PathSvg0

                path: "M 0 0 L 1084 0"
            }
        }
    }
    Text {
        id: element_40

        x: 316
        y: 412

        height: 18
        width: 91

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "蓝牙网络连接"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_41

        x: 611
        y: 412

        height: 18
        width: 31

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "无线"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_42

        x: 736
        y: 412

        height: 18
        width: 9

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "–"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: c_5B_90_12_34_56

        x: 871
        y: 412

        height: 18
        width: 133

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "7C:5B:90:12:34:56"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_43

        x: 1084
        y: 412

        height: 18
        width: 64

        color: "#fa8c16"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "● 未连接"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_44

        x: 1206
        y: 412

        height: 18
        width: 9

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "–"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_45

        x: 1301
        y: 412

        height: 18
        width: 55

        color: "#fa8c16"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "! 不可用"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_23

        x: 286
        y: 455

        height: 0
        width: 1084

        ShapePath {
            id: _vector_23_ShapePath0

            fillColor: "#000000"
            strokeColor: "#edf1f7"
            strokeWidth: 1

            PathSvg {
                id: _vector_23_ShapePath0_PathSvg0

                path: "M 0 0 L 1084 0"
            }
        }
    }
    Text {
        id: vMware_Network_Adapter_VMnet1

        x: 316
        y: 476

        height: 18
        width: 243

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "VMware Network Adapter VMnet1"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_46

        x: 611
        y: 476

        height: 18
        width: 31

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "有线"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_47

        x: 736
        y: 476

        height: 18
        width: 87

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "192.168.96.1"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: c0_00_01

        x: 871
        y: 476

        height: 18
        width: 133

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "00:50:56:C0:00:01"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_48

        x: 1084
        y: 476

        height: 18
        width: 64

        color: "#18a058"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "● 已连接"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_49

        x: 1206
        y: 476

        height: 18
        width: 9

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "–"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_50

        x: 1301
        y: 476

        height: 18
        width: 49

        color: "#18a058"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "✓ 可用"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_24

        x: 286
        y: 519

        height: 0
        width: 1084

        ShapePath {
            id: _vector_24_ShapePath0

            fillColor: "#000000"
            strokeColor: "#edf1f7"
            strokeWidth: 1

            PathSvg {
                id: _vector_24_ShapePath0_PathSvg0

                path: "M 0 0 L 1084 0"
            }
        }
    }
    Text {
        id: vMware_Network_Adapter_VMnet8

        x: 316
        y: 540

        height: 18
        width: 245

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "VMware Network Adapter VMnet8"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_51

        x: 611
        y: 540

        height: 18
        width: 31

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "有线"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_52

        x: 736
        y: 540

        height: 18
        width: 97

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "192.168.239.1"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: c0_00_08

        x: 871
        y: 540

        height: 18
        width: 136

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "00:50:56:C0:00:08"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_53

        x: 1084
        y: 540

        height: 18
        width: 64

        color: "#18a058"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "● 已连接"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_54

        x: 1206
        y: 540

        height: 18
        width: 9

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "–"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_55

        x: 1301
        y: 540

        height: 18
        width: 49

        color: "#18a058"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "✓ 可用"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_25

        x: 286
        y: 620

        height: 312
        width: 520

        ShapePath {
            id: _vector_25_ShapePath0

            fillColor: "#ffffff"
            strokeColor: "#d9e1ec"
            strokeWidth: 1

            PathSvg {
                id: _vector_25_ShapePath0_PathSvg0

                path: "M 8 0 L 512 0 C 516.4182782173157 0 520 3.581721782684326 520 8 L 520 304 C 520 308.4182782173157 516.4182782173157 312 512 312 L 8 312 C 3.581721782684326 312 0 308.4182782173157 0 304 L 0 8 C 0 3.581721782684326 3.581721782684326 0 8 0 Z"
            }
        }
    }
    Text {
        id: element_56

        x: 308
        y: 639

        height: 25
        width: 85

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 21
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "网卡详情"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_57

        x: 308
        y: 684

        height: 19
        width: 81

        color: "#344054"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "网络接口："
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: intel_Ethernet_1

        x: 416
        y: 684

        height: 19
        width: 179

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "以太网 1 (Intel Ethernet)"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_58

        x: 308
        y: 723

        height: 19
        width: 81

        color: "#344054"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "子网掩码："
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_59

        x: 416
        y: 723

        height: 19
        width: 110

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "255.255.255.0"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_60

        x: 308
        y: 762

        height: 19
        width: 49

        color: "#344054"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "网关："
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_61

        x: 416
        y: 762

        height: 19
        width: 79

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "192.168.1.1"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: dNS_

        x: 308
        y: 801

        height: 19
        width: 51

        color: "#344054"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "DNS："
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_62

        x: 416
        y: 801

        height: 19
        width: 195

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "192.168.1.1, 114.114.114.114"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_63

        x: 308
        y: 840

        height: 19
        width: 81

        color: "#344054"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "链路速度："
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: gbps

        x: 416
        y: 840

        height: 19
        width: 77

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "1.00 Gbps"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_64

        x: 308
        y: 879

        height: 19
        width: 49

        color: "#344054"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "描述："
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: intel_R_Ethernet_Connection_14_I219_V

        x: 416
        y: 879

        height: 19
        width: 303

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "Intel(R) Ethernet Connection (14) I219-V"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_26

        x: 697
        y: 681

        height: 78
        width: 78

        ShapePath {
            id: _vector_26_ShapePath0

            fillColor: "#e8f8ef"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_26_ShapePath0_PathSvg0

                path: "M 78 39 C 78 60.53910446166992 60.53910446166992 78 39 78 C 17.460895538330078 78 0 60.53910446166992 0 39 C 0 17.460895538330078 17.460895538330078 0 39 0 C 60.53910446166992 0 78 17.460895538330078 78 39 Z"
            }
        }
    }
    Text {
        id: element_65

        x: 723
        y: 702

        height: 38
        width: 27

        color: "#18a058"
        font.family: "Inter"
        font.pixelSize: 31
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignHCenter
        text: "▣"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_27

        x: 831
        y: 620

        height: 312
        width: 540

        ShapePath {
            id: _vector_27_ShapePath0

            fillColor: "#ffffff"
            strokeColor: "#d9e1ec"
            strokeWidth: 1

            PathSvg {
                id: _vector_27_ShapePath0_PathSvg0

                path: "M 8 0 L 532 0 C 536.4182782173157 0 540 3.581721782684326 540 8 L 540 304 C 540 308.4182782173157 536.4182782173157 312 532 312 L 8 312 C 3.581721782684326 312 0 308.4182782173157 0 304 L 0 8 C 0 3.581721782684326 3.581721782684326 0 8 0 Z"
            }
        }
    }
    Text {
        id: element_66

        x: 856
        y: 639

        height: 25
        width: 43

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 21
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "说明"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: aPI_WebView_

        x: 856
        y: 691

        height: 19
        width: 478

        color: "#344054"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "API 登录与 WebView 登录任务可绑定到指定的网卡进行网络通信。"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_67

        x: 856
        y: 736

        height: 19
        width: 545

        color: "#344054"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "绑定后，任务将仅通过该网卡发送请求，以确保网络出口的一致性和稳定性。"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_28

        x: 856
        y: 800

        height: 0
        width: 478

        ShapePath {
            id: _vector_28_ShapePath0

            fillColor: "#000000"
            strokeColor: "#dbe3ee"
            strokeWidth: 1

            PathSvg {
                id: _vector_28_ShapePath0_PathSvg0

                path: "M 0 0 L 478 0"
            }
        }
    }
    Shape {
        id: _vector_29

        x: 856
        y: 840

        height: 58
        width: 315

        ShapePath {
            id: _vector_29_ShapePath0

            fillColor: "#e8f8ef"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_29_ShapePath0_PathSvg0

                path: "M 8 0 L 307 0 C 311.4182782173157 0 315 3.581721782684326 315 8 L 315 50 C 315 54.418278217315674 311.4182782173157 58 307 58 L 8 58 C 3.581721782684326 58 0 54.418278217315674 0 50 L 0 8 C 0 3.581721782684326 3.581721782684326 0 8 0 Z"
            }
        }
    }
    Text {
        id: aPI_WebView_1

        x: 882
        y: 859

        height: 22
        width: 248

        color: "#18a058"
        font.family: "Inter"
        font.pixelSize: 18
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "✓ 可用于 API / WebView 登录"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
}