palette=("${@}")
lock="$HOME/.config/hypr/hyprlock.conf"
paper="$HOME/.config/hypr/hyprpaper.conf"

sed -i "s#.*outer_color.*#    outer_color = rgb(${palette[0]})#" "$lock"
sed -i "s#.*inner_color.*#    inner_color = rgb(${palette[12]})#" "$lock"
sed -i "s#.*font_color.*#    font_color = rgb(${palette[1]})#" "$lock"
sed -i "s#.*check_color.*#    check_color = rgb(${palette[6]})#" "$lock"
sed -i "s#.*fail_color.*#    fail_color = rgb(${palette[4]})#" "$lock"

hyprctl hyprpaper unload all
killall hyprpaper

sed -i "s#.*preload.*#preload = ${palette[14]}#" "$paper"
sed -i "s#.*wallpaper.*#wallpaper = eDP-1,${palette[14]}#" "$paper"
hyprpaper &

hyprctl keyword general:col.active_border "0xff${palette[6]}"
hyprctl keyword general:col.inactive_border "0xff${palette[11]}"

if [[ "${palette[13]}" == "light" ]]; then
    hyprctl keyword decoration:active_opacity .88
    hyprctl keyword decoration:inactive_opacity .88
else
    hyprctl keyword decoration:active_opacity .94
    hyprctl keyword decoration:inactive_opacity .94
fi
