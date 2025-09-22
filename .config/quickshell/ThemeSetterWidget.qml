import Quickshell
import Quickshell.Io
import QtQuick

BarWidget {
    width: 32
    iconColor: Theme.blue
    icon:"󰢵"
    text: ""

    ThemeSetterPopup {
        id: popupLoader
    }

    MouseArea {
        anchors.fill: parent
        onClicked: (mouse) => { popupLoader.load() }
    }
}
