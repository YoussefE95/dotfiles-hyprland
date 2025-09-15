pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    property string current

    Process {
        id: dateProc
        command: ["date", "+%b %e %I:%M"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: root.current = this.text
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: dateProc.running = true
    }
}
