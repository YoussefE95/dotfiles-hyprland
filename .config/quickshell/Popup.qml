import QtQuick
import QtQuick.Layouts
import Quickshell

PanelWindow {
    id: popup
    property int width
    property int height

    anchors {
        top: true
        left: true
    }

    margins {
        top: 5
        left: 5
    }

    implicitWidth: popup.width
    implicitHeight: popup.height
    color: "transparent"
}
