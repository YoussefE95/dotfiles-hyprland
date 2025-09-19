import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick

Row {
    spacing: 8

    Repeater {
        model: Hyprland.workspaces

        Rectangle {
            color: modelData.focused ? Colors.orange : Colors.backgroundAlt
            width: 32
            height: 32
            radius: 4

            ShellText {
                anchors.centerIn: parent
                size: 13
                color: modelData.focused ? Colors.background : Colors.foreground
                text: modelData.name
            }
        }
    }
}
