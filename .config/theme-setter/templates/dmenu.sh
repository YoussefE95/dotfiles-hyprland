palette=("${@}")

dest_dir="$HOME/.config/hypr/"
dest_file="dmenu.sh"

[[ -d "$dest_dir" ]] || mkdir -pv "$dest_dir"

output="$(cat << THEME
#!/bin/bash
dmenu_run -b -fn 'SFMono-13' -nb "#${palette[0]}" -nf "#${palette[1]}" -sb "#${palette[5]}" -sf "#${palette[0]}"
THEME
)"

printf '%s' "$output" > "${dest_dir}${dest_file}"
