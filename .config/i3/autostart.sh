feh --bg-fill $(get-theme --wallpaper)
sh ~/.config/polybar/launch.sh &
picom --config ~/.config/picom.conf
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
dropbox &