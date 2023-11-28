palette=("${@}")

dest_dir="$HOME/.config/waybar/"
dest_file="colors.css"

output="$(cat << THEME
@define-color background #${palette[0]};
@define-color backgroundAlt #${palette[12]};
@define-color foreground #${palette[1]};

@define-color white #${palette[3]};
@define-color black #${palette[2]};
@define-color red #${palette[4]};
@define-color magenta #${palette[8]};
@define-color blue #${palette[7]};
@define-color cyan #${palette[9]};
@define-color green #${palette[5]};
@define-color yellow #${palette[6]};
@define-color orange #${palette[10]};
@define-color gray #${palette[11]};
THEME
)"

printf '%s' "$output" > "${dest_dir}${dest_file}"

killall waybar
waybar </dev/null &>/dev/null &
