pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick
import Quickshell.Services.Pipewire

Singleton {
    id: root
    property string text: round()

    PwObjectTracker {
        objects: [ Pipewire.defaultAudioSink ]
    }

    Process {
        id: volumeProc
        stdout: StdioCollector {
            onStreamFinished: () => { root.text = round() }
        }
    }

    Process {
        id: volumeManagerProc
        command: [
            "pavucontrol-qt"
        ]
    }

    function round() {
        const rounded = Pipewire.defaultAudioSink.audio.volume.toFixed(2)
        if (rounded === "1.00") {
            return "100"
        } else {
            return rounded.replace("0.", "")
        }
    }

    function set(delta) {
        let direction = "-"

        if (delta === 0) {
            return
        } else if (delta > 0) {
            direction = "+"
        }

        volumeProc.command = [
            "amixer", "-Mq", "set", "Master,0", `5%${direction}`, "unmute"
        ]
        volumeProc.running = true
    }

    function openManager() {
        volumeManagerProc.running = true
    }
}
