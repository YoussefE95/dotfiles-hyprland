dest_dir="$HOME/.config/kitty/"
dest_file="kitty-theme.conf"

[[ -d "$dest_dir" ]] || mkdir -pv "$dest_dir"

output="$(cat << THEME
# The basic colors
foreground              #$(jq -r ".colors.\"$1\".foreground" "$2")
background              #$(jq -r ".colors.\"$1\".background" "$2")
selection_foreground    #$(jq -r ".colors.\"$1\".foreground" "$2")
selection_background    #$(jq -r ".colors.\"$1\".blue" "$2")

# Transparent Background
background_opacity 1

# Cursor colors
cursor                  #$(jq -r ".colors.\"$1\".foreground" "$2")
cursor_text_color       #$(jq -r ".colors.\"$1\".foreground" "$2")

# URL underline color when hovering with mouse
url_color               #$(jq -r ".colors.\"$1\".blue" "$2")

# kitty window border colors
active_border_color     #$(jq -r ".colors.\"$1\".blue" "$2")
inactive_border_color   #$(jq -r ".colors.\"$1\".gray" "$2")
bell_border_color       #$(jq -r ".colors.\"$1\".gray" "$2")

# OS Window titlebar colors
wayland_titlebar_color system
macos_titlebar_color system

#: Tab bar colors
active_tab_foreground   #$(jq -r ".colors.\"$1\".foreground" "$2")
active_tab_background   #$(jq -r ".colors.\"$1\".background" "$2")
inactive_tab_foreground #$(jq -r ".colors.\"$1\".foreground" "$2")
inactive_tab_background #$(jq -r ".colors.\"$1\".gray" "$2")
tab_bar_background      #$(jq -r ".colors.\"$1\".background" "$2")

# Colors for marks (marked text in the terminal)

mark1_foreground #$(jq -r ".colors.\"$1\".foreground" "$2")
mark1_background #$(jq -r ".colors.\"$1\".background" "$2")
mark2_foreground #$(jq -r ".colors.\"$1\".foreground" "$2")
mark2_background #$(jq -r ".colors.\"$1\".background" "$2")
mark3_foreground #$(jq -r ".colors.\"$1\".foreground" "$2")
mark3_background #$(jq -r ".colors.\"$1\".background" "$2")

#: The 16 terminal colors

#: black
color0 #$(jq -r ".colors.\"$1\".gray" "$2")
color8 #$(jq -r ".colors.\"$1\".gray" "$2")

#: red
color1 #$(jq -r ".colors.\"$1\".red" "$2")
color9 #$(jq -r ".colors.\"$1\".red" "$2")

#: green
color2  #$(jq -r ".colors.\"$1\".green" "$2")
color10 #$(jq -r ".colors.\"$1\".green" "$2")

#: yellow
color3  #$(jq -r ".colors.\"$1\".yellow" "$2")
color11 #$(jq -r ".colors.\"$1\".yellow" "$2")

#: blue
color4  #$(jq -r ".colors.\"$1\".blue" "$2")
color12 #$(jq -r ".colors.\"$1\".blue" "$2")

#: magenta
color5  #$(jq -r ".colors.\"$1\".magenta" "$2")
color13 #$(jq -r ".colors.\"$1\".magenta" "$2")

#: cyan
color6  #$(jq -r ".colors.\"$1\".cyan" "$2")
color14 #$(jq -r ".colors.\"$1\".cyan" "$2")

#: white
color7  #$(jq -r ".colors.\"$1\".white" "$2")
color15 #$(jq -r ".colors.\"$1\".white" "$2")
THEME
)"

printf '%s' "$output" > "${dest_dir}${dest_file}"

kitty @ set-colors --all --configured ~/.config/kitty/kitty-theme.conf