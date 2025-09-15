import QtQuick

Row {
    function splitDateTime(pref) {
        const split = DateTime.current.split(" ")

        if (pref === "date") {
            return `${split[0]} ${split[1]}`
        } else if (pref === "time") {
            return `${split[2]}`
        }
    }
    spacing: 6

    Rectangle {
        color: Colors.backgroundAlt
        width: 100
        height: 32
        radius: 4
        Row {
            anchors {
                centerIn: parent
            }
            spacing: 8
            Text {
                anchors {
                    verticalCenter: parent.verticalCenter
                }
                font {
                    family: "JetBrains Mono SemiBold"
                    pointSize: 16
                }
                color: Colors.orange
                text: ""
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
                text: splitDateTime("date")
            }
        }
    }
    Rectangle {
        color: Colors.backgroundAlt
        width: 90
        height: 32
        radius: 4
        Row {
            anchors {
                centerIn: parent
            }
            spacing: 8
            Text {
                anchors {
                    verticalCenter: parent.verticalCenter
                }
                font {
                    family: "JetBrains Mono SemiBold"
                    pointSize: 16
                }
                color: Colors.orange
                text: "󰥔"
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
                text: splitDateTime("time")
            }
        }
    }
}
