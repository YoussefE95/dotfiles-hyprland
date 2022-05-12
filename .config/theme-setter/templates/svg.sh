# Idea from: https://github.com/dylanaraps/pywal/issues/264

icon_dir="$HOME/.config/eww/arin/images/icons/"
dashboard_file="dashboard.svg"
search_file="search.svg"
brightness_file="brightness.svg"

workspace_icon_dir="$HOME/.config/eww/arin/images/icons/workspace/"
focused_file="focused-workspace.svg"
active_file="active-workspace.svg"
inactive_file="inactive-workspace.svg"

music_icon_dir="$HOME/.config/eww/arin/images/icons/music/"
next_file="next.svg"
previous_file="previous.svg"
pause_file="pause.svg"
play_file="play.svg"
stop_file="stop.svg"

[[ -d "$icon_dir" ]] || mkdir -pv "$icon_dir"
[[ -d "$workspace_icon_dir" ]] || mkdir -pv "$workspace_icon_dir"
[[ -d "$music_icon_dir" ]] || mkdir -pv "$music_icon_dir"

dashboard_output="$(cat << THEME
<?xml version="1.0" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg" id="Outline" viewBox="0 0 24 24" fill="#$(jq -r ".colors.\"$1\".foreground" "$2")" width="512" height="512"><path d="M7,0H4A4,4,0,0,0,0,4V7a4,4,0,0,0,4,4H7a4,4,0,0,0,4-4V4A4,4,0,0,0,7,0ZM9,7A2,2,0,0,1,7,9H4A2,2,0,0,1,2,7V4A2,2,0,0,1,4,2H7A2,2,0,0,1,9,4Z"/><path d="M20,0H17a4,4,0,0,0-4,4V7a4,4,0,0,0,4,4h3a4,4,0,0,0,4-4V4A4,4,0,0,0,20,0Zm2,7a2,2,0,0,1-2,2H17a2,2,0,0,1-2-2V4a2,2,0,0,1,2-2h3a2,2,0,0,1,2,2Z"/><path d="M7,13H4a4,4,0,0,0-4,4v3a4,4,0,0,0,4,4H7a4,4,0,0,0,4-4V17A4,4,0,0,0,7,13Zm2,7a2,2,0,0,1-2,2H4a2,2,0,0,1-2-2V17a2,2,0,0,1,2-2H7a2,2,0,0,1,2,2Z"/><path d="M20,13H17a4,4,0,0,0-4,4v3a4,4,0,0,0,4,4h3a4,4,0,0,0,4-4V17A4,4,0,0,0,20,13Zm2,7a2,2,0,0,1-2,2H17a2,2,0,0,1-2-2V17a2,2,0,0,1,2-2h3a2,2,0,0,1,2,2Z"/></svg>
THEME
)"

search_output="$(cat << THEME
<?xml version="1.0" encoding="UTF-8"?>
<!-- Generator: Adobe Illustrator 25.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px" y="0px" viewBox="0 0 513.749 513.749" style="enable-background:new 0 0 513.749 513.749;" xml:space="preserve" fill="#$(jq -r ".colors.\"$1\".foreground" "$2")" width="512" height="512">
<g>
	<path d="M504.352,459.061l-99.435-99.477c74.402-99.427,54.115-240.344-45.312-314.746S119.261-9.277,44.859,90.15   S-9.256,330.494,90.171,404.896c79.868,59.766,189.565,59.766,269.434,0l99.477,99.477c12.501,12.501,32.769,12.501,45.269,0   c12.501-12.501,12.501-32.769,0-45.269L504.352,459.061z M225.717,385.696c-88.366,0-160-71.634-160-160s71.634-160,160-160   s160,71.634,160,160C385.623,314.022,314.044,385.602,225.717,385.696z"/>
</g>
</svg>
THEME
)"

brightness_output="$(cat << THEME
<!-- License: CC Attribution. Made by FortAwesome: https://github.com/FortAwesome/Font-Awesome -->
<svg width="512px" height="512px" viewBox="-80 0 512 512" fill="#$(jq -r ".colors.\"$1\".yellow" "$2")" xmlns="http://www.w3.org/2000/svg"><path d="M96.06 454.35c.01 6.29 1.87 12.45 5.36 17.69l17.09 25.69a31.99 31.99 0 0 0 26.64 14.28h61.71a31.99 31.99 0 0 0 26.64-14.28l17.09-25.69a31.989 31.989 0 0 0 5.36-17.69l.04-38.35H96.01l.05 38.35zM0 176c0 44.37 16.45 84.85 43.56 115.78 16.52 18.85 42.36 58.23 52.21 91.45.04.26.07.52.11.78h160.24c.04-.26.07-.51.11-.78 9.85-33.22 35.69-72.6 52.21-91.45C335.55 260.85 352 220.37 352 176 352 78.61 272.91-.3 175.45 0 73.44.31 0 82.97 0 176zm176-80c-44.11 0-80 35.89-80 80 0 8.84-7.16 16-16 16s-16-7.16-16-16c0-61.76 50.24-112 112-112 8.84 0 16 7.16 16 16s-7.16 16-16 16z"/></svg>
THEME
)"

focused_output="$(cat << THEME
<?xml version="1.0" encoding="utf-8"?>
<!-- Uploaded to SVGRepo https://www.svgrepo.com -->
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	fill="#$(jq -r ".colors.\"$1\".magenta" "$2")" width="120px" height="120px" viewBox="0 0 120 120" enable-background="new 0 0 120 120" xml:space="preserve">
<circle cx="60" cy="60.834" r="54.167"/>
</svg>
THEME
)"

active_output="$(cat << THEME
<?xml version="1.0" encoding="utf-8"?>
<!-- Uploaded to SVGRepo https://www.svgrepo.com -->
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	fill="#$(jq -r ".colors.\"$1\".cyan" "$2")" width="120px" height="120px" viewBox="0 0 120 120" enable-background="new 0 0 120 120" xml:space="preserve">
<circle cx="60" cy="60.834" r="54.167"/>
</svg>
THEME
)"

inactive_output="$(cat << THEME
<?xml version="1.0" encoding="utf-8"?>
<!-- Uploaded to SVGRepo https://www.svgrepo.com -->
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	fill="#$(jq -r ".colors.\"$1\".gray" "$2")" width="120px" height="120px" viewBox="0 0 120 120" enable-background="new 0 0 120 120" xml:space="preserve">
<circle cx="60" cy="60.834" r="54.167"/>
</svg>
THEME
)"

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

printf '%s' "$dashboard_output" > "${icon_dir}${dashboard_file}"
printf '%s' "$search_output" > "${icon_dir}${search_file}"
printf '%s' "$brightness_output" > "${icon_dir}${brightness_file}"

printf '%s' "$focused_output" > "${workspace_icon_dir}${focused_file}"
printf '%s' "$active_output" > "${workspace_icon_dir}${active_file}"
printf '%s' "$inactive_output" > "${workspace_icon_dir}${inactive_file}"

printf '%s' "$next_output" > "${music_icon_dir}${next_file}"
printf '%s' "$previous_output" > "${music_icon_dir}${previous_file}"
printf '%s' "$pause_output" > "${music_icon_dir}${pause_file}"
printf '%s' "$play_output" > "${music_icon_dir}${play_file}"
printf '%s' "$stop_output" > "${music_icon_dir}${stop_file}"