#!/bin/bash
date=$(date +'%B %d')
time=$(date +'%I:%M')
fuzzy=$($HOME/.config/hypr/scripts/clock-fuzzy.sh)

echo "{ \"date\": \"$date\", \"time\": \"$time\", \"fuzzy\": \"$fuzzy\" }"
