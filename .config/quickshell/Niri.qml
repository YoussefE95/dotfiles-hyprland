pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property int focus: -1
    property var workspaces: []

    function startSockets() {
        console.log("Starting Event Stream")
        eventStream.connected = true
    }

    function runCommand(sock, command) {
        sock.write(JSON.stringify(command) + "\n")
        sock.flush()
    }

    function updateWorkspaces(allWorkspaces) {
        let newWorkspaces = []
        let newFocus = -1

        for (let i = 0; i < allWorkspaces.length; i++) {
            if (allWorkspaces[i].is_focused) {
                newFocus = newWorkspaces.length
            }

            newWorkspaces.push({
                id: allWorkspaces[i].id,
                focused: allWorkspaces[i].is_focused,
                name: newWorkspaces.length + 1
            })
        }

        root.focus = newFocus
        root.workspaces = newWorkspaces
    }

    function updateFocus(id) {
        const newFocus = root.workspaces.findIndex((ws) => ws.id === id)

        const newWorkspaces = root.workspaces.map((ws, index) => {
            return {
                id: ws.id,
                focused: ws.id === id,
                name: ws.name
            }
        })

        root.focus = newFocus
        root.workspaces = newWorkspaces
    }

    Socket {
        id: eventStream
        path: Quickshell.env("NIRI_SOCKET")
        connected: false

        onConnectedChanged: {
            if (connected) {
                try {
                    runCommand(eventStream, "EventStream")
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
                        updateWorkspaces(
                            event.WorkspacesChanged.workspaces
                        )
                    } else if (event.WorkspaceActivated) {
                        updateFocus(
                            event.WorkspaceActivated.id
                        )
                    }
                } catch (error) {
                    console.log(error)
                }
            }
        }
    }
}
