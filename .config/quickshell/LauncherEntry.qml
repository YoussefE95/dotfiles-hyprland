import Quickshell
import Quickshell.Io
import QtQuick

Rectangle {
    id: root
    property QtObject entry

    width: info.implicitWidth - 20
    height: 28
    color: Theme.backgroundAlt
    radius: 4

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onClicked: (mouse) => {
            root.entry.execute()
            popupLoader.load()
        }
        onEntered: (mouse) => {
            root.color = Theme.magenta
            entryName.color = Theme.background
        }
        onExited: (mouse) => {
            root.color = Theme.backgroundAlt
            entryName.color = Theme.foreground
        }
    }

    Row {
        id: entryRow
        spacing: 10

        Rectangle {
            width: 28
            height: 28
            color: "transparent"
            Image {
                anchors.fill: parent
                source: root.entry.icon
            }
        }

        Rectangle {
            width: info.implicitWidth - 48
            height: 28
            color: "transparent"
            Text {
                id: entryName
                anchors.verticalCenter: parent.verticalCenter
                font {
                    family: Theme.fontFamily
                    weight: Theme.fontWeight
                    pointSize: Theme.fontSize
                }
                color: Theme.foreground
                text: root.entry.name
                elide: Text.ElideRight
            }
        }
    }
}
