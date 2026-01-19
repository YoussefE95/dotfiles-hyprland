import QtQuick

BarWidget {
    iconColor: Theme.magenta
    icon: "󰕾"
    text: Volume.text
    WheelHandler {
        acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
        onWheel: (event) => { Volume.set(event.angleDelta.y) }
    }
    MouseArea {
        anchors.fill: parent
        onClicked: (mouse) => { Volume.openManager() }
    }
}
