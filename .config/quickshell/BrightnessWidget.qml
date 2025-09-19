import QtQuick

BarWidget {
    iconColor: Colors.yellow
    icon: ""
    text: Brightness.text
    WheelHandler {
        acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
        onWheel: (event) => { Brightness.set(event.angleDelta.y) }
    }
}
