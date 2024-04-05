dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &
/usr/lib/polkit-kde-authentication-agent-1 &
xwaylandvideobridge &
dunst &
hyprpaper &
set-theme $(get-theme) $(get-theme --mode) &
