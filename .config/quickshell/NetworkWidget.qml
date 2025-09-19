import Quickshell
import Quickshell.Io
import QtQuick

BarWidget {
    iconColor: Colors.cyan
    icon: Network.icon
    text: Network.text
    width: (Network.text.length + 3) * 12
    MouseArea {
        anchors.fill: parent
        onClicked: (mouse) => { Network.openManager() }
    }
}
