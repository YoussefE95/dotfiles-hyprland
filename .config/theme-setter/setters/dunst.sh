#!/bin/bash
palette=("${@}")

dest_dir="$HOME/.config/dunst/"
dest_file="dunstTheme"

output="$(cat << THEME
[urgency_low]
    # IMPORTANT: colors have to be defined in quotation marks.
    # Otherwise the "#" and following would be interpreted as a comment.
    background = "#${palette[0]}"
    foreground = "#${palette[1]}"
    frame_color = "#${palette[11]}"
    timeout = 10
    # Icon for notifications with low urgency, uncomment to enable
    #default_icon = /path/to/icon

[urgency_normal]
    background = "#${palette[0]}"
    foreground = "#${palette[1]}"
    frame_color = "#${palette[11]}"
    timeout = 10
    # Icon for notifications with normal urgency, uncomment to enable
    #default_icon = /path/to/icon

[urgency_critical]
    background = "#${palette[0]}"
    foreground = "#${palette[1]}"
    frame_color = "#${palette[4]}"
    timeout = 0
    # Icon for notifications with critical urgency, uncomment to enable
    #default_icon = /path/to/icon

# Set icon theme (only used for recursive icon lookup)
icon_theme = "${palette[13]}"
THEME
)"

printf '%s' "$output" > "${dest_dir}${dest_file}"

killall dunst
cat ~/.config/dunst/dunstrc ~/.config/dunst/dunstTheme | dunst -conf - &
