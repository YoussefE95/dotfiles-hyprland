import QtQuick

Rectangle {
    id: info
    property int infoWidth
    property int infoHeight
    property color borderColor
    property int borderWidth

    color: Colors.background
    radius: 10
    border {
        color: info.borderColor
        width: info.borderWidth
    }

    implicitWidth: info.infoWidth
    implicitHeight: info.infoHeight
}
