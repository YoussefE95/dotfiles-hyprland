palette=("${@}")

dest_dir="$HOME/.config/rofi/"
dest_file="colors.rasi"

[[ -d "$dest_dir" ]] || mkdir -pv "$dest_dir"

output="$(cat << THEME
/* colors */

* {
  al:   #${palette[1]}00;
  bg:   #${palette[0]}FF;
  bga:  #${palette[0]}FF;
  fg:   #${palette[1]}FF;
  ac:   #${palette[8]}FF;
  se:   #${palette[9]}FF;
}
THEME
)"

printf '%s' "$output" > "${dest_dir}${dest_file}"
