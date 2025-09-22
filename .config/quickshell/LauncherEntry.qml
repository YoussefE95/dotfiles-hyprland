import Quickshell
import Quickshell.Io
import QtQuick

Rectangle {
    id: root
    property QtObject entry

    width: info.implicitWidth
    height: 28
    color: Colors.backgroundAlt
    radius: 4

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onClicked: (mouse) => {
            root.entry.execute()
            popupLoader.load()
        }
        onEntered: (mouse) => {
            root.color = Colors.magenta
            entryName.color = Colors.background
        }
        onExited: (mouse) => {
            root.color = Colors.backgroundAlt
            entryName.color = Colors.foreground
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
            width: info.implicitWidth - 28
            height: 28
            color: "transparent"
            ShellText {
                id: entryName
                anchors.verticalCenter: parent.verticalCenter
                size: 13
                color: Colors.foreground
                text: root.entry.name
                elide: Text.ElideRight
            }
        }
    }
}
