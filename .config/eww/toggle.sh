FILE="$HOME/.cache/eww_launch.dashboard"

if [[ ! -f "$FILE" ]]; then
	touch "$FILE"
    eww open theme-set
else
    eww close theme-set
	rm "$FILE"
fi