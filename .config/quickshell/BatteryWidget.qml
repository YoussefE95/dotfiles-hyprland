import Quickshell
import Quickshell.Io
import QtQuick

Rectangle {
    function splitBattery(pref) {
        const split = Battery.remaining.split(" ")

        if (pref === "icon") {
            return split[0]
        } else if (pref === "value") {
            return split[1]
        }
    }
    color: Colors.backgroundAlt
    width: 70
    height: 32
    radius: 4
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
            color: Colors.green
            text: splitBattery("icon")
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
            text: splitBattery("value")
        }
    }
}
