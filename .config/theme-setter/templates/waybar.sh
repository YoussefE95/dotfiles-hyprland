dest_dir="$HOME/.config/waybar/"
dest_file="colors.css"

[[ -d "$dest_dir" ]] || mkdir -pv "$dest_dir"

output="$(cat << THEME
@define-color background #$(jq -r ".colors.\"$1\".background" "$2");
@define-color foreground #$(jq -r ".colors.\"$1\".foreground" "$2");

@define-color white #$(jq -r ".colors.\"$1\".white" "$2");
@define-color black #$(jq -r ".colors.\"$1\".black" "$2");
@define-color red #$(jq -r ".colors.\"$1\".red" "$2");
@define-color magenta #$(jq -r ".colors.\"$1\".magenta" "$2");
@define-color blue #$(jq -r ".colors.\"$1\".blue" "$2");
@define-color cyan #$(jq -r ".colors.\"$1\".cyan" "$2");
@define-color green #$(jq -r ".colors.\"$1\".green" "$2");
@define-color yellow #$(jq -r ".colors.\"$1\".yellow" "$2");
@define-color orange #$(jq -r ".colors.\"$1\".orange" "$2");
@define-color gray #$(jq -r ".colors.\"$1\".gray" "$2");
THEME
)"

printf '%s' "$output" > "${dest_dir}${dest_file}"

killall waybar
waybar </dev/null &>/dev/null &