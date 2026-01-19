pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    property var workspaces

    Process {
        id: niriProc
        command: [
            "sh", "-c", 
            `~/.config/quickshell/scripts/niri.sh`
        ]
        running: true

        stdout: StdioCollector {
            onStreamFinished: () => {
                let workspaces = this.text.split("\n").map((ws) => {
                    const split = ws.split(" ")

                    if (split.length > 1) {
                        let focused, name

                        if (split[1] === "*") {
                            focused = true
                            name = split[2]
                        } else {
                            focused = false
                            name = split[3]
                        }

                        return { focused, name }
                    }
                    else {
                        return {}
                    }
                })

                workspaces.pop()

                root.workspaces = workspaces;
            }
        }
    }

    function update() {
        niriProc.running = true
    }
}
