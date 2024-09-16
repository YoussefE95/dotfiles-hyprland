#!/bin/bash
palette=("${@}")

dest_dir="$HOME/.config/spicetify/Themes/Comfy"
dest_file="color.ini"

output="$(cat << THEME
[dynamic]
text 				= ${palette[2]}
subtext 			= ${palette[2]}
main 				= ${palette[1]}
main-transition 	= ${palette[1]}
highlight           = ${palette[0]}
highlight-elevated  = ${palette[3]}
sidebar 			= ${palette[0]}
player				= ${palette[0]}
card 				= ${palette[0]}
shadow 				= ${palette[1]}
selected-row 		= ${palette[3]} 
button 				= ${palette[7]} 
button-active 		= ${palette[7]} 
button-disabled 	= ${palette[3]} 
tab-active 			= ${palette[8]} 
notification 		= ${palette[7]} 
notification-error  = ${palette[4]} 
misc 				= ${palette[2]} 
play-button 		= ${palette[8]} 
play-button-active  = ${palette[8]} 
progress-fg 		= ${palette[5]} 
progress-bg 		= ${palette[0]} 
heart 				= ${palette[10]} 
liked-left 			= ${palette[5]} 
liked-right 		= ${palette[7]} 
pagelink-active 	= ${palette[2]}
radio-btn-active 	= ${palette[7]} 
THEME
)"

printf '%s' "$output" > "${dest_dir}/${dest_file}"

spicetify -n apply
