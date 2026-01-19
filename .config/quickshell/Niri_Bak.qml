import Quickshell
import Quickshell.Io

Socket {
    id: sock
    path: Quickshell.env("NIRI_SOCKET")
    connected: false

    property var workspaces: []
    property int focus: -1

    function startup() {
        console.log("Niri Socket Connected")
        sock.write(JSON.stringify("EventStream") + "\n")
        sock.flush()
    }

    function updateWorkspaces(allWorkspaces) {
        let newWorkspaces = []
        let newFocus = -1

        for (let i = 0; i < allWorkspaces.length; i++) {
            if (allWorkspaces[i].output === topBar.screen.name) {
                if (allWorkspaces[i].is_focused) {
                    newFocus = newWorkspaces.length
                }

                newWorkspaces.push({
                    id: allWorkspaces[i].id,
                    focused: allWorkspaces[i].is_focused,
                    name: newWorkspaces.length + 1
                })
            }
        }

        sock.focus = newFocus
        sock.workspaces = newWorkspaces
    }

    function updateFocus(id) {
        let newWorkspaces = sock.workspaces
        const newFocus = newWorkspaces.findIndex((ws) => {
            return ws.id === id
        })

        if (newFocus !== -1) {
            if (sock.focus !== -1) {
                newWorkspaces[sock.focus].focused = false
            }
            newWorkspaces[newFocus].focused = true
        } else {
            newWorkspaces = newWorkspaces.map((ws) => {
                return {
                    id: ws.id,
                    focused: false,
                    name: ws.name
                }
            })
        }

        sock.focus = newFocus
        sock.workspaces = newWorkspaces

        for (let i = 0; i < sock.workspaces.length; i++) {
            console.log(
                sock.workspaces[i].id,
                sock.workspaces[i].name,
                sock.workspaces[i].focused
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
                    updateWorkspaces(event.WorkspacesChanged.workspaces)
                } else if (event.WorkspaceActivated) {
                    updateFocus(event.WorkspaceActivated.id)
                }
            } catch (error) {
                console.log(error)
            }
        }
    }
}
