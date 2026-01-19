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

    Socket {
        id: eventStream
        path: Quickshell.env("NIRI_SOCKET")
        connected: false

        function startup() {
            console.log("Niri Socket Connected")
            eventStream.write(JSON.stringify("EventStream") + "\n")
            eventStream.flush()
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
            // let newWorkspaces = root.workspaces
            // const newFocus = newWorkspaces.findIndex((ws) => {
            //     return ws.id === id
            // })
            //
            // if (newFocus !== -1) {
            //     if (root.focus !== -1) {
            //         newWorkspaces[root.focus].focused = false
            //     }
            //     newWorkspaces[newFocus].focused = true
            // } else {
            //     newWorkspaces = newWorkspaces.map((ws) => {
            //         return {
            //             id: ws.id,
            //             focused: false,
            //             name: ws.name
            //         }
            //     })
            // }

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

            for (let i = 0; i < root.workspaces.length; i++) {
                console.log(
                    root.workspaces[i].id,
                    root.workspaces[i].name,
                    root.workspaces[i].focused
                )
            }
        }

        onConnectedChanged: {
            if (connected) {
                try {
                    startup()
                } catch(error) {
                    console.log(error)
                }
            }
        }

        parser: SplitParser {
            onRead: data => {
                try {
                    const event = JSON.parse(data.trim())

                    console.log(event)
                    if (event.WorkspacesChanged) {
                        eventStream.updateWorkspaces(event.WorkspacesChanged.workspaces)
                    } else if (event.WorkspaceActivated) {
                        eventStream.updateFocus(event.WorkspaceActivated.id)
                    }
                } catch (error) {
                    console.log(error)
                }
            }
        }
    }
}
