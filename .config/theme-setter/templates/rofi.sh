dest_dir="$HOME/.config/rofi/"
dest_file="colors.rasi"

[[ -d "$dest_dir" ]] || mkdir -pv "$dest_dir"

output="$(cat << THEME
/* colors */

* {
  al:   #$(jq -r ".colors.\"$1\".foreground" "$2")00;
  bg:   #$(jq -r ".colors.\"$1\".background" "$2")FF;
  bga:  #$(jq -r ".colors.\"$1\".background" "$2")FF;
  fg:   #$(jq -r ".colors.\"$1\".foreground" "$2")FF;
  ac:   #$(jq -r ".colors.\"$1\".magenta" "$2")FF;
  se:   #$(jq -r ".colors.\"$1\".blue" "$2")FF;
}
THEME
)"

printf '%s' "$output" > "${dest_dir}${dest_file}"