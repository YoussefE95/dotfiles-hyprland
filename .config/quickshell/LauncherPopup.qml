import Quickshell
import QtQuick
import QtQuick.Controls

LazyLoader {
    id: popupLoader
    property int selectedEntry

    function load() {
        if (popupLoader.active) {
            popupLoader.active = false
        } else {
            popupLoader.selectedEntry = 0
            popupLoader.loading = true
        }
    }

    function unHighlight(entry) {
        entry.rectColor = Theme.backgroundAlt
        entry.textColor = Theme.foreground
    }

    function highlight(entry) {
        entry.rectColor = Theme.magenta
        entry.textColor = Theme.background
    }

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
                            id: repeater
                            model: DesktopEntries.applications.values.filter(
                                (app) => {
                                    return !app.runInTerminal &&
                                    app.name.toLowerCase().includes(
                                        appFilter.text.toLowerCase()
                                    )
                                }
                            ).sort(
                                (a,b) => {
                                    return a.name.toLowerCase().localeCompare(
                                        b.name
                                    )
                                }
                            )

                            onCountChanged: {
                                popupLoader.selectedEntry = 0
                            }

                            onItemAdded: {
                                popupLoader.highlight(
                                    repeater.itemAt(
                                        popupLoader.selectedEntry
                                    )
                                )
                            }

                            LauncherEntry {
                                entry: modelData
                            }
                        }

                        Item {
                            Shortcut {
                                sequence: "Down"
                                onActivated: {
                                    if (popupLoader.selectedEntry < repeater.count - 1) {
                                        popupLoader.unHighlight(
                                            repeater.itemAt(
                                                popupLoader.selectedEntry
                                            )
                                        )

                                        popupLoader.selectedEntry++

                                        popupLoader.highlight(
                                            repeater.itemAt(
                                                popupLoader.selectedEntry
                                            )
                                        )
                                    }
                                }
                            }
                            Shortcut {
                                sequence: "Up"
                                onActivated: {
                                    if (popupLoader.selectedEntry > 0) {
                                        popupLoader.unHighlight(
                                            repeater.itemAt(
                                                popupLoader.selectedEntry
                                            )
                                        )

                                        popupLoader.selectedEntry--

                                        popupLoader.highlight(
                                            repeater.itemAt(
                                                popupLoader.selectedEntry
                                            )
                                        )
                                    }
                                }
                            }
                            Shortcut {
                                sequence: "Return"
                                onActivated: {
                                    repeater.itemAt(
                                        popupLoader.selectedEntry
                                    ).entry.execute()
                                    popupLoader.load()
                                }
                            }
                            Shortcut {
                                sequence: "Escape"
                                onActivated: {
                                    popupLoader.active = false
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
