import QtQuick

BarWidget {
    iconColor: Theme.yellow
    icon: ""
    text: Brightness.text
    WheelHandler {
        acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
        onWheel: (event) => { Brightness.set(event.angleDelta.y) }
    }
}
