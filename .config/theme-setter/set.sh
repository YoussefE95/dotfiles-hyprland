info="$HOME/.config/theme-setter/info.json"
rand_wall="$HOME/Dropbox/Pictures/Wallpapers/$1/$(ls ~/Dropbox/Pictures/Wallpapers/$1 | sort -R | tail -1)"
vs_settings="$HOME/.config/Code/User/settings.json"
templates="$HOME/.config/theme-setter/templates"
berry="$HOME/.config/berry/"

sed -i /feh.*/c\\"feh --bg-fill $rand_wall" "$berry/autostart"
feh --bg-fill "$rand_wall"

focus_color="$(jq -r ".colors.\"$1\".magenta" "$info")"
unfocus_color="$(jq -r ".colors.\"$1\".cyan" "$info")"

sed -i /.*" focus_color".*/c\\"berryc focus_color              $focus_color" "$berry/autostart"
sed -i /.*" unfocus_color".*/c\\"berryc unfocus_color            $unfocus_color" "$berry/autostart"
sed -i /.*inner_focus_color.*/c\\"berryc inner_focus_color        $focus_color" "$berry/autostart"
sed -i /.*inner_unfocus_color.*/c\\"berryc inner_unfocus_color      $unfocus_color" "$berry/autostart"
sed -i /.*text_focus_color.*/c\\"berryc text_focus_color         $focus_color" "$berry/autostart"
sed -i /.*text_unfocus_color.*/c\\"berryc text_unfocus_color       $unfocus_color" "$berry/autostart"

berryc focus_color         "$focus_color"
berryc unfocus_color       "$unfocus_color"
berryc inner_focus_color   "$focus_color"
berryc inner_unfocus_color "$unfocus_color"
berryc text_focus_color    "$focus_color"
berryc text_unfocus_color  "$unfocus_color"

$templates/vs_code.sh "$1" "$info" "$vs_settings"

$templates/svg.sh "$1" "$info"
$templates/eww.sh "$1" "$info"

$templates/alacritty.sh "$1" "$info"

$templates/spotify.sh "$1" "$info"
spicetify update -q

$templates/discord.sh "$1" "$info"

$templates/rofi.sh "$1" "$info"

$templates/dunst.sh "$1" "$info"
# killall -q dunst
