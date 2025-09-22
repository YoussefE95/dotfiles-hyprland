import QtQuick

Rectangle {
    id: info
    property int infoWidth
    property int infoHeight
    property color borderColor

    color: Colors.background
    radius: 10
    border {
        color: info.borderColor
        width: 4
    }

    implicitWidth: info.infoWidth
    implicitHeight: info.infoHeight
}
