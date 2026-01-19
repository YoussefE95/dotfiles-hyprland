import QtQuick

Rectangle {
    id: widget
    property color iconColor
    property string icon
    property string text

    color: Theme.backgroundAlt
    width: 72
    height: 32
    radius: 4

    Row {
        anchors.centerIn: parent
        spacing: 8
        Text {
            anchors.verticalCenter: parent.verticalCenter
            font {
                family: Theme.fontFamily
                weight: Theme.fontWeight
                pointSize: Theme.iconSize
            }
            color: widget.iconColor
            text: widget.icon
        }
        Text {
            anchors.verticalCenter: parent.verticalCenter
            font {
                family: Theme.fontFamily
                weight: Theme.fontWeight
                pointSize: Theme.fontSize
            }
            color: Theme.foreground
            text: widget.text
        }
    }
}
