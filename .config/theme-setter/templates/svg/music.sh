music_icon_dir="$HOME/.config/eww/arin/images/icons/music/"
next_file="next.svg"
previous_file="previous.svg"
pause_file="pause.svg"
play_file="play.svg"
stop_file="stop.svg"

[[ -d "$music_icon_dir" ]] || mkdir -pv "$music_icon_dir"

next_output="$(cat << THEME
<!-- License: MIT. Made by Mikolaj Dobrucki: https://github.com/mikolajdobrucki/ikonate -->
<svg width="24px" height="24px" viewBox="0 0 24 24" role="img" xmlns="http://www.w3.org/2000/svg" aria-labelledby="nextIconTitle" stroke="#$(jq -r ".colors.\"$1\".blue" "$2")" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" fill="none" color="#000000"> <title id="nextIconTitle">Next</title> <path d="M17 11.5L6 18V5z"/> <path d="M18 18V5"/> </svg>
THEME
)"

previous_output="$(cat << THEME
<!-- License: MIT. Made by Mikolaj Dobrucki: https://github.com/mikolajdobrucki/ikonate -->
<svg width="24px" height="24px" viewBox="0 0 24 24" role="img" xmlns="http://www.w3.org/2000/svg" aria-labelledby="previousIconTitle" stroke="#$(jq -r ".colors.\"$1\".blue" "$2")" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" fill="none" color="#000000"> <title id="previousIconTitle">Previous</title> <path d="M7 11.5L18 18V5z"/> <path d="M6 18V5"/> </svg>
THEME
)"

pause_output="$(cat << THEME
<!-- License: Apache. Made by grommet: https://github.com/grommet/grommet-icons -->
<svg width="24px" height="24px" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
  <path fill="none" stroke="#$(jq -r ".colors.\"$1\".magenta" "$2")" stroke-width="2" d="M3,21 L9,21 L9,3 L3,3 L3,21 Z M15,21 L21,21 L21,3 L15,3 L15,21 Z"/>
</svg>
THEME
)"

play_output="$(cat << THEME
<!-- License: Apache. Made by grommet: https://github.com/grommet/grommet-icons -->
<svg width="24px" height="24px" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
  <polygon fill="none" stroke="#$(jq -r ".colors.\"$1\".magenta" "$2")" stroke-width="2" points="3 22 21 12 3 2"/>
</svg>

THEME
)"

stop_output="$(cat << THEME
<!-- License: CC Attribution. Made by FortAwesome: https://github.com/FortAwesome/Font-Awesome -->
<svg width="512px" height="512px" fill="#$(jq -r ".colors.\"$1\".magenta" "$2")" viewBox="-32 0 512 512" xmlns="http://www.w3.org/2000/svg"><path d="M400 32H48C21.5 32 0 53.5 0 80v352c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V80c0-26.5-21.5-48-48-48zm-6 400H54c-3.3 0-6-2.7-6-6V86c0-3.3 2.7-6 6-6h340c3.3 0 6 2.7 6 6v340c0 3.3-2.7 6-6 6z"/></svg>
THEME
)"

printf '%s' "$next_output" > "${music_icon_dir}${next_file}"
printf '%s' "$previous_output" > "${music_icon_dir}${previous_file}"
printf '%s' "$pause_output" > "${music_icon_dir}${pause_file}"
printf '%s' "$play_output" > "${music_icon_dir}${play_file}"
printf '%s' "$stop_output" > "${music_icon_dir}${stop_file}"