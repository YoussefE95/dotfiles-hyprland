#!/bin/bash
palette=("${@}")

dest_dir="$HOME/.config/kitty/themes/"
dest_file="dynamic-theme.conf"

output="$(cat << THEME
## name: Dynamic

selection_foreground    #${palette[0]}
selection_background    #${palette[8]}

background              #${palette[0]}
foreground              #${palette[1]}

color0                  #${palette[11]}
color1                  #${palette[4]}
color2                  #${palette[5]}
color3                  #${palette[6]}
color4                  #${palette[7]}
color5                  #${palette[8]}
color6                  #${palette[9]}
color7                  #${palette[1]}
color8                  #${palette[11]}
color9                  #${palette[4]}
color10                 #${palette[5]}
color11                 #${palette[6]}
color12                 #${palette[7]}
color13                 #${palette[8]}
color14                 #${palette[9]}
color15                 #${palette[1]}

cursor                  #${palette[1]}
cursor_text_color       #${palette[1]}

url_color               #${palette[9]}

active_tab_foreground   #${palette[5]}
active_tab_background   #${palette[12]}
active_tab_font_style   bold-italic
inactive_tab_foreground #${palette[1]}
inactive_tab_background #${palette[12]}
THEME
)"

printf '%s' "$output" > "${dest_dir}${dest_file}"

kitten themes --reload-in=all Dynamic
