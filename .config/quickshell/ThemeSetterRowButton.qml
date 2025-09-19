import QtQuick

Rectangle {
    id: button

    property string value
    property string text

    width: button.text.length * 11
    height: 32
    radius: 4
    color: ThemeSetter[button.value] === button.text.toLowerCase() ? Colors.magenta : Colors.backgroundAlt

    MouseArea {
        anchors.fill: parent
        onClicked: { ThemeSetter.set(button.value, button.text.toLowerCase()) }
    }

    ShellText {
        anchors.centerIn: parent
        size: 13
        color: ThemeSetter[button.value] === button.text.toLowerCase() ? Colors.background : Colors.foreground
        text: button.text
    }
}
