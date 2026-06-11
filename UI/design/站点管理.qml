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
    Shape {
        id: _vector_8

        y: 168

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
        y: 168

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
        id: element_6

        x: 30
        y: 180

        height: 29
        width: 22

        color: "#1677ff"
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

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 20
        font.weight: Font.Bold
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
        width: 121

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 30
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "站点管理"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_18

        x: 282
        y: 116

        height: 19
        width: 257

        color: "#69758a"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "管理所有已配置的站点及其登录信息"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_15

        x: 1048
        y: 104

        height: 58
        width: 162

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

                path: "M 7 0 L 155 0 C 158.86599326133728 0 162 3.1340067386627197 162 7 L 162 51 C 162 54.86599326133728 158.86599326133728 58 155 58 L 7 58 C 3.1340067386627197 58 0 54.86599326133728 0 51 L 0 7 C 0 3.1340067386627197 3.1340067386627197 0 7 0 Z"
            }
        }
    }
    Text {
        id: element_19

        x: 1070
        y: 122

        height: 22
        width: 14

        color: "#ffffff"
        font.family: "Inter"
        font.pixelSize: 18
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "+"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_20

        x: 1096
        y: 124

        height: 19
        width: 65

        color: "#ffffff"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "新增站点"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_16

        x: 1234
        y: 104

        height: 58
        width: 136

        ShapePath {
            id: _vector_16_ShapePath0

            fillColor: "#ffffff"
            strokeColor: "#9bc0ff"
            strokeWidth: 1

            PathSvg {
                id: _vector_16_ShapePath0_PathSvg0

                path: "M 7 0 L 129 0 C 132.86599326133728 0 136 3.1340067386627197 136 7 L 136 51 C 136 54.86599326133728 132.86599326133728 58 129 58 L 7 58 C 3.1340067386627197 58 0 54.86599326133728 0 51 L 0 7 C 0 3.1340067386627197 3.1340067386627197 0 7 0 Z"
            }
        }
    }
    Text {
        id: element_21

        x: 1256
        y: 122

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

        x: 1282
        y: 124

        height: 19
        width: 33

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "刷新"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_17

        x: 285
        y: 215

        height: 365
        width: 1085

        ShapePath {
            id: _vector_17_ShapePath0

            fillColor: "#ffffff"
            strokeColor: "#d9e1ec"
            strokeWidth: 1

            PathSvg {
                id: _vector_17_ShapePath0_PathSvg0

                path: "M 8 0 L 1077 0 C 1081.4182782173157 0 1085 3.581721782684326 1085 8 L 1085 357 C 1085 361.4182782173157 1081.4182782173157 365 1077 365 L 8 365 C 3.581721782684326 365 0 361.4182782173157 0 357 L 0 8 C 0 3.581721782684326 3.581721782684326 0 8 0 Z"
            }
        }
    }
    Shape {
        id: _vector_18

        x: 297
        y: 237

        height: 54
        width: 1061

        ShapePath {
            id: _vector_18_ShapePath0

            fillColor: "#f8fafc"
            strokeColor: "#d9e1ec"
            strokeWidth: 1

            PathSvg {
                id: _vector_18_ShapePath0_PathSvg0

                path: "M 6 0 L 1055 0 C 1058.3137085437775 0 1061 2.686291456222534 1061 6 L 1061 48 C 1061 51.313708543777466 1058.3137085437775 54 1055 54 L 6 54 C 2.686291456222534 54 0 51.313708543777466 0 48 L 0 6 C 0 2.686291456222534 2.686291456222534 0 6 0 Z"
            }
        }
    }
    Text {
        id: element_23

        x: 319
        y: 255

        height: 19
        width: 65

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "站点名称"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_24

        x: 455
        y: 255

        height: 19
        width: 65

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "登录地址"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_25

        x: 690
        y: 255

        height: 19
        width: 65

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "登录方式"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_26

        x: 840
        y: 255

        height: 19
        width: 65

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "绑定网卡"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_27

        x: 975
        y: 255

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

        x: 1095
        y: 255

        height: 19
        width: 97

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "上次登录时间"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_29

        x: 1290
        y: 255

        height: 19
        width: 33

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "操作"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_19

        x: 297
        y: 292

        height: 68
        width: 1061

        ShapePath {
            id: _vector_19_ShapePath0

            fillColor: "#f3f8ff"
            strokeColor: "#9bc0ff"
            strokeWidth: 1

            PathSvg {
                id: _vector_19_ShapePath0_PathSvg0

                path: "M 4 0 L 1057 0 C 1059.2091391086578 0 1061 1.790860891342163 1061 4 L 1061 64 C 1061 66.20913910865784 1059.2091391086578 68 1057 68 L 4 68 C 1.790860891342163 68 0 66.20913910865784 0 64 L 0 4 C 0 1.790860891342163 1.790860891342163 0 4 0 Z"
            }
        }
    }
    Text {
        id: element_30

        x: 319
        y: 317

        height: 19
        width: 65

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "内部系统"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: http_192_168_1_20

        x: 455
        y: 317

        height: 19
        width: 139

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "http://192.168.1.20"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: aPI_

        x: 690
        y: 317

        height: 19
        width: 63

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "API 登录"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_31

        x: 840
        y: 317

        height: 19
        width: 61

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "以太网 1"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_32

        x: 975
        y: 317

        height: 19
        width: 69

        color: "#18a058"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "● 已启用"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_33

        x: 1095
        y: 317

        height: 19
        width: 162

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "2025-05-24 10:15:32"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_34

        x: 1295
        y: 313

        height: 24
        width: 22

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 20
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "✎"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_35

        x: 1340
        y: 316

        height: 17
        width: 18

        color: "#ff4d4f"
        font.family: "Inter"
        font.pixelSize: 17
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "🗑"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_20

        x: 297
        y: 362

        height: 0
        width: 1061

        ShapePath {
            id: _vector_20_ShapePath0

            fillColor: "#000000"
            strokeColor: "#edf1f7"
            strokeWidth: 1

            PathSvg {
                id: _vector_20_ShapePath0_PathSvg0

                path: "M 0 0 L 1061 0"
            }
        }
    }
    Text {
        id: element_36

        x: 319
        y: 387

        height: 19
        width: 65

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "测试平台"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: https_test_example_com

        x: 455
        y: 387

        height: 19
        width: 190

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "https://test.example.com"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: webView_

        x: 690
        y: 387

        height: 19
        width: 108

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "WebView 登录"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: wi_Fi

        x: 840
        y: 387

        height: 19
        width: 41

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "Wi-Fi"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_37

        x: 975
        y: 387

        height: 19
        width: 69

        color: "#18a058"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "● 已登录"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_38

        x: 1095
        y: 387

        height: 19
        width: 165

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "2025-05-24 09:05:18"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_39

        x: 1295
        y: 383

        height: 24
        width: 22

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 20
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "✎"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_40

        x: 1340
        y: 386

        height: 17
        width: 18

        color: "#ff4d4f"
        font.family: "Inter"
        font.pixelSize: 17
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "🗑"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_21

        x: 297
        y: 432

        height: 0
        width: 1061

        ShapePath {
            id: _vector_21_ShapePath0

            fillColor: "#000000"
            strokeColor: "#edf1f7"
            strokeWidth: 1

            PathSvg {
                id: _vector_21_ShapePath0_PathSvg0

                path: "M 0 0 L 1061 0"
            }
        }
    }
    Text {
        id: element_41

        x: 319
        y: 457

        height: 19
        width: 65

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "研发环境"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: http_10_0_0_15

        x: 455
        y: 457

        height: 19
        width: 113

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "http://10.0.0.15"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: aPI_1

        x: 690
        y: 457

        height: 19
        width: 63

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "API 登录"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_42

        x: 840
        y: 457

        height: 19
        width: 64

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "以太网 2"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_43

        x: 975
        y: 457

        height: 19
        width: 69

        color: "#fa8c16"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "● 未登录"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_44

        x: 1095
        y: 457

        height: 19
        width: 164

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "2025-05-23 18:40:07"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_45

        x: 1295
        y: 453

        height: 24
        width: 22

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 20
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "✎"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_46

        x: 1340
        y: 456

        height: 17
        width: 18

        color: "#ff4d4f"
        font.family: "Inter"
        font.pixelSize: 17
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "🗑"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_22

        x: 297
        y: 502

        height: 0
        width: 1061

        ShapePath {
            id: _vector_22_ShapePath0

            fillColor: "#000000"
            strokeColor: "#edf1f7"
            strokeWidth: 1

            PathSvg {
                id: _vector_22_ShapePath0_PathSvg0

                path: "M 0 0 L 1061 0"
            }
        }
    }
    Text {
        id: element_47

        x: 319
        y: 527

        height: 19
        width: 65

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "外部系统"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: https_portal_example_com

        x: 455
        y: 527

        height: 19
        width: 206

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "https://portal.example.com"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: webView_1

        x: 690
        y: 527

        height: 19
        width: 108

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "WebView 登录"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: wi_Fi_1

        x: 840
        y: 527

        height: 19
        width: 41

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "Wi-Fi"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_48

        x: 975
        y: 527

        height: 19
        width: 69

        color: "#8c95a6"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "● 已禁用"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_49

        x: 1095
        y: 527

        height: 19
        width: 159

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "2025-05-22 16:20:11"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_50

        x: 1295
        y: 523

        height: 24
        width: 22

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 20
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "✎"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_51

        x: 1340
        y: 526

        height: 17
        width: 18

        color: "#ff4d4f"
        font.family: "Inter"
        font.pixelSize: 17
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "🗑"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_23

        x: 285
        y: 602

        height: 325
        width: 1085

        ShapePath {
            id: _vector_23_ShapePath0

            fillColor: "#ffffff"
            strokeColor: "#d9e1ec"
            strokeWidth: 1

            PathSvg {
                id: _vector_23_ShapePath0_PathSvg0

                path: "M 8 0 L 1077 0 C 1081.4182782173157 0 1085 3.581721782684326 1085 8 L 1085 317 C 1085 321.4182782173157 1081.4182782173157 325 1077 325 L 8 325 C 3.581721782684326 325 0 321.4182782173157 0 317 L 0 8 C 0 3.581721782684326 3.581721782684326 0 8 0 Z"
            }
        }
    }
    Text {
        id: element_52

        x: 309
        y: 628

        height: 27
        width: 221

        color: "#1677ff"
        font.family: "Inter"
        font.pixelSize: 22
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "站点详情（内部系统）"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_53

        x: 315
        y: 683

        height: 21
        width: 22

        color: "#4b5563"
        font.family: "Inter"
        font.pixelSize: 21
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "🔗"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_54

        x: 353
        y: 687

        height: 21
        width: 69

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 17
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "登录地址"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: http_192_168_1_21

        x: 505
        y: 688

        height: 19
        width: 139

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "http://192.168.1.20"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_55

        x: 315
        y: 739

        height: 21
        width: 22

        color: "#4b5563"
        font.family: "Inter"
        font.pixelSize: 21
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "🔑"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_56

        x: 353
        y: 743

        height: 21
        width: 69

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 17
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "登录方式"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: aPI__2

        x: 505
        y: 744

        height: 19
        width: 63

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "API 登录"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_57

        x: 315
        y: 795

        height: 25
        width: 19

        color: "#4b5563"
        font.family: "Inter"
        font.pixelSize: 21
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "▣"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_58

        x: 353
        y: 799

        height: 21
        width: 69

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 17
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "绑定网卡"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: intel_Ethernet_192_168_1_21

        x: 505
        y: 800

        height: 19
        width: 283

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "以太网 1 / Intel Ethernet / 192.168.1.20"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_59

        x: 315
        y: 851

        height: 25
        width: 14

        color: "#4b5563"
        font.family: "Inter"
        font.pixelSize: 21
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "◌"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: cookie_

        x: 353
        y: 855

        height: 21
        width: 98

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 17
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "Cookie 状态"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_60

        x: 505
        y: 856

        height: 19
        width: 52

        color: "#18a058"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "✓ 有效"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Shape {
        id: _vector_24

        x: 805
        y: 680

        height: 220
        width: 0

        ShapePath {
            id: _vector_24_ShapePath0

            fillColor: "#000000"
            strokeColor: "#e4eaf2"
            strokeWidth: 1

            PathSvg {
                id: _vector_24_ShapePath0_PathSvg0

                path: "M 0 0 L 0 220"
            }
        }
    }
    Text {
        id: element_61

        x: 840
        y: 683

        height: 21
        width: 22

        color: "#4b5563"
        font.family: "Inter"
        font.pixelSize: 21
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "🛡"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: token_

        x: 878
        y: 687

        height: 21
        width: 90

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 17
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "Token 状态"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_62

        x: 1040
        y: 688

        height: 19
        width: 52

        color: "#18a058"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "✓ 有效"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_63

        x: 840
        y: 739

        height: 25
        width: 20

        color: "#4b5563"
        font.family: "Inter"
        font.pixelSize: 21
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "⏻"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_64

        x: 878
        y: 743

        height: 21
        width: 69

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 17
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "自动登录"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_65

        x: 1040
        y: 744

        height: 19
        width: 68

        color: "#18a058"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "✓ 已启用"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_66

        x: 840
        y: 795

        height: 25
        width: 17

        color: "#4b5563"
        font.family: "Inter"
        font.pixelSize: 21
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "◷"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_67

        x: 878
        y: 799

        height: 21
        width: 103

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 17
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "上次登录时间"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_68

        x: 1040
        y: 800

        height: 19
        width: 162

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "2025-05-24 10:15:32"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_69

        x: 840
        y: 851

        height: 25
        width: 19

        color: "#4b5563"
        font.family: "Inter"
        font.pixelSize: 21
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "▤"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: element_70

        x: 878
        y: 855

        height: 21
        width: 35

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 17
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignLeft
        text: "备注"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: oA_

        x: 1040
        y: 856

        height: 19
        width: 257

        color: "#172033"
        font.family: "Inter"
        font.pixelSize: 16
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        text: "公司内部 OA 系统，需保持自动登录"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
}