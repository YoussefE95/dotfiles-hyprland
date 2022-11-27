feh --bg-fill $(get-theme --wallpaper)
sh ~/.config/polybar/launch.sh &
picom --config ~/.config/picom.conf
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
dropbox &
~/.config/xborder/xborders --border-radius 14 --border-rgba $(jq -r ".colors.$(get-theme --theme).green" ~/.config/theme-setter/info.json)FF
