import QtQuick

Row {
    spacing: 6

    BarWidget {
        iconColor: Colors.orange
        icon: ""
        text: DateTime.date
        width: 100
    }
    BarWidget {
        iconColor: Colors.orange
        icon: "󰥔"
        text: DateTime.time
        width: 90
    }
}
