#!/bin/bash
palette=("${@}")

dest_dir="$HOME/.config/eww/"
dest_file="colors.scss"

output="$(cat << THEME
\$background: #${palette[0]};
\$backgroundAlt: #${palette[12]};
\$foreground: #${palette[1]};

\$white: #${palette[3]};
\$black: #${palette[2]};
\$red: #${palette[4]};
\$magenta: #${palette[8]};
\$blue: #${palette[7]};
\$cyan: #${palette[9]};
\$green: #${palette[5]};
\$yellow: #${palette[6]};
\$orange: #${palette[10]};
\$gray: #${palette[11]};
THEME
)"

printf '%s' "$output" > "${dest_dir}${dest_file}"
