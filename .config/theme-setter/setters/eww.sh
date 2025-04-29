#!/bin/bash
palette=("${@}")

dest_dir="$HOME/.config/eww/"
dest_file="colors.scss"

output="$(cat << THEME
\$background: #${palette[0]};
\$backgroundAlt: #${palette[1]};
\$foreground: #${palette[2]};

\$white: #${palette[3]};
\$black: #${palette[1]};
\$red: #${palette[4]};
\$magenta: #${palette[8]};
\$blue: #${palette[7]};
\$cyan: #${palette[9]};
\$green: #${palette[5]};
\$yellow: #${palette[6]};
\$orange: #${palette[10]};
\$gray: #${palette[3]};
THEME
)"

printf '%s' "$output" > "${dest_dir}${dest_file}"

# eww update THEME="$(get-theme)"
# eww update MODE="$(get-theme --mode)"
~/.config/hypr/scripts/brightness.sh
~/.config/hypr/scripts/volume.sh
