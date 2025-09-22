import QtQuick

Rectangle {
    id: button

    property string value
    property string text

    width: button.text.length * 11
    height: 32
    radius: 4
    color: ThemeSetter[button.value] === button.text.toLowerCase() ? Theme.magenta : Theme.backgroundAlt

    MouseArea {
        anchors.fill: parent
        onClicked: { ThemeSetter.set(button.value, button.text.toLowerCase()) }
    }

    Text {
        anchors.centerIn: parent
        font {
            family: Theme.fontFamily
            weight: Theme.fontWeight
            pointSize: Theme.fontSize
        }
        color: ThemeSetter[button.value] === button.text.toLowerCase() ? Theme.background : Theme.foreground
        text: button.text
    }
}
