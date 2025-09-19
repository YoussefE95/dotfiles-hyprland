pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    property string icon
    property string text

    Process {
        id: networkProc
        command: ["sh", "-c", "~/.config/quickshell/scripts/network.sh"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: () => {
                const split = this.text.replace("\n", "").split(" ")
                root.icon = split[0]
                root.text = split[1]
            }
        }
    }

    Process {
        id: networkManagerProc
        command: [
            "kitty", "--title", "kitty_float", "nmtui"
        ]
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: networkProc.running = true
    }

    function openManager() {
        networkManagerProc.running = true
    }
}
