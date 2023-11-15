palette=("${@}")

dest_dir="$HOME/.config/spicetify/Themes/Comfy"
dest_file="color.ini"

output="$(cat << THEME
[dynamic]
text 				= ${palette[1]}
subtext 			= ${palette[1]}
main 				= ${palette[12]}
main-transition 	= ${palette[12]}
highlight           = ${palette[0]}
highlight-elevated  = ${palette[11]}
sidebar 			= ${palette[0]}
player				= ${palette[0]}
card 				= ${palette[0]}
shadow 				= ${palette[2]}
selected-row 		= ${palette[11]} 
button 				= ${palette[7]} 
button-active 		= ${palette[7]} 
button-disabled 	= ${palette[11]} 
tab-active 			= ${palette[8]} 
notification 		= ${palette[7]} 
notification-error  = ${palette[4]} 
misc 				= ${palette[1]} 
play-button 		= ${palette[8]} 
play-button-active  = ${palette[8]} 
progress-fg 		= ${palette[5]} 
progress-bg 		= ${palette[0]} 
heart 				= ${palette[10]} 
liked-left 			= ${palette[5]} 
liked-right 		= ${palette[7]} 
pagelink-active 	= ${palette[3]} 
radio-btn-active 	= ${palette[7]} 
THEME
)"

printf '%s' "$output" > "${dest_dir}/${dest_file}"

spicetify apply
