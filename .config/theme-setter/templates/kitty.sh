palette=("${@}")

dest_dir="$HOME/.config/kitty/"
dest_file="kitty-theme.conf"

[[ -d "$dest_dir" ]] || mkdir -pv "$dest_dir"

output="$(cat << THEME
# The basic colors
foreground              #${palette[1]}
background              #${palette[2]}
selection_foreground    #${palette[1]}
selection_background    #${palette[7]}

# Transparent Background
background_opacity 1

# Cursor colors
cursor                  #${palette[1]} 
cursor_text_color       #${palette[1]}

# URL underline color when hovering with mouse
url_color               #${palette[7]} 

# kitty window border colors
active_border_color     #${palette[7]} 
inactive_border_color   #${palette[11]}
bell_border_color       #${palette[11]}
# OS Window titlebar colors
wayland_titlebar_color system
macos_titlebar_color system

#: Tab bar colors
active_tab_foreground   #${palette[1]}
active_tab_background   #${palette[0]}
inactive_tab_foreground #${palette[1]}
inactive_tab_background #${palette[0]}
tab_bar_background      #${palette[0]}

# Colors for marks (marked text in the terminal)

mark1_foreground #${palette[1]}
mark1_background #${palette[0]}
mark2_foreground #${palette[1]}
mark2_background #${palette[0]}
mark3_foreground #${palette[1]}
mark3_background #${palette[0]}

#: The 16 terminal colors

#: black
color0 #${palette[11]}
color8 #${palette[11]}

#: red
color1 #${palette[4]}
color9 #${palette[4]}

#: green
color2  #${palette[5]}
color10 #${palette[5]}

#: yellow
color3  #${palette[6]}
color11 #${palette[6]}

#: blue
color4  #${palette[7]}
color12 #${palette[7]}

#: magenta
color5  #${palette[8]}
color13 #${palette[8]}

#: cyan
color6  #${palette[9]}
color14 #${palette[9]}

#: white
color7  #${palette[3]}
color15 #${palette[3]}
THEME
)"

printf '%s' "$output" > "${dest_dir}${dest_file}"

kitty @ set-colors --all --configured ~/.config/kitty/kitty-theme.conf
