#!/bin/bash
palette=("${@}")

qs_theme="$HOME/.config/quickshell/Theme.qml"
prefix="    property color"

sed -i "s/.*background:.*/$prefix background: \"#${palette[0]}\"/" $qs_theme
sed -i "s/.*backgroundAlt:.*/$prefix backgroundAlt: \"#${palette[1]}\"/" $qs_theme
sed -i "s/.*foreground:.*/$prefix foreground: \"#${palette[2]}\"/" $qs_theme
sed -i "s/.*gray:.*/$prefix gray: \"#${palette[3]}\"/" $qs_theme
sed -i "s/.*red:.*/$prefix red: \"#${palette[4]}\"/" $qs_theme
sed -i "s/.*green:.*/$prefix green: \"#${palette[5]}\"/" $qs_theme
sed -i "s/.*yellow:.*/$prefix yellow: \"#${palette[6]}\"/" $qs_theme
sed -i "s/.*blue:.*/$prefix blue: \"#${palette[7]}\"/" $qs_theme
sed -i "s/.*magenta:.*/$prefix magenta: \"#${palette[8]}\"/" $qs_theme
sed -i "s/.*cyan:.*/$prefix cyan: \"#${palette[9]}\"/" $qs_theme
sed -i "s/.*orange:.*/$prefix orange: \"#${palette[10]}\"/" $qs_theme

killall qs
qs -d
