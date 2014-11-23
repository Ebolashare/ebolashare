import QtQuick 2.3

FocusScope {
    id: root

    readonly property alias hover: mouseArea.containsMouse
    property alias source: image.source

    height: 70
    width: 219

    Image {
        id: image
        fillMode: Image.PreserveAspectFit
        height: 70
    }

    MouseArea {
        id: mouseArea
        anchors.fill: root
        hoverEnabled: false
        onEntered: {
            image.height = 100

        }
        onExited: {
            image.height = 70
        }
        onMouseXChanged: update()
        onMouseYChanged: update()
        /*onClicked: {
            image.height = 100
        }*/
    }

    //    states: [
    //        State {
    //            name: "hover"; when: mousearea.containsMouse
    //            PropertyChanges{ target: root; color: "red" }
    //        },
    //        State {
    //            name: "exited"; when: onExited
    //            PropertyChanges { target: root; color: "transparent" }
    //        }
    //    ]
    transitions: Transition {
        ColorAnimation { easing.type: Easing.OutCubic; duration: 700 }
    }
}
