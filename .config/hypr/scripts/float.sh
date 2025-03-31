#!/bin/bash
size="1180 850"

# if hyprctl activewindow | grep "class: kitty"; then
#     size="1180 850"
# fi

hyprctl dispatch togglefloating

if hyprctl activewindow | grep "floating: 1"; then
    hyprctl dispatch resizeactive exact $size
    hyprctl dispatch centerwindow
fi
