#!/bin/bash
palette=("${@}")
lock="$HOME/.config/hypr/hyprlock.conf"
land="$HOME/.config/hypr/general.conf"

sed -i "s#.*outer_color.*#    outer_color = rgb(${palette[0]})#" "$lock"
sed -i "s#.*inner_color.*#    inner_color = rgb(${palette[1]})#" "$lock"
sed -i "s#.*font_color.*#    font_color = rgb(${palette[2]})#" "$lock"
sed -i "s#.*check_color.*#    check_color = rgb(${palette[6]})#" "$lock"
sed -i "s#.*fail_color.*#    fail_color = rgb(${palette[4]})#" "$lock"

sed -i "s#.*col.active_border.*#    col.active_border=0xff${palette[10]}#" "$land"
sed -i "s#.*col.inactive_border.*#    col.inactive_border=0xff${palette[3]}#" "$land"

if [ "${palette[11]}" == "light" ]; then
    sed -i "s#    active_opacity.*#    active_opacity=.90#" "$land"
    sed -i "s#    inactive_opacity.*#    inactive_opacity=.90#" "$land"
else
    sed -i "s#    active_opacity.*#    active_opacity=.94#" "$land"
    sed -i "s#    inactive_opacity.*#    inactive_opacity=.94#" "$land"
fi
