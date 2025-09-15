pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    property string remaining

    Process {
        id: batteryProc
        command: ["sh", "-c", "~/.config/quickshell/scripts/battery.sh"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: root.remaining = this.text
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: batteryProc.running = true
    }
}
