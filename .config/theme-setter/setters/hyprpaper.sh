#!/bin/bash
paper="$HOME/.config/hypr/hyprpaper.conf"

hyprctl hyprpaper unload all
killall hyprpaper

if [ $# -eq 2 ]; then
    wallpapers="$HOME/Dropbox/Pictures/Wallpapers/$1/$2"
    random=$(ls $wallpapers | sort -R | tail -1)
    bg="$wallpapers/$random"
else
    bg="$1"
fi

sed -i "s#.*preload.*#preload = $bg#" "$paper"
sed -i "s#.*eDP-1.*#wallpaper = eDP-1,$bg#" "$paper"

hyprpaper &
