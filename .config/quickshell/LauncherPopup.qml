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

    // Keys.onPressed: (event) => {
    //     if ((event.key == Qt.Key_Space) && (event.modifiers & Qt.MetaModifier)) {
    //         load()
    //         event.accepted = true
    //     }
    // }

    PopupPanel {
        id: popupPanel

        anchors.left: true
        width: info.width
        height: info.height
        focusable: true

        PopupInfo {
            id: info
            infoWidth: 400
            infoHeight: 300
            borderColor: Theme.backgroundAlt

            Column {
                padding: 10
                spacing: 8
                TextField {
                    id: appFilter
                    background: Rectangle {
                        width: info.implicitWidth - 20
                        height: 28
                        radius: 4
                        color: Theme.backgroundAlt
                    }
                    font {
                        family: Theme.fontFamily
                        weight: Theme.fontWeight
                        pointSize: Theme.fontSize
                    }
                    color: Theme.foreground
                    focus: true
                }
                ScrollView {
                    width: info.implicitWidth
                    height: info.implicitHeight
                    ScrollBar.vertical.policy: ScrollBar.AlwaysOff

                    Column {
                        spacing: 8
                        Repeater {
                            model: DesktopEntries.applications.values.filter(
                                (app) => {
                                    return !app.runInTerminal &&
                                    app.name.toLowerCase().includes(
                                        appFilter.text.toLowerCase()
                                    )
                                }
                            ).sort(
                                (a,b) => a.name.toLowerCase().localeCompare(b.name)
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
}
