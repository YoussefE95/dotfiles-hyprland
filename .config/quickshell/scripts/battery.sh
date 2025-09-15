#!/bin/bash
bat=$(ls /sys/class/power_supply | grep BAT | head -n 1)
status=$(cat /sys/class/power_supply/$bat/status)
capacity=$(cat /sys/class/power_supply/$bat/capacity)

if [ "$status" == "Discharging" ]; then
    if [ "$capacity" -gt 89 ]; then
        icn="󰂂"
    elif [ "$capacity" -gt 79 ]; then
        icn="󰂁"
    elif [ "$capacity" -gt 69 ]; then
        icn="󰂀"
    elif [ "$capacity" -gt 59 ]; then
        icn="󰁿"
    elif [ "$capacity" -gt 49 ]; then
        icn="󰁾"
    elif [ "$capacity" -gt 39 ]; then
        icn="󰁽"
    elif [ "$capacity" -gt 29 ]; then
        icn="󰁼"
    elif [ "$capacity" -gt 19 ]; then
        icn="󰁻"
    else
        icn="󰂃"
    fi
else
    icn="󰂄"
fi

echo "$icn $(printf "%02d\n" $capacity)"
