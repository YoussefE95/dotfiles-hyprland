#!/bin/bash
is_connected=$(nmcli g | grep 'connected' | cut -d ' ' -f 1)
wifi_name=$(nmcli c | grep wlan0 | cut -d ' ' -f 1)

if [ "$is_connected" != "connected" ]; then
    icn="󰈂"
    txt="Disconnected"
else
    if [ "$wifi_name" == "" ]; then
        icn=""
        txt="Ethernet"
    else
        icn="󰖩"
        txt="$wifi_name"
    fi
fi

echo "{ \"icn\": \"$icn\", \"txt\": \"$txt\" }"
