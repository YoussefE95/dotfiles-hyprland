#!/bin/bash
v=$(pactl get-sink-volume @DEFAULT_SINK@ | grep "%" | awk '{print $5}' | tr "%" "\n")

if [ "$1" == "--up" ]; then
    wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+    
elif [ "$1" == "--down" ]; then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- 
fi

eww update vol="{ \"icn\": \"\", \"txt\": \"$(printf "%02d\n" $v)\" }"
