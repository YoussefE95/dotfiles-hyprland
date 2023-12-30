palette=("${@}")

dest_dir="$HOME/.config/alacritty/"
dest_file="colors.toml"

output="$(cat << THEME
[colors.bright]
black = "#${palette[11]}"
red = "#${palette[4]}"
green = "#${palette[5]}"
yellow = "#${palette[6]}"
blue = "#${palette[7]}"
magenta = "#${palette[8]}"
cyan = "#${palette[9]}"
white = "#${palette[3]}"

[colors.normal]
black = "#${palette[11]}"
red = "#${palette[4]}"
green = "#${palette[5]}"
yellow = "#${palette[6]}"
blue = "#${palette[7]}"
magenta = "#${palette[8]}"
cyan = "#${palette[9]}"
white = "#${palette[3]}"

[colors.primary]
background = "#${palette[0]}"
foreground = "#${palette[1]}"
THEME
)"

printf '%s' "$output" > "${dest_dir}${dest_file}"