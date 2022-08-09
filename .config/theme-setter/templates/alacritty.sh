dest_dir="$HOME/.config/alacritty/"
dest_file="colors.yml"

[[ -d "$dest_dir" ]] || mkdir -pv "$dest_dir"

output="$(cat << THEME
colors:
  primary:
    background: '#$(jq -r ".colors.\"$1\".background" "$2")'
    foreground: '#$(jq -r ".colors.\"$1\".foreground" "$2")'
  normal:
    black: '#$(jq -r ".colors.\"$1\".background" "$2")'
    red: '#$(jq -r ".colors.\"$1\".red" "$2")'
    green: '#$(jq -r ".colors.\"$1\".green" "$2")'
    yellow: '#$(jq -r ".colors.\"$1\".yellow" "$2")'
    magenta: '#$(jq -r ".colors.\"$1\".magenta" "$2")'
    cyan: '#$(jq -r ".colors.\"$1\".cyan" "$2")'
    white: '#$(jq -r ".colors.\"$1\".white" "$2")'
  bright:
    black: '#$(jq -r ".colors.\"$1\".gray" "$2")'
    red: '#$(jq -r ".colors.\"$1\".red" "$2")'
    green: '#$(jq -r ".colors.\"$1\".green" "$2")'
    yellow: '#$(jq -r ".colors.\"$1\".yellow" "$2")'
    magenta: '#$(jq -r ".colors.\"$1\".magenta" "$2")'
    cyan: '#$(jq -r ".colors.\"$1\".cyan" "$2")'
    white: '#$(jq -r ".colors.\"$1\".white" "$2")'
THEME
)"

printf '%s' "$output" > "${dest_dir}${dest_file}"