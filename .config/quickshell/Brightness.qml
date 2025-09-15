pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    property string backlight

    Process {
        id: brightnessProc
        command: [
            "sh", "-c", "~/.config/quickshell/scripts/brightness.sh"
        ]
        running: true

        stdout: StdioCollector {
            onStreamFinished: root.backlight = this.text
        }
    }

    function setBacklight(direction) {
        brightnessProc.command = [
            "sh", "-c",
            `~/.config/quickshell/scripts/brightness.sh ${direction}`
        ]
        brightnessProc.running = true
    }
}
