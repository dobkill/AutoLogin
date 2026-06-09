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
    Shape {
        id: _vector_8

        y: 92

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
        y: 92

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
        id: element_4

        x: 30
        y: 104

        height: 29
        width: 19

        color: "#1677ff"
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

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 20
        font.weight: Font.Bold
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
        width: 91

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 30
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "仪表盘"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_15

        x: 282
        y: 150

        height: 70
        width: 1090

        ShapePath {
            id: _vector_15_ShapePath0

            strokeColor: "#9bc0ff"
            strokeWidth: 1

            fillGradient: LinearGradient {
                id: _vector_15_ShapePath0_LinearGradient_1
            
                x1: _vector_15.width * 0
                x2: _vector_15.width * 1
                y1: _vector_15.height * 0
                y2: _vector_15.height * 1
            
                GradientStop {
                    id: _vector_15_ShapePath0_LinearGradient_1_GradientS
            
                    color: "#ffeef6ff"
                    position: 0
                }
                GradientStop {
                    id: _vector_15_ShapePath0_LinearGradient_1_GradientS_1
            
                    color: "#ffffffff"
                    position: 1
                }
            }

            PathSvg {
                id: _vector_15_ShapePath0_PathSvg0

                path: "M 8 0 L 1082 0 C 1086.4182782173157 0 1090 3.581721782684326 1090 8 L 1090 62 C 1090 66.41827821731567 1086.4182782173157 70 1082 70 L 8 70 C 3.581721782684326 70 0 66.41827821731567 0 62 L 0 8 C 0 3.581721782684326 3.581721782684326 0 8 0 Z"
            }
        }
    }
    Text {
        id: element_18

        x: 310
        y: 175

        height: 22
        width: 546

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 18
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "ⓘ 提示：登录任务支持绑定网络接口，确保使用指定网卡进行登录。"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_19

        x: 1342
        y: 170

        height: 29
        width: 17

        color: "#69758a"
        font.family: "Inter"
        font.pixelSize: 24
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "×"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_16

        x: 282
        y: 246

        height: 126
        width: 350

        ShapePath {
            id: _vector_16_ShapePath0

            fillColor: "#ffffff"
            strokeColor: "#d9e1ec"
            strokeWidth: 1

            PathSvg {
                id: _vector_16_ShapePath0_PathSvg0

                path: "M 8 0 L 342 0 C 346.4182782173157 0 350 3.581721782684326 350 8 L 350 118 C 350 122.41827821731567 346.4182782173157 126 342 126 L 8 126 C 3.581721782684326 126 0 122.41827821731567 0 118 L 0 8 C 0 3.581721782684326 3.581721782684326 0 8 0 Z"
            }
        }
    }
    Text {
        id: element_20

        x: 306
        y: 271

        height: 21
        width: 69

        color: "#69758a"
        font.family: "Inter"
        font.pixelSize: 17
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "登录状态"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_21

        x: 306
        y: 304

        height: 36
        width: 91

        color: "#18a058"
        font.family: "Inter"
        font.pixelSize: 30
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "已登录"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_17

        x: 540
        y: 275

        height: 68
        width: 68

        ShapePath {
            id: _vector_17_ShapePath0

            fillColor: "#e8f8ef"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_17_ShapePath0_PathSvg0

                path: "M 68 34 C 68 52.77768135070801 52.77768135070801 68 34 68 C 15.222318649291992 68 0 52.77768135070801 0 34 C 0 15.222318649291992 15.222318649291992 0 34 0 C 52.77768135070801 0 68 15.222318649291992 68 34 Z"
            }
        }
    }
    Text {
        id: element_22

        x: 564
        y: 297

        height: 27
        width: 21

        color: "#18a058"
        font.family: "Inter"
        font.pixelSize: 22
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignHCenter
        text: "✓"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_18

        x: 652
        y: 246

        height: 126
        width: 330

        ShapePath {
            id: _vector_18_ShapePath0

            fillColor: "#ffffff"
            strokeColor: "#d9e1ec"
            strokeWidth: 1

            PathSvg {
                id: _vector_18_ShapePath0_PathSvg0

                path: "M 8 0 L 322 0 C 326.4182782173157 0 330 3.581721782684326 330 8 L 330 118 C 330 122.41827821731567 326.4182782173157 126 322 126 L 8 126 C 3.581721782684326 126 0 122.41827821731567 0 118 L 0 8 C 0 3.581721782684326 3.581721782684326 0 8 0 Z"
            }
        }
    }
    Text {
        id: element_23

        x: 676
        y: 271

        height: 21
        width: 69

        color: "#69758a"
        font.family: "Inter"
        font.pixelSize: 17
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "当前站点"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_24

        x: 676
        y: 304

        height: 36
        width: 121

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 30
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "内部系统"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_19

        x: 890
        y: 275

        height: 68
        width: 68

        ShapePath {
            id: _vector_19_ShapePath0

            fillColor: "#eaf3ff"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_19_ShapePath0_PathSvg0

                path: "M 68 34 C 68 52.77768135070801 52.77768135070801 68 34 68 C 15.222318649291992 68 0 52.77768135070801 0 34 C 0 15.222318649291992 15.222318649291992 0 34 0 C 52.77768135070801 0 68 15.222318649291992 68 34 Z"
            }
        }
    }
    Text {
        id: element_25

        x: 914.50
        y: 297

        height: 27
        width: 20

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 22
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignHCenter
        text: "▦"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_20

        x: 1002
        y: 246

        height: 126
        width: 374

        ShapePath {
            id: _vector_20_ShapePath0

            fillColor: "#ffffff"
            strokeColor: "#d9e1ec"
            strokeWidth: 1

            PathSvg {
                id: _vector_20_ShapePath0_PathSvg0

                path: "M 8 0 L 366 0 C 370.4182782173157 0 374 3.581721782684326 374 8 L 374 118 C 374 122.41827821731567 370.4182782173157 126 366 126 L 8 126 C 3.581721782684326 126 0 122.41827821731567 0 118 L 0 8 C 0 3.581721782684326 3.581721782684326 0 8 0 Z"
            }
        }
    }
    Text {
        id: element_26

        x: 1026
        y: 271

        height: 21
        width: 69

        color: "#69758a"
        font.family: "Inter"
        font.pixelSize: 17
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "登录方式"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: aPI_

        x: 1026
        y: 304

        height: 36
        width: 119

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 30
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "API 登录"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_21

        x: 1284
        y: 275

        height: 68
        width: 68

        ShapePath {
            id: _vector_21_ShapePath0

            fillColor: "#eaf3ff"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_21_ShapePath0_PathSvg0

                path: "M 68 34 C 68 52.77768135070801 52.77768135070801 68 34 68 C 15.222318649291992 68 0 52.77768135070801 0 34 C 0 15.222318649291992 15.222318649291992 0 34 0 C 52.77768135070801 0 68 15.222318649291992 68 34 Z"
            }
        }
    }
    Text {
        id: aPI

        x: 1299.50
        y: 297

        height: 27
        width: 38

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 22
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignHCenter
        text: "API"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_22

        x: 282
        y: 394

        height: 126
        width: 690

        ShapePath {
            id: _vector_22_ShapePath0

            fillColor: "#ffffff"
            strokeColor: "#d9e1ec"
            strokeWidth: 1

            PathSvg {
                id: _vector_22_ShapePath0_PathSvg0

                path: "M 8 0 L 682 0 C 686.4182782173157 0 690 3.581721782684326 690 8 L 690 118 C 690 122.41827821731567 686.4182782173157 126 682 126 L 8 126 C 3.581721782684326 126 0 122.41827821731567 0 118 L 0 8 C 0 3.581721782684326 3.581721782684326 0 8 0 Z"
            }
        }
    }
    Text {
        id: element_27

        x: 306
        y: 419

        height: 21
        width: 69

        color: "#69758a"
        font.family: "Inter"
        font.pixelSize: 17
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "当前网卡"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: intel_Ethernet_192_168_1_21

        x: 306
        y: 462

        height: 27
        width: 400

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 22
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "以太网 1 / Intel Ethernet / 192.168.1.20"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_23

        x: 884
        y: 423

        height: 68
        width: 68

        ShapePath {
            id: _vector_23_ShapePath0

            fillColor: "#eaf3ff"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_23_ShapePath0_PathSvg0

                path: "M 68 34 C 68 52.77768135070801 52.77768135070801 68 34 68 C 15.222318649291992 68 0 52.77768135070801 0 34 C 0 15.222318649291992 15.222318649291992 0 34 0 C 52.77768135070801 0 68 15.222318649291992 68 34 Z"
            }
        }
    }
    Text {
        id: element_28

        x: 907
        y: 441

        height: 31
        width: 23

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 26
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignHCenter
        text: "▣"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_24

        x: 992
        y: 394

        height: 126
        width: 380

        ShapePath {
            id: _vector_24_ShapePath0

            fillColor: "#ffffff"
            strokeColor: "#d9e1ec"
            strokeWidth: 1

            PathSvg {
                id: _vector_24_ShapePath0_PathSvg0

                path: "M 8 0 L 372 0 C 376.4182782173157 0 380 3.581721782684326 380 8 L 380 118 C 380 122.41827821731567 376.4182782173157 126 372 126 L 8 126 C 3.581721782684326 126 0 122.41827821731567 0 118 L 0 8 C 0 3.581721782684326 3.581721782684326 0 8 0 Z"
            }
        }
    }
    Text {
        id: element_29

        x: 1016
        y: 419

        height: 21
        width: 86

        color: "#69758a"
        font.family: "Inter"
        font.pixelSize: 17
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "自启动状态"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_30

        x: 1016
        y: 454

        height: 36
        width: 91

        color: "#18a058"
        font.family: "Inter"
        font.pixelSize: 30
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "已启用"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_25

        x: 1282
        y: 423

        height: 68
        width: 68

        ShapePath {
            id: _vector_25_ShapePath0

            fillColor: "#e8f8ef"
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: _vector_25_ShapePath0_PathSvg0

                path: "M 68 34 C 68 52.77768135070801 52.77768135070801 68 34 68 C 15.222318649291992 68 0 52.77768135070801 0 34 C 0 15.222318649291992 15.222318649291992 0 34 0 C 52.77768135070801 0 68 15.222318649291992 68 34 Z"
            }
        }
    }
    Text {
        id: element_31

        x: 1304.50
        y: 442

        height: 30
        width: 24

        color: "#18a058"
        font.family: "Inter"
        font.pixelSize: 25
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignHCenter
        text: "⏻"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_26

        x: 282
        y: 542

        height: 380
        width: 695

        ShapePath {
            id: _vector_26_ShapePath0

            fillColor: "#ffffff"
            strokeColor: "#d9e1ec"
            strokeWidth: 1

            PathSvg {
                id: _vector_26_ShapePath0_PathSvg0

                path: "M 8 0 L 687 0 C 691.4182782173157 0 695 3.581721782684326 695 8 L 695 372 C 695 376.4182782173157 691.4182782173157 380 687 380 L 8 380 C 3.581721782684326 380 0 376.4182782173157 0 372 L 0 8 C 0 3.581721782684326 3.581721782684326 0 8 0 Z"
            }
        }
    }
    Text {
        id: element_32

        x: 306
        y: 566

        height: 24
        width: 121

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 20
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "最近登录记录"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_33

        x: 877
        y: 570

        height: 19
        width: 65

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "查看全部 "
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_27

        x: 282
        y: 614

        height: 0
        width: 695

        ShapePath {
            id: _vector_27_ShapePath0

            fillColor: "#000000"
            strokeColor: "#d9e1ec"
            strokeWidth: 1

            PathSvg {
                id: _vector_27_ShapePath0_PathSvg0

                path: "M 0 0 L 695 0"
            }
        }
    }
    Text {
        id: element_34

        x: 312
        y: 635

        height: 18
        width: 31

        color: "#344054"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "时间"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_35

        x: 522
        y: 635

        height: 18
        width: 61

        color: "#344054"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "站点名称"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_36

        x: 652
        y: 635

        height: 18
        width: 61

        color: "#344054"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "登录方式"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_37

        x: 782
        y: 635

        height: 18
        width: 31

        color: "#344054"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "结果"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_38

        x: 892
        y: 635

        height: 18
        width: 31

        color: "#344054"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "耗时"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_28

        x: 282
        y: 658

        height: 0
        width: 695

        ShapePath {
            id: _vector_28_ShapePath0

            fillColor: "#000000"
            strokeColor: "#edf1f7"
            strokeWidth: 1

            PathSvg {
                id: _vector_28_ShapePath0_PathSvg0

                path: "M 0 0 L 695 0"
            }
        }
    }
    Text {
        id: element_39

        x: 312
        y: 678

        height: 18
        width: 152

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "2025-05-24 10:15:32"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_40

        x: 522
        y: 678

        height: 18
        width: 61

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "内部系统"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: aPI_1

        x: 652
        y: 678

        height: 18
        width: 59

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "API 登录"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_41

        x: 782
        y: 678

        height: 18
        width: 49

        color: "#18a058"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "● 成功"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_42

        x: 892
        y: 678

        height: 18
        width: 50

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "1.23 秒"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_29

        x: 282
        y: 715

        height: 0
        width: 695

        ShapePath {
            id: _vector_29_ShapePath0

            fillColor: "#000000"
            strokeColor: "#edf1f7"
            strokeWidth: 1

            PathSvg {
                id: _vector_29_ShapePath0_PathSvg0

                path: "M 0 0 L 695 0"
            }
        }
    }
    Text {
        id: element_43

        x: 312
        y: 735

        height: 18
        width: 154

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "2025-05-24 09:05:18"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_44

        x: 522
        y: 735

        height: 18
        width: 61

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "内部系统"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: aPI__2

        x: 652
        y: 735

        height: 18
        width: 59

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "API 登录"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_45

        x: 782
        y: 735

        height: 18
        width: 49

        color: "#18a058"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "● 成功"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_46

        x: 892
        y: 735

        height: 18
        width: 46

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "1.18 秒"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_30

        x: 282
        y: 772

        height: 0
        width: 695

        ShapePath {
            id: _vector_30_ShapePath0

            fillColor: "#000000"
            strokeColor: "#edf1f7"
            strokeWidth: 1

            PathSvg {
                id: _vector_30_ShapePath0_PathSvg0

                path: "M 0 0 L 695 0"
            }
        }
    }
    Text {
        id: element_47

        x: 312
        y: 792

        height: 18
        width: 154

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "2025-05-23 18:40:07"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_48

        x: 522
        y: 792

        height: 18
        width: 61

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "内部系统"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_49

        x: 652
        y: 792

        height: 18
        width: 61

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "密码登录"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_50

        x: 782
        y: 792

        height: 18
        width: 49

        color: "#18a058"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "● 成功"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_51

        x: 892
        y: 792

        height: 18
        width: 53

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "2.45 秒"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_31

        x: 282
        y: 829

        height: 0
        width: 695

        ShapePath {
            id: _vector_31_ShapePath0

            fillColor: "#000000"
            strokeColor: "#edf1f7"
            strokeWidth: 1

            PathSvg {
                id: _vector_31_ShapePath0_PathSvg0

                path: "M 0 0 L 695 0"
            }
        }
    }
    Text {
        id: element_52

        x: 312
        y: 849

        height: 18
        width: 154

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "2025-05-23 08:32:51"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_53

        x: 522
        y: 849

        height: 18
        width: 61

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "内部系统"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: aPI__3

        x: 652
        y: 849

        height: 18
        width: 59

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "API 登录"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_54

        x: 782
        y: 849

        height: 18
        width: 49

        color: "#18a058"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "● 成功"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_55

        x: 892
        y: 849

        height: 18
        width: 50

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "1.30 秒"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_32

        x: 997
        y: 542

        height: 380
        width: 375

        ShapePath {
            id: _vector_32_ShapePath0

            fillColor: "#ffffff"
            strokeColor: "#d9e1ec"
            strokeWidth: 1

            PathSvg {
                id: _vector_32_ShapePath0_PathSvg0

                path: "M 8 0 L 367 0 C 371.4182782173157 0 375 3.581721782684326 375 8 L 375 372 C 375 376.4182782173157 371.4182782173157 380 367 380 L 8 380 C 3.581721782684326 380 0 376.4182782173157 0 372 L 0 8 C 0 3.581721782684326 3.581721782684326 0 8 0 Z"
            }
        }
    }
    Text {
        id: element_56

        x: 1021
        y: 566

        height: 24
        width: 81

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 20
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "快捷操作"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_33

        x: 1021
        y: 618

        height: 58
        width: 327

        ShapePath {
            id: _vector_33_ShapePath0

            strokeColor: "#0f5eea"
            strokeWidth: 1

            fillGradient: LinearGradient {
                id: _vector_33_ShapePath0_LinearGradient_1
            
                x1: _vector_33.width * 0
                x2: _vector_33.width * 1
                y1: _vector_33.height * 0
                y2: _vector_33.height * 1
            
                GradientStop {
                    id: _vector_33_ShapePath0_LinearGradient_1_GradientS
            
                    color: "#ff1d7cff"
                    position: 0
                }
                GradientStop {
                    id: _vector_33_ShapePath0_LinearGradient_1_GradientS_1
            
                    color: "#ff0f5eea"
                    position: 1
                }
            }

            PathSvg {
                id: _vector_33_ShapePath0_PathSvg0

                path: "M 7 0 L 320 0 C 323.8659932613373 0 327 3.1340067386627197 327 7 L 327 51 C 327 54.86599326133728 323.8659932613373 58 320 58 L 7 58 C 3.1340067386627197 58 0 54.86599326133728 0 51 L 0 7 C 0 3.1340067386627197 3.1340067386627197 0 7 0 Z"
            }
        }
    }
    Text {
        id: element_57

        x: 1043
        y: 636

        height: 22
        width: 19

        color: "#ffffff"
        font.family: "Inter"
        font.pixelSize: 18
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "▶"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_58

        x: 1069
        y: 638

        height: 19
        width: 65

        color: "#ffffff"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "立即登录"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_34

        x: 1021
        y: 692

        height: 58
        width: 327

        ShapePath {
            id: _vector_34_ShapePath0

            fillColor: "#ffffff"
            strokeColor: "#9bc0ff"
            strokeWidth: 1

            PathSvg {
                id: _vector_34_ShapePath0_PathSvg0

                path: "M 7 0 L 320 0 C 323.8659932613373 0 327 3.1340067386627197 327 7 L 327 51 C 327 54.86599326133728 323.8659932613373 58 320 58 L 7 58 C 3.1340067386627197 58 0 54.86599326133728 0 51 L 0 7 C 0 3.1340067386627197 3.1340067386627197 0 7 0 Z"
            }
        }
    }
    Text {
        id: element_59

        x: 1043
        y: 710

        height: 22
        width: 17

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 18
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "▤"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_60

        x: 1069
        y: 712

        height: 19
        width: 65

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "打开配置"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_35

        x: 1021
        y: 766

        height: 58
        width: 327

        ShapePath {
            id: _vector_35_ShapePath0

            fillColor: "#ffffff"
            strokeColor: "#9bc0ff"
            strokeWidth: 1

            PathSvg {
                id: _vector_35_ShapePath0_PathSvg0

                path: "M 7 0 L 320 0 C 323.8659932613373 0 327 3.1340067386627197 327 7 L 327 51 C 327 54.86599326133728 323.8659932613373 58 320 58 L 7 58 C 3.1340067386627197 58 0 54.86599326133728 0 51 L 0 7 C 0 3.1340067386627197 3.1340067386627197 0 7 0 Z"
            }
        }
    }
    Text {
        id: element_61

        x: 1043
        y: 784

        height: 22
        width: 17

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 18
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "▣"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_62

        x: 1069
        y: 786

        height: 19
        width: 65

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "扫描网卡"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_36

        x: 1021
        y: 840

        height: 58
        width: 327

        ShapePath {
            id: _vector_36_ShapePath0

            fillColor: "#ffffff"
            strokeColor: "#9bc0ff"
            strokeWidth: 1

            PathSvg {
                id: _vector_36_ShapePath0_PathSvg0

                path: "M 7 0 L 320 0 C 323.8659932613373 0 327 3.1340067386627197 327 7 L 327 51 C 327 54.86599326133728 323.8659932613373 58 320 58 L 7 58 C 3.1340067386627197 58 0 54.86599326133728 0 51 L 0 7 C 0 3.1340067386627197 3.1340067386627197 0 7 0 Z"
            }
        }
    }
    Text {
        id: element_63

        x: 1043
        y: 858

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
        id: element_64

        x: 1069
        y: 860

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
}