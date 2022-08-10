info="$HOME/.config/theme-setter/info.json"
tmp="$HOME/.config/theme-setter/temp-info.json"
templates="$HOME/.config/theme-setter/templates"
vs_settings="$HOME/.config/Code/User/settings.json"
awesome="$HOME/.config/awesome"

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

$templates/awesome.sh "$theme" "$info"

sed -i /theme.wallpaper.*/c\\"theme.wallpaper = '$rand_wall'" "$awesome/theme.lua"

sed -i /gtk-theme-name.*/c\\"gtk-theme-name=$theme" "$HOME/.config/gtk-3.0/settings.ini"
sed -i /gtk-cursor-theme-name.*/c\\"gtk-cursor-theme-name=cursors-$theme" "$HOME/.config/gtk-3.0/settings.ini"

sed -i /Net/c\\"Net/ThemeName \"$theme\"" "$HOME/.config/xsettingsd/xsettingsd.conf"
sed -i /CursorThemeName/c\\"Gtk/CursorThemeName \"cursors-$theme\"" "$HOME/.config/xsettingsd/xsettingsd.conf"
xsettingsd &

echo 'awesome.restart()' | awesome-client

$templates/vs_code.sh "$theme" "$info" "$vs_settings"
$templates/alacritty.sh "$theme" "$info"

$templates/discord.sh "$theme" "$info"
$templates/spotify.sh "$theme" "$info"
spicetify update -q

jq --arg t "$1" '.current.theme = $t' $info > "$tmp" && mv "$tmp" $info
jq --arg m "$2" '.current.mode = $m' $info > "$tmp" && mv "$tmp" $info