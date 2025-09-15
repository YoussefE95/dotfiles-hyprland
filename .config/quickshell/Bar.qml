import Quickshell
import Quickshell.Io
import QtQuick

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: topBar

            required property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 42
            color: Colors.background

            WorkspacesWidget {
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                }
                leftPadding: 8
            }
            DateTimeWidget {
                anchors {
                    verticalCenter: parent.verticalCenter
                    centerIn: parent
                }
            }
            Row {
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: parent.right
                }
                rightPadding: 8
                spacing: 8
                VolumeWidget {}
                NetworkWidget {}
                SystemTrayWidget {}
            }
        }
    }
}
