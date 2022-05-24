wifi_icon_dir="$HOME/.config/eww/arin/images/icons/wifi/"
wifi_c="wifi-c.svg"
wifi_nc="wifi-nc.svg"
eth="ethernet.svg"

[[ -d "$wifi_icon_dir" ]] || mkdir -pv "$wifi_icon_dir"

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

printf '%s' "$wifi_c_output" > "${wifi_icon_dir}${wifi_c}"
printf '%s' "$wifi_nc_output" > "${wifi_icon_dir}${wifi_nc}"
printf '%s' "$eth_output" > "${wifi_icon_dir}${eth}"