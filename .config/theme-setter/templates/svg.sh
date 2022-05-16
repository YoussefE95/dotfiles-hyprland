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

battery_icon_dir="$HOME/.config/eww/arin/images/icons/battery/"
battery_0="battery-0.svg"
battery_1="battery-1.svg"
battery_2="battery-2.svg"
battery_3="battery-3.svg"
battery_f="battery-f.svg"
battery_c="battery-c.svg"

volume_icon_dir="$HOME/.config/eww/arin/images/icons/volume/"
volume_m="volume-m.svg"
volume_0="volume-0.svg"
volume_1="volume-1.svg"
volume_2="volume-2.svg"
volume_3="volume-3.svg"

wifi_icon_dir="$HOME/.config/eww/arin/images/icons/wifi/"
wifi_c="wifi-c.svg"
wifi_nc="wifi-nc.svg"
eth="ethernet.svg"

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
	fill="#$(jq -r ".colors.\"$1\".green" "$2")" width="120px" height="120px" viewBox="0 0 120 120" enable-background="new 0 0 120 120" xml:space="preserve">
<circle cx="60" cy="60.834" r="54.167"/>
</svg>
THEME
)"

active_output="$(cat << THEME
<?xml version="1.0" encoding="utf-8"?>
<!-- Uploaded to SVGRepo https://www.svgrepo.com -->
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	fill="#$(jq -r ".colors.\"$1\".blue" "$2")" width="120px" height="120px" viewBox="0 0 120 120" enable-background="new 0 0 120 120" xml:space="preserve">
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

battery_0_output="$(cat << THEME
<?xml version="1.0" encoding="iso-8859-1"?>
<!-- Generator: Adobe Illustrator 19.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
<svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	fill="#$(jq -r ".colors.\"$1\".red" "$2")" viewBox="0 0 60 60" style="enable-background:new 0 0 60 60;" xml:space="preserve">
<path d="M42.536,4H36V0H24v4h-6.536C15.554,4,14,5.554,14,7.464v49.072C14,58.446,15.554,60,17.464,60h25.072
	C44.446,60,46,58.446,46,56.536V7.464C46,5.554,44.446,4,42.536,4z M44,56.536C44,57.344,43.344,58,42.536,58H17.464
	C16.656,58,16,57.344,16,56.536V7.464C16,6.656,16.656,6,17.464,6H24h12h6.536C43.344,6,44,6.656,44,7.464V56.536z"/>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
</svg>
THEME
)"

battery_1_output="$(cat << THEME
<?xml version="1.0" encoding="iso-8859-1"?>
<!-- Generator: Adobe Illustrator 19.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
<svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	fill="#$(jq -r ".colors.\"$1\".orange" "$2")" viewBox="0 0 60 60" style="enable-background:new 0 0 60 60;" xml:space="preserve">
<g>
	<path d="M14,47v9.536C14,58.446,15.554,60,17.464,60h25.072C44.446,60,46,58.446,46,56.536V47H14z"/>
	<path d="M46,45V7.464C46,5.554,44.446,4,42.536,4H36V0H24v4h-6.536C15.554,4,14,5.554,14,7.464V45H46z M16,7.464
		C16,6.656,16.656,6,17.464,6H24h12h6.536C43.344,6,44,6.656,44,7.464V43H16V7.464z"/>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
</svg>
THEME
)"

battery_2_output="$(cat << THEME
<?xml version="1.0" encoding="iso-8859-1"?>
<!-- Generator: Adobe Illustrator 19.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
<svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	fill="#$(jq -r ".colors.\"$1\".yellow" "$2")" viewBox="0 0 60 60" style="enable-background:new 0 0 60 60;" xml:space="preserve">
<g>
	<path d="M14,36v20.536C14,58.446,15.554,60,17.464,60h25.072C44.446,60,46,58.446,46,56.536V36H14z"/>
	<path d="M46,34V7.464C46,5.554,44.446,4,42.536,4H36V0H24v4h-6.536C15.554,4,14,5.554,14,7.464V34H46z M16,7.464
		C16,6.656,16.656,6,17.464,6H24h12h6.536C43.344,6,44,6.656,44,7.464V32H16V7.464z"/>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
</svg>
THEME
)"

battery_3_output="$(cat << THEME
<?xml version="1.0" encoding="iso-8859-1"?>
<!-- Generator: Adobe Illustrator 19.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
<svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	fill="#$(jq -r ".colors.\"$1\".cyan" "$2")" viewBox="0 0 60 60" style="enable-background:new 0 0 60 60;" xml:space="preserve">
<g>
	<path d="M14,23v33.536C14,58.446,15.554,60,17.464,60h25.072C44.446,60,46,58.446,46,56.536V23H14z"/>
	<path d="M46,21V7.464C46,5.554,44.446,4,42.536,4H36V0H24v4h-6.536C15.554,4,14,5.554,14,7.464V21H46z M16,7.464
		C16,6.656,16.656,6,17.464,6H24h12h6.536C43.344,6,44,6.656,44,7.464V19H16V7.464z"/>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
</svg>
THEME
)"

battery_f_output="$(cat << THEME
<?xml version="1.0" encoding="iso-8859-1"?>
<!-- Generator: Adobe Illustrator 19.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
<svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 fill="#$(jq -r ".colors.\"$1\".green" "$2")" viewBox="0 0 60 60" style="enable-background:new 0 0 60 60;" xml:space="preserve">
<path d="M42.536,4H36V0H24v4h-6.536C15.554,4,14,5.554,14,7.464v49.072C14,58.446,15.554,60,17.464,60h25.071
	C44.446,60,46,58.446,46,56.536V7.464C46,5.554,44.446,4,42.536,4z"/>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
</svg>
THEME
)"

battery_c_output="$(cat << THEME
<?xml version="1.0" encoding="iso-8859-1"?>
<!-- Generator: Adobe Illustrator 19.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
<svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	fill="#$(jq -r ".colors.\"$1\".green" "$2")" viewBox="0 0 60 60" style="enable-background:new 0 0 60 60;" xml:space="preserve">
<g>
	<path d="M42.536,4H36V0H24v4h-6.536C15.554,4,14,5.554,14,7.464v49.072C14,58.446,15.554,60,17.464,60h25.071
		C44.446,60,46,58.446,46,56.536V7.464C46,5.554,44.446,4,42.536,4z M44,56.536C44,57.344,43.343,58,42.536,58H17.464
		C16.657,58,16,57.344,16,56.536V7.464C16,6.656,16.657,6,17.464,6H24h12h6.536C43.343,6,44,6.656,44,7.464V56.536z"/>
	<path d="M37,29h-3V17.108c0.013-0.26-0.069-0.515-0.236-0.72c-0.381-0.467-1.264-0.463-1.642,0.004
		c-0.026,0.032-0.05,0.066-0.072,0.103L22.15,32.474c-0.191,0.309-0.2,0.696-0.023,1.013C22.303,33.804,22.637,34,23,34h4
		l0.002,12.929h0.001c0.001,0.235,0.077,0.479,0.215,0.657C27.407,47.833,27.747,48,28.058,48c0.305,0,0.636-0.16,0.825-0.398
		c0.04-0.05,0.074-0.103,0.104-0.159l8.899-16.979c0.163-0.31,0.151-0.682-0.03-0.981S37.35,29,37,29z"/>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
</svg>
THEME
)"

volume_m_output="$(cat << THEME
<?xml version="1.0" encoding="iso-8859-1"?>
<!-- Generator: Adobe Illustrator 19.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
<svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	fill="#$(jq -r ".colors.\"$1\".red" "$2")" viewBox="0 0 54 54" style="enable-background:new 0 0 54 54;" xml:space="preserve">
<g>
	<path d="M46.414,26l7.293-7.293c0.391-0.391,0.391-1.023,0-1.414s-1.023-0.391-1.414,0L45,24.586l-7.293-7.293
		c-0.391-0.391-1.023-0.391-1.414,0s-0.391,1.023,0,1.414L43.586,26l-7.293,7.293c-0.391,0.391-0.391,1.023,0,1.414
		C36.488,34.902,36.744,35,37,35s0.512-0.098,0.707-0.293L45,27.414l7.293,7.293C52.488,34.902,52.744,35,53,35
		s0.512-0.098,0.707-0.293c0.391-0.391,0.391-1.023,0-1.414L46.414,26z"/>
	<path d="M26.894,4c-0.551,0-1.097,0.153-1.579,0.444c-0.046,0.027-0.09,0.059-0.13,0.093L11.634,16H1c-0.553,0-1,0.447-1,1v19
		c0,0.553,0.447,1,1,1h10.61l13.543,12.436c0.05,0.046,0.104,0.086,0.161,0.12C25.797,49.847,26.343,50,26.894,50
		C28.606,50,30,48.584,30,46.844V7.156C30,5.416,28.606,4,26.894,4z M13,35c0,0.553-0.447,1-1,1s-1-0.447-1-1v-4
		c0-0.553,0.447-1,1-1s1,0.447,1,1V35z M13,22c0,0.553-0.447,1-1,1s-1-0.447-1-1v-4c0-0.553,0.447-1,1-1s1,0.447,1,1V22z"/>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
</svg>
THEME
)"

volume_0_output="$(cat << THEME
<?xml version="1.0" encoding="iso-8859-1"?>
<!-- Generator: Adobe Illustrator 19.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
<svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	fill="#$(jq -r ".colors.\"$1\".red" "$2")" viewBox="0 0 46 46" style="enable-background:new 0 0 46 46;" xml:space="preserve">
<g>
	<path d="M34.894,0c-0.551,0-1.097,0.153-1.579,0.444c-0.046,0.027-0.09,0.059-0.13,0.093L19.634,12H9c-0.553,0-1,0.447-1,1v19
		c0,0.553,0.447,1,1,1h10.61l13.543,12.436c0.05,0.046,0.104,0.086,0.161,0.12C33.797,45.847,34.343,46,34.894,46
		C36.606,46,38,44.584,38,42.844V3.156C38,1.416,36.606,0,34.894,0z M21,31c0,0.553-0.447,1-1,1s-1-0.447-1-1v-4
		c0-0.553,0.447-1,1-1s1,0.447,1,1V31z M21,18c0,0.553-0.447,1-1,1s-1-0.447-1-1v-4c0-0.553,0.447-1,1-1s1,0.447,1,1V18z"/>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
</svg>
THEME
)"

volume_1_output="$(cat << THEME
<?xml version="1.0" encoding="iso-8859-1"?>
<!-- Generator: Adobe Illustrator 19.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
<svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	fill="#$(jq -r ".colors.\"$1\".orange" "$2")" viewBox="0 0 46 46" style="enable-background:new 0 0 46 46;" xml:space="preserve">
<g>
	<path d="M28.38,0c-0.551,0-1.097,0.153-1.579,0.444c-0.046,0.027-0.09,0.059-0.13,0.093L13.121,12H2.487c-0.553,0-1,0.447-1,1v19
		c0,0.553,0.447,1,1,1h10.61L26.64,45.436c0.05,0.046,0.104,0.086,0.161,0.12C27.284,45.847,27.83,46,28.38,46
		c1.713,0,3.106-1.416,3.106-3.156V3.156C31.487,1.416,30.093,0,28.38,0z M14.487,31c0,0.553-0.447,1-1,1s-1-0.447-1-1v-4
		c0-0.553,0.447-1,1-1s1,0.447,1,1V31z M14.487,18c0,0.553-0.447,1-1,1s-1-0.447-1-1v-4c0-0.553,0.447-1,1-1s1,0.447,1,1V18z"/>
	<path d="M44.513,22.5c0-5.972-4.009-11.302-9.749-12.962c-0.533-0.151-1.084,0.152-1.238,0.684
		c-0.153,0.53,0.152,1.085,0.684,1.238c4.889,1.413,8.304,5.953,8.304,11.04s-3.415,9.627-8.304,11.04
		c-0.531,0.153-0.837,0.708-0.684,1.238c0.127,0.438,0.526,0.723,0.961,0.723c0.092,0,0.185-0.013,0.277-0.039
		C40.504,33.802,44.513,28.472,44.513,22.5z"/>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
</svg>
THEME
)"

volume_2_output="$(cat << THEME
<?xml version="1.0" encoding="iso-8859-1"?>
<!-- Generator: Adobe Illustrator 19.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
<svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	fill="#$(jq -r ".colors.\"$1\".yellow" "$2")" viewBox="0 0 52.026 52.026" style="enable-background:new 0 0 52.026 52.026;" xml:space="preserve">
<g>
	<path d="M26.894,3.013c-0.551,0-1.097,0.153-1.579,0.444c-0.046,0.027-0.09,0.059-0.13,0.093L11.634,15.013H1c-0.553,0-1,0.447-1,1
		v19c0,0.553,0.447,1,1,1h10.61l13.543,12.436c0.05,0.046,0.104,0.086,0.161,0.12c0.482,0.291,1.028,0.444,1.579,0.444
		c1.713,0,3.106-1.416,3.106-3.156V6.169C30,4.429,28.606,3.013,26.894,3.013z M13,34.013c0,0.553-0.447,1-1,1s-1-0.447-1-1v-4
		c0-0.553,0.447-1,1-1s1,0.447,1,1V34.013z M13,21.013c0,0.553-0.447,1-1,1s-1-0.447-1-1v-4c0-0.553,0.447-1,1-1s1,0.447,1,1V21.013
		z"/>
	<path d="M38.797,7.066c-0.523-0.177-1.091,0.103-1.269,0.626c-0.177,0.522,0.103,1.091,0.626,1.269
		c7.101,2.411,11.872,9.063,11.872,16.553c0,7.483-4.762,14.136-11.849,16.554c-0.522,0.178-0.802,0.746-0.623,1.27
		c0.142,0.415,0.53,0.677,0.946,0.677c0.107,0,0.216-0.017,0.323-0.054c7.896-2.693,13.202-10.106,13.202-18.446
		C52.026,17.167,46.71,9.753,38.797,7.066z"/>
	<path d="M43.026,25.513c0-5.972-4.009-11.302-9.749-12.962c-0.533-0.151-1.084,0.152-1.238,0.684
		c-0.153,0.53,0.152,1.085,0.684,1.238c4.889,1.413,8.304,5.953,8.304,11.04s-3.415,9.627-8.304,11.04
		c-0.531,0.153-0.837,0.708-0.684,1.238c0.127,0.438,0.526,0.723,0.961,0.723c0.092,0,0.185-0.013,0.277-0.039
		C39.018,36.815,43.026,31.485,43.026,25.513z"/>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
</svg>
THEME
)"

volume_3_output="$(cat << THEME
<?xml version="1.0" encoding="iso-8859-1"?>
<!-- Generator: Adobe Illustrator 19.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
<svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	fill="#$(jq -r ".colors.\"$1\".cyan" "$2")" viewBox="0 0 60 60" style="enable-background:new 0 0 60 60;" xml:space="preserve">
<g>
	<path d="M26.894,7.358c-0.551,0-1.097,0.153-1.579,0.444c-0.046,0.027-0.09,0.059-0.13,0.093L11.634,19.358H1c-0.553,0-1,0.447-1,1
		v19c0,0.266,0.105,0.52,0.293,0.707S0.734,40.358,1,40.358l10.61-0.005l13.543,12.44c0.05,0.046,0.104,0.086,0.161,0.12
		c0.482,0.291,1.028,0.444,1.579,0.444c1.713,0,3.106-1.416,3.106-3.156V10.514C30,8.774,28.606,7.358,26.894,7.358z M13,38.358
		c0,0.553-0.447,1-1,1s-1-0.447-1-1v-4c0-0.553,0.447-1,1-1s1,0.447,1,1V38.358z M13,25.358c0,0.553-0.447,1-1,1s-1-0.447-1-1v-4
		c0-0.553,0.447-1,1-1s1,0.447,1,1V25.358z"/>
	<path d="M52.026,29.858c0-8.347-5.316-15.76-13.229-18.447c-0.522-0.177-1.091,0.103-1.269,0.626
		c-0.177,0.522,0.103,1.091,0.626,1.269c7.101,2.411,11.872,9.063,11.872,16.553c0,7.483-4.762,14.136-11.849,16.554
		c-0.522,0.178-0.802,0.746-0.623,1.27c0.142,0.415,0.53,0.677,0.946,0.677c0.107,0,0.216-0.017,0.323-0.054
		C46.721,45.611,52.026,38.198,52.026,29.858z"/>
	<path d="M44.453,6.374c-0.508-0.213-1.095,0.021-1.312,0.53C42.926,7.413,43.163,8,43.672,8.216C52.376,11.909,58,20.405,58,29.858
		c0,9.777-5.894,18.38-15.015,21.914c-0.515,0.2-0.771,0.779-0.571,1.294c0.153,0.396,0.532,0.639,0.933,0.639
		c0.12,0,0.242-0.021,0.361-0.067C53.605,49.801,60,40.467,60,29.858C60,19.6,53.897,10.382,44.453,6.374z"/>
	<path d="M43.026,29.858c0-5.972-4.009-11.302-9.749-12.962c-0.53-0.151-1.084,0.152-1.238,0.684
		c-0.153,0.53,0.152,1.085,0.684,1.238c4.889,1.413,8.304,5.953,8.304,11.04s-3.415,9.627-8.304,11.04
		c-0.531,0.153-0.837,0.708-0.684,1.238c0.127,0.438,0.526,0.723,0.961,0.723c0.092,0,0.185-0.013,0.277-0.039
		C39.018,41.159,43.026,35.829,43.026,29.858z"/>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
</svg>
THEME
)"

wifi_c_output="$(cat << THEME
<?xml version="1.0" encoding="iso-8859-1"?>
<!-- Generator: Adobe Illustrator 19.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
<svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	fill="#$(jq -r ".colors.\"$1\".magenta" "$2")" viewBox="0 0 494.45 494.45" style="enable-background:new 0 0 494.45 494.45;" xml:space="preserve">
<g>
	<g>
		<g>
			<path d="M395.225,277.325c-6.8,0-13.5-2.6-18.7-7.8c-71.4-71.3-187.4-71.3-258.8,0c-10.3,10.3-27.1,10.3-37.4,0
				s-10.3-27.1,0-37.4c92-92,241.6-92,333.6,0c10.3,10.3,10.3,27.1,0,37.4C408.725,274.725,401.925,277.325,395.225,277.325z"/>
		</g>
		<g>
			<path d="M323.625,348.825c-6.8,0-13.5-2.6-18.7-7.8c-15.4-15.4-36-23.9-57.8-23.9s-42.4,8.5-57.8,23.9
				c-10.3,10.3-27.1,10.3-37.4,0c-10.3-10.3-10.3-27.1,0-37.4c25.4-25.4,59.2-39.4,95.2-39.4s69.8,14,95.2,39.5
				c10.3,10.3,10.3,27.1,0,37.4C337.225,346.225,330.425,348.825,323.625,348.825z"/>
		</g>
		<g>
			<circle cx="247.125" cy="398.925" r="35.3"/>
		</g>
		<g>
			<path d="M467.925,204.625c-6.8,0-13.5-2.6-18.7-7.8c-111.5-111.4-292.7-111.4-404.1,0c-10.3,10.3-27.1,10.3-37.4,0
				s-10.3-27.1,0-37.4c64-64,149-99.2,239.5-99.2s175.5,35.2,239.5,99.2c10.3,10.3,10.3,27.1,0,37.4
				C481.425,202.025,474.625,204.625,467.925,204.625z"/>
		</g>
	</g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
</svg>
THEME
)"

wifi_nc_output="$(cat << THEME
<?xml version="1.0" encoding="iso-8859-1"?>
<!-- Generator: Adobe Illustrator 19.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
<svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	fill="#$(jq -r ".colors.\"$1\".red" "$2")" viewBox="0 0 489.6 489.6" style="enable-background:new 0 0 489.6 489.6;" xml:space="preserve">
<g>
	<g>
		<g>
			<path d="M179.6,235.6c-33.7,10.3-65.5,28.5-92.2,55.1l46.6,46.6c13.9-13.9,30.1-24.8,47.6-32.5L179.6,235.6z"/>
			<path d="M175.8,109C111.3,122,49.9,153.4,0,203.3l46.6,46.6c37.5-37.5,83.1-61.9,131.2-73.7L175.8,109z"/>
			<path d="M313.8,109l-2,67.3c48.1,11.8,93.7,36.2,131.2,73.7l46.6-46.6C439.8,153.4,378.3,122,313.8,109z"/>
			<path d="M307.9,304.8c17.5,7.7,33.7,18.6,47.7,32.6l46.6-46.6c-26.6-26.6-58.5-44.9-92.2-55.2L307.9,304.8z"/>
		</g>
		<circle cx="244.8" cy="403.2" r="40"/>
		<g>
			<path d="M260.6,330.4h-31.7c-8.3,0-15.1-6.6-15.3-14.9L206,62.2c-0.3-8.6,6.7-15.8,15.3-15.8h47c8.6,0,15.6,7.1,15.3,15.8
				l-7.7,253.3C275.7,323.8,268.9,330.4,260.6,330.4z"/>
		</g>
	</g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
</svg>
THEME
)"

eth_output="$(cat << THEME
<?xml version="1.0" encoding="iso-8859-1"?>
<!-- Generator: Adobe Illustrator 19.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
<svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	fill="#$(jq -r ".colors.\"$1\".magenta" "$2")" viewBox="0 0 490 490" style="enable-background:new 0 0 490 490;" xml:space="preserve">
<g>
	<g>
		<path d="M0,0v490h490V0H0z M430.1,332.9h-87.5v50.9h-33.1v50.9H180.4v-50.6h-33.1v-51.3H59.9v-278h46.7v66.5h38.5V54.8h40.8v66.5
			h38.5V54.8h40.8v66.5h38.5V54.8h40.8v66.5H383V54.8h46.7v278.1L430.1,332.9L430.1,332.9z"/>
	</g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
</svg>
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

printf '%s' "$battery_0_output" > "${battery_icon_dir}${battery_0}"
printf '%s' "$battery_1_output" > "${battery_icon_dir}${battery_1}"
printf '%s' "$battery_2_output" > "${battery_icon_dir}${battery_2}"
printf '%s' "$battery_3_output" > "${battery_icon_dir}${battery_3}"
printf '%s' "$battery_f_output" > "${battery_icon_dir}${battery_f}"
printf '%s' "$battery_c_output" > "${battery_icon_dir}${battery_c}"

printf '%s' "$volume_m_output" > "${volume_icon_dir}${volume_m}"
printf '%s' "$volume_0_output" > "${volume_icon_dir}${volume_0}"
printf '%s' "$volume_1_output" > "${volume_icon_dir}${volume_1}"
printf '%s' "$volume_2_output" > "${volume_icon_dir}${volume_2}"
printf '%s' "$volume_3_output" > "${volume_icon_dir}${volume_3}"

printf '%s' "$wifi_c_output" > "${wifi_icon_dir}${wifi_c}"
printf '%s' "$wifi_nc_output" > "${wifi_icon_dir}${wifi_nc}"
printf '%s' "$eth_output" > "${wifi_icon_dir}${eth}"
