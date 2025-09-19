pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    property string text

    Process {
        id: brightnessProc
        command: [
            "sh", "-c", "~/.config/quickshell/scripts/brightness.sh"
        ]
        running: true

        stdout: StdioCollector {
            onStreamFinished: root.text = this.text.replace("\n", "")
        }
    }

    function set(delta) {
        let direction = "--down"

        if (delta === 0) {
            return
        } else if (delta > 0) {
            direction = "--up"
        }

        brightnessProc.command = [
            "sh", "-c",
            `~/.config/quickshell/scripts/brightness.sh ${direction}`
        ]
        brightnessProc.running = true
    }
}
