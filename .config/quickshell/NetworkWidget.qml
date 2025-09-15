import Quickshell
import Quickshell.Io
import QtQuick

Rectangle {
    function splitNetwork(pref) {
        const split = Network.connection.split(" ")

        if (pref === "icon") {
            return split[0]
        } else if (pref === "name") {
            return split[1]
        }
    }
    MouseArea {
        Process {
            id: networkManagerProc
        }
        anchors.fill: parent
        onClicked: (mouse) => {
            networkManagerProc.command = [
                "kitty", "--title", "kitty_float", "nmtui"
            ]
            networkManagerProc.running = true
        }
    }
    color: Colors.backgroundAlt
    width: Network.connection.length * 11.5
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
            color: Colors.cyan
            text: splitNetwork("icon")
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
            text: splitNetwork("name")
        }
    }
}
