#!/bin/bash

if [ "$(niri msg version)" != "" ]; then
    niri msg action quit -s
elif [ "$(hyprctl version)" != "" ]; then
    hyprctl dispatch exit
fi
