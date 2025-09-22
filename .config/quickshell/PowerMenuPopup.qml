import Quickshell
import QtQuick

LazyLoader {
    id: popupLoader

    function load() {
        if (popupLoader.active) {
            popupLoader.active = false
        } else {
            popupLoader.loading = true
        }
    }

    PopupPanel {
        anchors.right: true
        width: info.width
        height: info.height

        PopupInfo {
            id: info
            infoWidth: 300
            infoHeight: 110
            borderColor: Theme.backgroundAlt
            Row {
                anchors.centerIn: parent
                spacing: 10
                PowerMenuButton {
                    icon: "󰍃"
                    command: "hyprctl dispatch exit"
                }
                PowerMenuButton {
                    icon: ""
                    command: "reboot"
                }
                PowerMenuButton {
                    icon: ""
                    command: "poweroff"
                }
            }
        }
    }
}
