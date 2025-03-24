#!/bin/bash
parser="$HOME/.config/theme-setter/scripts/parser.sh"
wallpapers="$HOME/Dropbox/Pictures/Wallpapers"

theme=$($parser --theme)
mode=$($parser --mode)
tone=$($parser --tone)
current_wallpaper=$($parser --bg)
current_epoch=$($parser --epoch)

wallpaper_ls="ls $wallpapers/$theme"

if [ "$current_wallpaper" != "" ]; then
    wallpaper_ls="$wallpaper_ls -I $current_wallpaper"
fi

new_wallpaper=$($wallpaper_ls | sort -R | tail -1)
new_epoch=$(date +%s)

$parser --set-bg "$new_wallpaper"
$parser --set-epoch "$new_epoch"

rm "$wallpapers/$current_epoch.jpg"

if [ $mode == "dark" ]; then
    fill="25%" 
else
    fill="10%"
fi

magick "$wallpapers/$theme/$new_wallpaper" \
    -fill "#$($parser --palette backgroundAlt)" \
    -colorize $fill \
    -fill "#$($parser --palette orange)" \
    -colorize 10% \
    "$wallpapers/$new_epoch.jpg"

swww img "$wallpapers/$new_epoch.jpg" --transition-type wipe --transition-angle 30 --transition-step 90
