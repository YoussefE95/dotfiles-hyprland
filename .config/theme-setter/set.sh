info="$HOME/.config/theme-setter/info.json"
tmp="$HOME/.config/theme-setter/temp-info.json"
templates="$HOME/.config/theme-setter/templates"
vs_settings="$HOME/.config/Code/User/settings.json"

if [[ "$2" == "light" ]]; then
    rand_wall="$HOME/Dropbox/Pictures/Wallpapers/$1/light/$(ls ~/Dropbox/Pictures/Wallpapers/$1/light | sort -R | tail -1)"
    theme="$1-light"
elif [[ "$2" == "dark" ]]; then
    rand_wall="$HOME/Dropbox/Pictures/Wallpapers/$1/dark/$(ls ~/Dropbox/Pictures/Wallpapers/$1/dark | sort -R | tail -1)"
    theme="$1-dark"
else
    rand_wall="$HOME/Dropbox/Pictures/Wallpapers/$1/normal/$(ls ~/Dropbox/Pictures/Wallpapers/$1/normal | sort -R | tail -1)"
    theme="$1"
fi

jq --arg t "$1" '.current.theme = $t' $info > "$tmp" && mv "$tmp" $info
jq --arg m "$2" '.current.mode = $m' $info > "$tmp" && mv "$tmp" $info
jq --arg w "$rand_wall" '.current.wallpaper = $w' $info > "$tmp" && mv "$tmp" $info

swww img $(get-theme --wallpaper) --transition-type 'wipe' --transition-angle 30 --transition-pos 'top-right'

$templates/kitty.sh "$theme" "$info"
$templates/hyprland.sh "$theme" "$info"
$templates/vs_code.sh "$theme" "$info" "$vs_settings"
$templates/waybar.sh "$theme" "$info"
$templates/obsidian.sh "$theme" "$info"
$templates/gtk.sh "$theme" "$info"
$templates/rofi.sh "$theme" "$info"
$templates/discord.sh "$theme" "$info"
$templates/spotify.sh "$theme" "$info"

clear