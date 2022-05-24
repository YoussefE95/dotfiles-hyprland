battery_icon_dir="$HOME/.config/eww/arin/images/icons/battery/"
battery_0="battery-0.svg"
battery_1="battery-1.svg"
battery_2="battery-2.svg"
battery_3="battery-3.svg"
battery_f="battery-f.svg"
battery_c="battery-c.svg"

[[ -d "$battery_icon_dir" ]] || mkdir -pv "$battery_icon_dir"

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

printf '%s' "$battery_0_output" > "${battery_icon_dir}${battery_0}"
printf '%s' "$battery_1_output" > "${battery_icon_dir}${battery_1}"
printf '%s' "$battery_2_output" > "${battery_icon_dir}${battery_2}"
printf '%s' "$battery_3_output" > "${battery_icon_dir}${battery_3}"
printf '%s' "$battery_f_output" > "${battery_icon_dir}${battery_f}"
printf '%s' "$battery_c_output" > "${battery_icon_dir}${battery_c}"