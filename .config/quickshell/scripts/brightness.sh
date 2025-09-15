#!/bin/bash
if [ "$1" == "--up" ]; then
    brightnessctl -q set 5%+
elif [ "$1" == "--down" ]; then
    brightnessctl -q set 5%-
fi
printf "%02d\n" $(brightnessctl | \
    grep Current | \
    cut -d " " -f 4 | \
    tr -d "()%")
