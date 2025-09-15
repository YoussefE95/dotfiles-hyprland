import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Io
import QtQuick

Rectangle {
    function systemTrayIcon(modelData) {
        if (modelData.title === "dropbox") {
            return "/home/younix/.dropbox-dist/dropbox-lnx.x86_64-232.4.5926" +
            "/images/hicolor/16x16/status/dropboxstatus-logo.png"
        } else if (modelData.title === "spotify") {
            return "/home/younix/.local/share/spotify-launcher/install/usr/" +
            "share/spotify/icons/spotify-linux-22.png"
        } else {
            return modelData.icon
        }
    }
    color: Colors.backgroundAlt
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
                color: Colors.backgroundAlt
                width: 22
                height: 22
                MouseArea {
                    anchors.fill: parent
                    onClicked: (mouse) => {
                        if (modelData.hasMenu) {
                            modelData.display(
                                topBar,
                                Quickshell.screens[0].width - mouse.x,
                                mouse.y
                            )
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
