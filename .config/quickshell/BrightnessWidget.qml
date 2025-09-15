import Quickshell
import Quickshell.Io
import QtQuick

Rectangle {
    color: Colors.backgroundAlt
    width: 70
    height: 32
    radius: 4
    WheelHandler {
        acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
        onWheel: (event) => {
            if (event.angleDelta.y === 0) {
                return
            } else if (event.angleDelta.y > 0) {
                Brightness.setBacklight("--up")
            } else {
                Brightness.setBacklight("--down")
            }
        }
    }
    Row {
        anchors {
            centerIn: parent
        }
        spacing: 8
        Text {
            anchors {
                verticalCenter: parent.verticalCenter
            }
            font {
                family: "JetBrains Mono SemiBold"
                pointSize: 16
            }
            color: Colors.yellow
            text: ""
        }
        Text {
            anchors {
                verticalCenter: parent.verticalCenter
            }
            font {
                family: "JetBrains Mono SemiBold"
                pointSize: 13
            }
            color: Colors.foreground
            text: Brightness.backlight
        }
    }
}
