import Quickshell
import QtQuick
import QtQuick.Controls

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
        anchors.left: true
        width: info.width
        height: info.height

        PopupInfo {
            id: info
            infoWidth: 400
            infoHeight: 300
            borderColor: Colors.backgroundAlt

            ScrollView {
                anchors.fill: parent
                width: info.implicitWidth
                height: info.implicitHeight

                Column {
                    padding: 10
                    spacing: 8

                    Repeater {
                        model: DesktopEntries.applications.values.filter(
                            (application) => !application.runInTerminal
                        )

                        LauncherEntry {
                            entry: modelData
                        }
                    }
                }
            }
        }
    }
}
