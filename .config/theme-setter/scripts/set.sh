#!/bin/bash
parser="$HOME/.config/theme-setter/scripts/parser.sh"
setters="$HOME/.config/theme-setter/setters"

if [ $($parser --is-valid $1) -eq 1 ]; then
    theme="$1"
else
    echo "$1 is not a supported theme"
    exit 1
fi

if [ "$2" != "light" -a "$2" != "dark" ]; then
    mode="medium"
else
    mode="$2"
fi

$parser --set $theme $mode

nvim=$($parser --nvim)
icons=$($parser --icons)
palette=(
    "$($parser --palette background)"
    "$($parser --palette foreground)"
    "$($parser --palette black)"
    "$($parser --palette white)"
    "$($parser --palette red)"
    "$($parser --palette green)"
    "$($parser --palette yellow)"
    "$($parser --palette blue)"
    "$($parser --palette magenta)"
    "$($parser --palette cyan)"
    "$($parser --palette orange)"
    "$($parser --palette gray)"
    "$($parser --palette backgroundAlt)"
)

{
    $setters/discord.sh "${palette[@]}" &
    $setters/dunst.sh "${palette[@]}" "$icons" &
    $setters/eww.sh "${palette[@]}" &
    $setters/gtk.sh "${palette[@]}" "$icons" "$theme" "$mode" &
    $setters/hypr.sh "${palette[@]}" "$mode" &
    $setters/hyprpaper.sh "$theme" "$mode" &
    $setters/kitty.sh "${palette[@]}" &
    $setters/nvim.sh "$nvim" "$mode" &
    $setters/obsidian.sh "${palette[@]}" &
    $setters/spicetify.sh "${palette[@]}" &
    $setters/tofi.sh "${palette[@]}" &
    $setters/waybar.sh "${palette[@]}" &
} &> /dev/null
