#!/bin/bash
palette=("${@}")
hypr_conf="$HOME/.config/hypr/hyprland.conf"
hypr_lock="$HOME/.config/hypr/hyprlock.conf"

sed -i "s#.*outer_color.*#    outer_color = rgb(${palette[0]})#" "$hypr_lock"
sed -i "s#.*inner_color.*#    inner_color = rgb(${palette[1]})#" "$hypr_lock"
sed -i "s#.*font_color.*#    font_color = rgb(${palette[2]})#" "$hypr_lock"
sed -i "s#.*check_color.*#    check_color = rgb(${palette[6]})#" "$hypr_lock"
sed -i "s#.*fail_color.*#    fail_color = rgb(${palette[4]})#" "$hypr_lock"

active="col.active_border = rgba(${palette[7]}ee) rgba(${palette[9]}ee) 45deg"
inactive="col.inactive_border = rgba(${palette[3]}aa)"

sed -i "s/.*col.active_border.*/    $active/" $hypr_conf
sed -i "s/.*col.inactive_border.*/    $inactive/" $hypr_conf

hyprctl setcursor "${palette[11]}" 22
