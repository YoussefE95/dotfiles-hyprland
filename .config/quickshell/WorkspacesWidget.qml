import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick

Row {
    spacing: 8

    Repeater {
        model: Hyprland.workspaces

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
