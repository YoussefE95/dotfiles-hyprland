import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick

Row {
    spacing: 8

    function current() {
        if (!Hyprland.focusedMonitor) {
            console.log(niriEventStream)
            niriEventStream.connected = true
            return niriEventStream.workspaces
        } else {
            return Hyprland.workspaces
        }
    }

    Socket {
        id: niriEventStream
        path: Quickshell.env("NIRI_SOCKET")
        connected: false

        property var workspaces

        onConnectedChanged: {
            if (connected) {
                try {
                    console.log("Niri Socket Connected")
                    niriEventStream.write(JSON.stringify("EventStream") + "\n")
                    niriEventStream.flush()
                } catch(error) {
                    console.log(error)
                }
            }
        }

        parser: SplitParser {
            onRead: data => {
                try {
                    const event = JSON.parse(data.trim())

                    if (event.WorkspacesChanged) {
                        const { workspaces } = event.WorkspacesChanged

                        for (let i = 0; i < workspaces.length; i++) {
                            const { id, output, is_active, is_focused }
                                = workspaces[i]
                            console.log(id, output, is_active, is_focused)
                        }
                    } else {
                        console.log(`Event: ${event}`)
                    }
                } catch (error) {
                    console.log(error)
                }
            }
        }
    }

    Repeater {
        model: current()

        Rectangle {
            color: modelData.focused ? Theme.orange : Theme.backgroundAlt
            width: 32
            height: 32
            radius: 4

            Text {
                anchors.centerIn: parent
                font {
                    family: Theme.fontFamily
                    weight: Theme.fontWeight
                    pointSize: Theme.fontSize
                }
                color: modelData.focused ? Theme.background : Theme.foreground
                text: modelData.name
            }
        }
    }

    // IpcHandler {
    //     target: "Niri"
    //
    //     function updateWorkspaces() {
    //         Niri.update()
    //     }
    // }
}
