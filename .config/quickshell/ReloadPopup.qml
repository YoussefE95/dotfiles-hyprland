import QtQuick
import QtQuick.Layouts
import Quickshell

Scope {
	id: root
	property bool failed;
	property string errorString;

	Connections {
		target: Quickshell

		function onReloadCompleted() {
			Quickshell.inhibitReloadPopup()
			root.failed = false
			popupLoader.loading = true
		}

		function onReloadFailed(error: string) {
			Quickshell.inhibitReloadPopup()
			popupLoader.active = false

			root.failed = true
			root.errorString = error
			popupLoader.loading = true
		}
	}

	LazyLoader {
		id: popupLoader

        PopupPanel {
            anchors.left: true
            width: info.width
			height: info.height

			PopupInfo {
                id: info
                infoWidth: layout.implicitWidth + 30
				infoHeight: layout.implicitHeight + 50
                borderColor: failed ?  Theme.red : Theme.green 

				MouseArea {
					id: mouseArea
					anchors.fill: parent
					onClicked: popupLoader.active = false

					hoverEnabled: true
				}

				ColumnLayout {
					id: layout
					anchors {
						top: parent.top
						topMargin: 20
						horizontalCenter: parent.horizontalCenter
					}

					Text {
                        font {
                            family: Theme.fontFamily
                            weight: Theme.fontWeight
                            pointSize: Theme.fontSize
                        }
                        color: Theme.foreground
						text: root.failed ? "Reload failed." : "Reloaded completed!"
					}

					Text {
                        font {
                            family: Theme.fontFamily
                            weight: Theme.fontWeight
                            pointSize: Theme.fontSize
                        }
                        color: Theme.foreground
						text: root.errorString
						visible: root.errorString != ""
					}
				}

				Rectangle {
                    id: bar
                    anchors {
                        bottom: parent.bottom
                        left: parent.left
                    }
                    height: 14
                    radius: 10
					color: info.border.color

					PropertyAnimation {
						id: anim
						target: bar
						property: "width"
						from: info.width
						to: 0
						duration: failed ? 10000 : 1000
						onFinished: popupLoader.active = false

						paused: mouseArea.containsMouse
					}
				}

			    Component.onCompleted: anim.start()
			}
		}
    }
}
