palette=("${@}")

dest_dir="$HOME/.config/alacritty/"
dest_file="colors.yml"

[[ -d "$dest_dir" ]] || mkdir -pv "$dest_dir"

output="$(cat << THEME
colors:
  primary:
    background: '#${palette[0]}'
    foreground: '#${palette[1]}'
  normal:
    black: '#${palette[2]}'
    red: '#${palette[4]}'
    green: '#${palette[5]}'
    yellow: '#${palette[6]}'
    blue: '#${palette[7]}'
    magenta: '#${palette[8]}'
    cyan: '#${palette[9]}'
    white: '#${palette[3]}'
  bright:
    black: '#${palette[11]}'
    red: '#${palette[4]}'
    green: '#${palette[5]}'
    yellow: '#${palette[6]}'
    blue: '#${palette[7]}'
    magenta: '#${palette[8]}'
    cyan: '#${palette[9]}'
    white: '#${palette[3]}'
THEME
)"

printf '%s' "$output" > "${dest_dir}${dest_file}"