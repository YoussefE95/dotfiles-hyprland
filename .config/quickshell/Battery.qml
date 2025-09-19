pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    property string icon
    property string text

    Process {
        id: batteryProc
        command: ["sh", "-c", "~/.config/quickshell/scripts/battery.sh"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: () => {
                const split = this.text.replace("\n", "").split(" ")
                root.icon = split[0]
                root.text = split[1]
            }
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: batteryProc.running = true
    }
}
