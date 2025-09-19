import QtQuick

Rectangle {
    id: widget
    property color iconColor
    property string icon
    property string text

    color: Colors.backgroundAlt
    width: 72
    height: 32
    radius: 4

    Row {
        anchors.centerIn: parent
        spacing: 8
        ShellText {
            anchors.verticalCenter: parent.verticalCenter
            size: 16
            color: widget.iconColor
            text: widget.icon
        }
        ShellText {
            anchors.verticalCenter: parent.verticalCenter
            size: 13
            color: Colors.foreground
            text: widget.text
        }
    }
}
