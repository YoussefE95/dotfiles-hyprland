import QtQuick
import Quickshell
import Quickshell.Io

Socket {
    id: niriEventStream
    path: Quickshell.env("NIRI_SOCKET")
    connected: false

    property var workspaces

    parser: SplitParser {
        onRead: data => {
            try {
                const event = JSON.parse(data.trim())
                console.log(event)
            } catch (error) {
                console.log(error)
            }
        }
    }
}
