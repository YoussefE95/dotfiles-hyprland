import QtQuick
import QtQuick.Layouts
import Quickshell

PanelWindow {
    id: popup
    property int width
    property int height

    anchors {
        top: true
    }

    margins {
        top: 5
        left: anchors.left ? 5 : 0
        right: anchors.right ? 5 : 0
    }

    implicitWidth: popup.width
    implicitHeight: popup.height
    color: "transparent"
}
