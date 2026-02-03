import Quickshell
import Quickshell.Io
import Quickshell.Services.SystemTray
import QtQuick

Rectangle {
    function systemTrayIcon(modelData) {
        const split = modelData.icon.split("?path=")
        const icon = split[0].replace("image://icon/", "")

        if (modelData.title === "dropbox") {
            return `${split[1]}/hicolor/16x16/status/${icon}`
        } else if (modelData.title === "spotify") {
            return `${split[1]}/${icon}`
        } else {
            return split[0]
        }
    }

    color: Theme.backgroundAlt
    width: SystemTray.items.values.length * 34
    height: 32
    radius: 4

    Row {
        anchors {
            centerIn: parent
        }
        spacing: 8
        Repeater {
            model: SystemTray.items

            Rectangle {
                color: Theme.backgroundAlt
                width: 22
                height: 22
                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton | Qt.RightButton
                    onClicked: (mouse) => {
                        if (mouse.button === Qt.LeftButton) {
                            modelData.activate()
                        } else if (mouse.button === Qt.RightButton) {
                            if (modelData.hasMenu) {
                                modelData.display(
                                    topBar,
                                    topBar.screen.width - mouse.x,
                                    mouse.y
                                )
                            }
                        }
                    }
                }
                Image {
                    anchors.fill: parent
                    source: systemTrayIcon(modelData)
                }
            }
        }
    }
}
