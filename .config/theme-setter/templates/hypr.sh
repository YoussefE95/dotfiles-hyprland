palette=("${@}")

hyprctl keyword general:col.active_border "0xff${palette[5]}"
hyprctl keyword general:col.inactive_border "0xff${palette[11]}"
hyprctl setcursor "${palette[12]}" 24

swww img --transition-type wipe --transition-angle 30 --transition-step 60 "${palette[13]}"

