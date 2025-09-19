import Quickshell
import QtQuick

LazyLoader {
    id: popupLoader

    function load() {
        if (popupLoader.active) {
            popupLoader.active = false
        } else {
            ThemeSetter.run()
            popupLoader.loading = true
        }
    }

    Popup {
        width: info.width
        height: info.height

        PopupInfo {
            id: info
            infoWidth: 210
            infoHeight: 166
            borderColor: "transparent"
            borderWidth: 0

            Column {
                topPadding: 8
                spacing: 8
                ThemeSetterRow {
                    rowWidth: info.implicitWidth
                    buttonInfo: [
                        { value: "theme", text: "Catppuccin" },
                        { value: "theme", text: "Gruvbox" }
                    ]
                }
                ThemeSetterRow {
                    rowWidth: info.implicitWidth
                    buttonInfo: [
                        { value: "mode", text: "Dark" },
                        { value: "mode", text: "Light" }
                    ]
                }
                ThemeSetterRow {
                    rowWidth: info.implicitWidth
                    buttonInfo: [
                        { value: "tone", text: "Hard" },
                        { value: "tone", text: "Medium" },
                        { value: "tone", text: "Soft" }
                    ]
                }
                Rectangle {
                    width: info.implicitWidth
                    height: 32
                    color: "transparent"
                    Rectangle {
                        anchors.centerIn: parent
                        width: 60
                        height: 32
                        radius: 4
                        color: Colors.backgroundAlt
                        MouseArea {
                            anchors.fill: parent
                            onClicked: (mouse) => { ThemeSetter.setTheme() }
                        }
                        ShellText {
                            anchors.centerIn: parent
                            size: 13
                            color: Colors.foreground
                            text: "Apply"

                        }
                    }
                }
            }
        }
    }
}
