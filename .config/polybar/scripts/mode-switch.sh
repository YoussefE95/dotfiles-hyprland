#!/usr/bin/env bash

# Launch Rofi
MENU="$(rofi -no-config -no-lazy-grab -sep "|" -dmenu -i -p '' -theme ~/.config/rofi/styles.rasi \
<<< "Dark|Normal|Light")"
            case "$MENU" in
                *Dark) set-theme "$(get-theme --theme)" dark ;;
				*Normal) set-theme "$(get-theme --theme)" ;;
				*Light) set-theme "$(get-theme --theme)" light ;;
            esac
