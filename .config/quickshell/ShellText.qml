import QtQuick

Text {
    id: root
    property int size
    property int weight: 500

    font {
        family: "JetBrains Mono"
        pointSize: root.size
        weight: root.weight
    }
}
