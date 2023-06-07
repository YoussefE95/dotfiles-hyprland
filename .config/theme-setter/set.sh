#!/bin/bash

base_dir="$HOME/.config/theme-setter"
templates="$base_dir/templates"
theme_info="$base_dir/info/themes.json"
current_info="$base_dir/info/current.json"
tmp_info="$base_dir/info/tmp.json"

if [[ "$1" == "catppuccin" || "$1" == "gruvbox" || "$1" == "rose-pine" ]]; then
    theme="$1"
else
    echo "$1 is not a supported theme"
    exit 1
fi

if [[ "$2" != "light" && "$2" != "dark" ]]; then
    mode="normal"
else
    mode="$2"
fi

theme_wallpapers="$HOME/Dropbox/Pictures/Wallpapers/$theme/$mode"
random_wallpaper="$theme_wallpapers/$(ls $theme_wallpapers | sort -R | tail -1)"

jq --arg t "$theme" '.theme = $t' $current_info > "$tmp_info" && mv "$tmp_info" $current_info
jq --arg m "$mode" '.mode = $m' $current_info > "$tmp_info" && mv "$tmp_info" $current_info
jq --arg w "$random_wallpaper" '.wallpaper = $w' $current_info > "$tmp_info" && mv "$tmp_info" $current_info

icon_theme=$(jq ".\"$theme\".icons.\"$mode\"" "$theme_info" | sed 's/\"//g')
cursor_theme=$(jq ".\"$theme\".cursors.\"$mode\"" "$theme_info" | sed 's/\"//g')
gtk_theme=$(jq ".\"$theme\".gtk.\"$mode\"" "$theme_info" | sed 's/\"//g')
vs_theme=$(jq ".\"$theme\".vs_code.\"$mode\"" "$theme_info")
palette=(
    "$(jq ".\"$theme\".palette.\"$mode\".background" "$theme_info" | sed 's/\"//g')"
    "$(jq ".\"$theme\".palette.\"$mode\".foreground" "$theme_info" | sed 's/\"//g')"
    "$(jq ".\"$theme\".palette.\"$mode\".black" "$theme_info" | sed 's/\"//g')"
    "$(jq ".\"$theme\".palette.\"$mode\".white" "$theme_info" | sed 's/\"//g')"
    "$(jq ".\"$theme\".palette.\"$mode\".red" "$theme_info" | sed 's/\"//g')"
    "$(jq ".\"$theme\".palette.\"$mode\".green" "$theme_info" | sed 's/\"//g')"
    "$(jq ".\"$theme\".palette.\"$mode\".yellow" "$theme_info" | sed 's/\"//g')"
    "$(jq ".\"$theme\".palette.\"$mode\".blue" "$theme_info" | sed 's/\"//g')"
    "$(jq ".\"$theme\".palette.\"$mode\".magenta" "$theme_info" | sed 's/\"//g')"
    "$(jq ".\"$theme\".palette.\"$mode\".cyan" "$theme_info" | sed 's/\"//g')"
    "$(jq ".\"$theme\".palette.\"$mode\".orange" "$theme_info" | sed 's/\"//g')"
    "$(jq ".\"$theme\".palette.\"$mode\".gray" "$theme_info" | sed 's/\"//g')"
)

{
    $templates/alacritty.sh "${palette[@]}"
    $templates/discord.sh "${palette[@]}"
    $templates/dmenu.sh "${palette[@]}"
    $templates/gtk.sh "$icon_theme" "$cursor_theme" "$gtk_theme"
    $templates/hypr.sh "${palette[@]}" "$random_wallpaper"
    $templates/spotify.sh "${palette[@]}"
    $templates/waybar.sh "${palette[@]}"
} &> /dev/null
