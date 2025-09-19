import QtQuick

Rectangle {
    id: row
    property int rowWidth
    property var buttonInfo

    width: row.rowWidth
    height: 32
    color: "transparent"
    Row {
        spacing: 8
        anchors.centerIn: parent
        Repeater {
            model: row.buttonInfo

            ThemeSetterRowButton {
                value: modelData.value
                text: modelData.text
            }
        }
    }
}
