pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    property string theme
    property string mode
    property string tone

    Process {
        id: themeProc
        command: [ "get-theme", "--full" ]

        stdout: StdioCollector {
            onStreamFinished: () => {
                const split = this.text.replace("\n", "").split(" ")
                root.theme = split[0]
                root.mode = split[1]
                root.tone = split[2]
            }
        }
    }

    function run() {
        themeProc.running = true
    }

    function set(value, text) {
        root[value] = text
    }

    function setTheme() {
        themeProc.command = [ "set-theme", root.theme, root.mode, root.tone ]
        run()
    }
}
