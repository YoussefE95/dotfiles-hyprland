info="$HOME/.config/theme-setter/info.json"
vs_settings="$HOME/.config/Code/User/settings.json"
templates="$HOME/.config/theme-setter/templates"
bspwm="$HOME/.config/bspwm/"

# set wallpaper path and theme name according to given theme
if [[ "$2" == "light" ]]; then
    rand_wall="$HOME/Dropbox/Pictures/Wallpapers/$1/light/$(ls ~/Dropbox/Pictures/Wallpapers/$1/light | sort -R | tail -1)"
    theme="$1-light"
elif [[ "$2" == "dark" ]]; then
    rand_wall="$HOME/Dropbox/Pictures/Wallpapers/$1/dark/$(ls ~/Dropbox/Pictures/Wallpapers/$1/dark | sort -R | tail -1)"
    theme="$1"
else
    rand_wall="$HOME/Dropbox/Pictures/Wallpapers/$1/normal/$(ls ~/Dropbox/Pictures/Wallpapers/$1/normal | sort -R | tail -1)"
    theme="$1"
fi

# wallpaper
sed -i /feh.*/c\\"feh --bg-fill $rand_wall" "$bspwm/bspwmrc"
feh --bg-fill "$rand_wall"

# focus and unfocus colors for bspwm
focus_color="$(jq -r ".colors.\"$theme\".green" "$info")"
unfocus_color="$(jq -r ".colors.\"$theme\".gray" "$info")"

sed -i /.*" focused_border".*/c\\"bspc config focused_border_color        '#$focus_color'" "$bspwm/bspwmrc"
sed -i /.*" normal_border".*/c\\"bspc config normal_border_color         '#$unfocus_color'" "$bspwm/bspwmrc"
sed -i /.*" active_border".*/c\\"bspc config active_border_color         '#$focus_color'" "$bspwm/bspwmrc"

bspc config focused_border_color        "#$focus_color"
bspc config normal_border_color         "#$unfocus_color"
bspc config active_border_color         "#$unfocus_color"

# gtk apps
sed -i /gtk-theme-name.*/c\\"gtk-theme-name=$theme" "$HOME/.config/gtk-3.0/settings.ini"

# system tray (stalonetray)
sed -i /background.*/c\\"background \"#$(jq -r ".colors.\"$theme\".background" "$info")\"" "$HOME/.stalonetrayrc"

$templates/vs_code.sh "$theme" "$info" "$vs_settings"

$templates/alacritty.sh "$theme" "$info"

# eww and the svg icons it uses
$templates/svg/battery.sh "$theme" "$info"
$templates/svg/dashboard.sh "$theme" "$info"
$templates/svg/internet.sh "$theme" "$info"
$templates/svg/music.sh "$theme" "$info"
$templates/svg/volume.sh "$theme" "$info"
$templates/svg/workspace.sh "$theme" "$info"

$templates/eww.sh "$theme" "$info"

$templates/spotify.sh "$theme" "$info"
spicetify update -q

$templates/discord.sh "$theme" "$info"

$templates/rofi.sh "$theme" "$info"

$templates/dunst.sh "$theme" "$info"
killall -q dunst
notify-send "Successfully set $theme"

killall stalonetray
stalonetray &