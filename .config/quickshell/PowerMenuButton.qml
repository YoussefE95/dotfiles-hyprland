import Quickshell
import Quickshell.Io
import QtQuick

Rectangle {
    id: button
    property string icon
    property string command

    width: 84
    height: 84
    radius: 10
    color: Colors.backgroundAlt

    Process {
        id: buttonProc
        command: button.command.split(" ")
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onClicked: (mouse) => {
            buttonProc.running = true
        }
        onEntered: (mouse) => {
            button.color = Colors.magenta
            buttonIcon.color = Colors.background
        }
        onExited: (mouse) => {
            button.color = Colors.backgroundAlt
            buttonIcon.color = Colors.foreground
        }
    }

    ShellText {
        id: buttonIcon
        anchors.centerIn: parent
        size: 28
        color: Colors.foreground
        text: button.icon
    }
}
