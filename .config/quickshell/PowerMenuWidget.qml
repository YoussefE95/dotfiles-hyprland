import Quickshell
import Quickshell.Io
import QtQuick

BarWidget {
    width: 32
    iconColor: Colors.red
    icon:"⏻"
    text: ""

    PowerMenuPopup {
        id: popupLoader
    }

    MouseArea {
        anchors.fill: parent
        onClicked: (mouse) => { popupLoader.load() }
    }
}
