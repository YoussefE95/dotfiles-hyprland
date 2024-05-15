#!/bin/bash

hours=("One" "Two" "Three" "Four" "Five" "Six"
"Seven" "Eight" "Nine" "Ten" "Eleven" "Twelve")

declare -A minutes
minutes[5]="Five"
minutes[10]="Ten"
minutes[15]="Quarter"
minutes[20]="Twenty"
minutes[25]="Twenty-Five"
minutes[30]="Half"

full="$(date +"%I"):$(date +"%M") $(date +"%p")"
hr=$(($(date +"%_I") - 1))
mn=$(date +"%_M")
md=$(($(date +"%_M")%5))

if [ $md -gt 2 ]; then
    mn=$(($mn + (5 - $md)))
else
    mn=$(($mn - $md))
fi

if [ $mn -eq 0 ]; then
    bgn=${hours[hr]}
    mid="O' clock"
    end=""
elif [ $mn -gt 0 -a $mn -le 30 ]; then
    bgn=${minutes[$mn]}
    mid="past"
    end=${hours[hr]}
elif [ $mn -gt 30 -a $mn -lt 60 ]; then
    bgn=${minutes[$((60 - $mn))]}
    mid="to"
    end=${hours[$(($hr + 1))]}

    if [ $hr -eq 11 ]; then
        end=${hours[0]}
    fi
elif [ $mn -eq 60 ]; then
    bgn=${hours[$(($hr + 1))]}
    mid="O' clock"
    end=""

    if [ $hr -eq 11 ]; then
        bgn=${hours[0]}
    fi
fi

echo ${bgn} ${mid} ${end}
