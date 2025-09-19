pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    property string date
    property string time

    Process {
        id: dateProc
        command: ["date", "+%b %e %I:%M"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: () => {
                const split = this.text.replace("\n", "").split(" ")
                root.date = `${split[0]} ${split[1]}`
                root.time = split[2]
            }
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: dateProc.running = true
    }
}
