# Idea from: https://github.com/dylanaraps/pywal/issues/264

dest_dir="$HOME/.config/eww/arin/"
dest_file="variables.scss"

[[ -d "$dest_dir" ]] || mkdir -pv "$dest_dir"

output="$(cat << THEME
\$background: #$(jq -r ".colors.\"$1\".background" "$2");
\$background-alt: #$(jq -r ".colors.\"$1\".black" "$2");
\$background-alt2: #$(jq -r ".colors.\"$1\".black" "$2");
\$foreground: #$(jq -r ".colors.\"$1\".foreground" "$2");
\$red: #$(jq -r ".colors.\"$1\".red" "$2");
\$yellow: #$(jq -r ".colors.\"$1\".yellow" "$2");
\$orange: #$(jq -r ".colors.\"$1\".orange" "$2");
\$green: #$(jq -r ".colors.\"$1\".green" "$2");
\$blue: #$(jq -r ".colors.\"$1\".blue" "$2");
\$blue2: #$(jq -r ".colors.\"$1\".blue" "$2");
\$magenta: #$(jq -r ".colors.\"$1\".magenta" "$2");
\$cyan: #$(jq -r ".colors.\"$1\".cyan" "$2");
THEME
)"

printf '%s' "$output" > "${dest_dir}${dest_file}"
printf '%s' "$output" > "${dest_dir}sidebar/${dest_file}"
