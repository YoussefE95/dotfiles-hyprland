#!/bin/bash
b=$(brightnessctl | grep "Current brightness:" | cut -d " " -f 4 | tr -d "()%")

if [ "$1" == "--up" ]; then
    brightnessctl -q set 5%+
elif [ "$1" == "--down" ]; then
    brightnessctl -q set 5%-
fi

eww update bri="{ \"icn\": \"󰃞\", \"txt\": \"$(printf "%02d\n" $b)\" }"
