import Quickshell
import Quickshell.Io
import QtQuick
import Quickshell.Services.Pipewire

Rectangle {
    function roundAudio(volume) {
        const rounded = volume.toFixed(2)

        if (rounded === "1.00") {
            return "100"
        } else {
            return rounded.replace("0.", "")
        }
    }
    PwObjectTracker {
        objects: [ Pipewire.defaultAudioSink ]
    }
    Process {
        id: volumeProc
    }

    color: Colors.backgroundAlt
    width: 70
    height: 32
    radius: 4

    WheelHandler {
        acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
        onWheel: (event) => {
            let delta = "+"

            if (event.angleDelta.y < 0) {
                delta = "-"
            }

            volumeProc.command = [
                "amixer", "-Mq", "set", "Master,0", `5%${delta}`, "unmute"
            ]
            volumeProc.running = true
        }
    }
    Row {
        anchors {
            centerIn: parent
        }
        Text {
            anchors {
                verticalCenter: parent.verticalCenter
            }
            font {
                family: "JetBrains Mono SemiBold"
                pointSize: 16
            }
            color: Colors.magenta
            text: " "
        }
        Text {
            anchors {
                verticalCenter: parent.verticalCenter
            }
            font {
                family: "JetBrains Mono SemiBold"
                pointSize: 13
            }
            color: Colors.foreground
            text: roundAudio(Pipewire.defaultAudioSink.audio.volume)
        }
    }
}
