import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick

Row {
    spacing: 8

    Component.onCompleted: {
        if (!Hyprland.focusedMonitor) {
            console.log("Starting Sockets")
            Niri.startSockets()
        }
    }

    function current() {
        if (!Hyprland.focusedMonitor) {
            return Niri.workspaces
        } else {
            return Hyprland.workspaces
        }
    }

    Repeater {
        model: current()

        Rectangle {
            color: modelData.focused ? Theme.orange : Theme.backgroundAlt
            width: 32
            height: 32
            radius: 4

            Text {
                anchors.centerIn: parent
                font {
                    family: Theme.fontFamily
                    weight: Theme.fontWeight
                    pointSize: Theme.fontSize
                }
                color: modelData.focused ? Theme.background : Theme.foreground
                text: modelData.name
            }
        }
    }
}
