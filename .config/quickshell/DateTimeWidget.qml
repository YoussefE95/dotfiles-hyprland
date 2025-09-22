import Quickshell.Io
import QtQuick

Row {
    spacing: 6

    BarWidget {
        iconColor: Colors.orange
        icon: ""
        text: DateTime.date
        width: 100

        Process {
            id: calendarProc
            command: [ "firefox", "--new-tab", "https://calendar.google.com" ]
        }

        MouseArea {
            anchors.fill: parent
            onClicked: (mouse) => {
                calendarProc.running = true
            }
        }
    }
    BarWidget {
        iconColor: Colors.orange
        icon: "󰥔"
        text: DateTime.time
        width: 90
    }
}
