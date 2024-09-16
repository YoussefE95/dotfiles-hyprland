#!/bin/bash
parser="$HOME/.config/theme-setter/scripts/parser.sh"
setters="$HOME/.config/theme-setter/setters"

if [ "$1" == "dark" ] || [ "$1" == "light" ]; then
    mode="$1"
else
    exit 1
fi

if [ "$2" == "soft" ] || [ "$2" == "hard" ]; then
    tone="$2"
else
    tone="medium"
fi

$parser --set $mode $tone

icons=$($parser --icons)
cursors=$($parser --cursors)
palette=(
    "$($parser --palette background)"
    "$($parser --palette backgroundAlt)"
    "$($parser --palette foreground)"
    "$($parser --palette gray)"
    "$($parser --palette red)"
    "$($parser --palette green)"
    "$($parser --palette yellow)"
    "$($parser --palette blue)"
    "$($parser --palette magenta)"
    "$($parser --palette cyan)"
    "$($parser --palette orange)"
)

{
    $setters/code.sh $mode $tone &
    $setters/discord.sh ${palette[@]} &
    $setters/dunst.sh "${palette[@]}" "$icons" &
    $setters/eww.sh "${palette[@]}" &
    $setters/gtk.sh "${palette[@]}" "$mode" "$tone" &
    $setters/hypr.sh "${palette[@]}" "$mode" &
    $setters/hyprpaper.sh &
    $setters/kitty.sh ${palette[@]} &
    $setters/nvim.sh $mode $tone &
    $setters/obsidian.sh ${palette[@]} &
    $setters/spicetify.sh ${palette[@]} &
    $setters/tofi.sh "${palette[@]}" &
    $setters/zathura.sh ${palette[@]} &
} &> /dev/null
