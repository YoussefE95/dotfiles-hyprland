import Quickshell
import Quickshell.Services.Notifications
import QtQuick
import QtQuick.Layouts

Scope {
    id: root
    property string appName
    property string summary
    property string body
    property bool urgent

    NotificationServer {
        id: notifications
    }
	Connections {
		target: notifications

		function onNotification(notification) {
			popupLoader.active = false

            root.appName = notification.appName
            root.summary = notification.summary
            root.body = notification.body
            root.urgent = (notification.urgency === 2)

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
                infoWidth: 400
				infoHeight: 150
                borderColor: root.urgent ? Theme.red : Theme.gray 

    			MouseArea {
					id: mouseArea
					anchors.fill: parent
					onClicked: popupLoader.active = false

					hoverEnabled: true
                }

                Column {
                    anchors.fill: parent
                    padding: 10
                    Rectangle {
                        implicitWidth: 380
                        implicitHeight: 30
                        color: "transparent"
                        Text {
                            anchors {
                                fill: parent
                                verticalCenter: parent.verticalCenter
                            }
                            font {
                                family: Theme.fontFamily
                                weight: 800
                                pointSize: Theme.fontSize
                            }
                            color: Theme.foreground
                            text: `${root.appName} | ${root.summary}`
                            elide: Text.ElideRight
                        }
                    }
                    Rectangle {
                        implicitWidth: 380
                        implicitHeight: 108
                        color: "transparent"
                        Text {
                            anchors {
                                fill: parent
                                verticalCenter: parent.verticalCenter
                            }
                            font {
                                family: Theme.fontFamily
                                weight: Theme.fontWeight
                                pointSize: Theme.fontSize
                            }
                            color: Theme.foreground
                            text: root.body
                            elide: Text.ElideRight
                            wrapMode: Text.WordWrap
                        }
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
						duration: 5000
						onFinished: popupLoader.active = false

						paused: mouseArea.containsMouse
					}
				}

				Component.onCompleted: anim.start()
			}
		}
	}
}
