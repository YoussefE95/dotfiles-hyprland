import Quickshell
import Quickshell.Io
import QtQuick

BarWidget {
    width: 32
    iconColor: Theme.magenta
    icon:""
    text: ""

    LauncherPopup {
        id: popupLoader
    }

    MouseArea {
        anchors.fill: parent
        onClicked: (mouse) => { popupLoader.load() }
    }
}
