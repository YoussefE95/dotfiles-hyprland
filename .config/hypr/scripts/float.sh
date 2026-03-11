#!/bin/bash

if [ "$1" == "--toggle" ]; then
    disp="togglefloating"
elif [ "$1" == "--focus" ]; then
    disp="focuswindow"
    if [ "$(hyprctl activewindow -j | jq ."floating")" == "true" ]; then
        disp="$disp tiled"
    else
        disp="$disp floating"
    fi

fi

hyprctl dispatch $disp 
