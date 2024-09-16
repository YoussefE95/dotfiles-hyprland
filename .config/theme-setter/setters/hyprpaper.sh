#!/bin/bash
parser="$HOME/.config/theme-setter/scripts/parser.sh"
wallpapers="$HOME/Dropbox/Pictures/Wallpapers"

mode=$($parser --mode)
tone=$($parser --tone)

current_wallpaper=$($parser --bg)

if [ "$current_wallpaper" != "" ]; then
    available="ls $wallpapers -I $current_wallpaper -I '$wallpapers/current'"
    rm "$wallpapers/current/$current_wallpaper"
else
    available="ls $wallpapers -I '$wallpapers/current'"
fi

new_wallpaper=$($available | sort -R | tail -1)
$parser --set-bg $new_wallpaper

if [ $mode == "dark" ]; then
    if [ $tone == "hard" ]; then
        fill="45%"
    else
        fill="25%"
    fi
else
    fill="10%"
fi

magick "$wallpapers/$new_wallpaper" \
    -fill "#$($parser --palette backgroundAlt)" \
    -colorize $fill \
    -fill "#$($parser --palette orange)" \
    -colorize 10% \
    "$wallpapers/current/$new_wallpaper"

swww img --transition-type wipe --transition-angle 30 --transition-step 60 \
   "$wallpapers/current/$new_wallpaper" 
