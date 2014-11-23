import QtQuick 2.3
import "qrc:/qml/"

Item {
    width: 300
    id: root

   Rectangle {
        id: menu; width: 219; height: 70 * 6; radius: 5; anchors.centerIn: parent;
        color: "#000000"
        Column { id: columnbg; anchors.fill: parent
            Rectangle { height: 70; width: 219; color: "#000000"; radius: 5}
            Rectangle { height: 70; width: 219; color: "#000f13"}
            Rectangle { height: 70; width: 219; color: "#000000"}
            Rectangle { height: 70; width: 219; color: "#000f13"}
            Rectangle { height: 70; width: 219; color: "#000000"}
            Rectangle { height: 70; width: 219; color: "#000f13"; radius: 5}
        }

        Column { id: columnlines; anchors.centerIn: parent; spacing: -149
            Rectangle { rotation: 90; height: 219 ; width: 1; gradient: linegradient }
            Rectangle { rotation: 90; height: 219 ; width: 1; gradient: linegradient }
            Rectangle { rotation: 90; height: 219 ; width: 1; gradient: linegradient }
            Rectangle { rotation: 90; height: 219 ; width: 1; gradient: linegradient }
            Rectangle { rotation: 90; height: 219 ; width: 1; gradient: linegradient }

        }

        Column { id: column; anchors.centerIn: parent
            MenuButton { id: overview; source: "qrc:/ico/overview"; onHoverChanged: _rootwin.gotoOverviewPage() }
            MenuButton { id: send ; source: "qrc:/ico/send"; onHoverChanged: _rootwin.gotoSendCoinsPage() }
            MenuButton { id: receive; source: "qrc:/ico/receive"; onHoverChanged: _rootwin.gotoReceiveCoinsPage() }
            MenuButton { id: transactions; source: "qrc:/ico/transactions"; onHoverChanged: _rootwin.gotoHistoryPage() }
            MenuButton { id: address; source: "qrc:/ico/address"; onHoverChanged: _rootwin.gotoAddressBookPage() }
            MenuButton { id: block; source: "qrc:/ico/block"; onHoverChanged: _rootwin.gotoBlockBrowser() }
        }

        Gradient {
            id: linegradient
            GradientStop { position: 0.00; color: "#000000" }
            GradientStop { position: 0.33; color: "#c4c4c4" }
            GradientStop { position: 1.00; color: "#000000" }
        }

        Item {
            id: glowItem
            anchors.fill: menu
            z: menu.z - 1

            property real glowRadius: 10
            property real spread: 0.0
            property color color: "red"
            property real cornerRadius: 20
            property bool cached: true

            ShaderEffectSource {
                id: cacheItem
                anchors.fill: shaderItem
                visible: glowItem.cached
                smooth: true
                sourceItem: shaderItem
                live: true
                hideSource: visible
            }

            ShaderEffect {
                id: shaderItem

                x: (parent.width - width) / 2.0
                y: (parent.height - height) / 2.0
                width: parent.width + glowItem.glowRadius * 2 + cornerRadius * 2
                height: parent.height + glowItem.glowRadius * 2 + cornerRadius * 2

                function clampedCornerRadius(someValue ) {
                    var maxCornerRadius = Math.min(glowItem.width, glowItem.height) / 2 + someValue;
                    return Math.max(0, Math.min(glowItem.cornerRadius, maxCornerRadius))
                }

                property color color: glowItem.color
                property real inverseSpread: 1.0 - glowItem.spread
                property real relativeSizeX: ((inverseSpread * inverseSpread) * glowItem.glowRadius + cornerRadius * 2.0) / width
                property real relativeSizeY: relativeSizeX * (width / height)
                property real spread: glowItem.spread / 2.0
                property real cornerRadius: clampedCornerRadius(glowItem.glowRadius)

                fragmentShader: "
                uniform highp float qt_Opacity;
                uniform mediump float relativeSizeX;
                uniform mediump float relativeSizeY;
                uniform mediump float spread;
                uniform lowp vec4 color;
                varying highp vec2 qt_TexCoord0;

                highp float linearstep(highp float e0, highp float e1, highp float x) {
                    return clamp((x - e0) / (e1 - e0), 0.0, 1.0);
                }

                void main() {
                    lowp float alpha =
                        smoothstep(0.0, relativeSizeX, 0.5 - abs(0.5 - qt_TexCoord0.x)) *
                        smoothstep(0.0, relativeSizeY, 0.5 - abs(0.5 - qt_TexCoord0.y));

                    highp float spreadMultiplier = linearstep(spread, 1.0 - spread, alpha);
                    gl_FragColor = color * qt_Opacity * spreadMultiplier * spreadMultiplier;
                }
            "
            }
            SequentialAnimation on glowRadius {
                loops: Animation.Infinite
                PropertyAnimation { to: 20; duration: 3000; easing.type: Easing.OutInElastic}
                PropertyAnimation { to: 10; duration: 3000 }
            }
        }
    }
}
