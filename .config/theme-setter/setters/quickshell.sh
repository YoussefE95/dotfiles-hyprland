#!/bin/bash
palette=("${@}")

dest_dir="$HOME/.config/quickshell/"
dest_file="Colors.qml"

output="$(cat << THEME
pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    property color background: "#${palette[0]}"
    property color backgroundAlt: "#${palette[1]}"
    property color foreground: "#${palette[2]}"
    property color gray: "#${palette[3]}"
    property color red: "#${palette[4]}"
    property color green: "#${palette[5]}"
    property color yellow: "#${palette[6]}"
    property color blue: "#${palette[7]}"
    property color magenta: "#${palette[8]}"
    property color cyan: "#${palette[9]}"
    property color orange: "#${palette[10]}"
}
THEME
)"

printf '%s' "$output" > "${dest_dir}${dest_file}"
