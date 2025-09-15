pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    property string connection

    Process {
        id: networkProc
        command: ["sh", "-c", "~/.config/quickshell/scripts/network.sh"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: root.connection = this.text
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: networkProc.running = true
    }
}
