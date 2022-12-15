#!/usr/bin/env bash

# Launch Rofi
MENU="$(rofi -no-config -no-lazy-grab -sep "|" -dmenu -i -p '' -theme ~/.config/rofi/styles.rasi \
<<< "Catppuccin|Gruvbox|Nord")"
            case "$MENU" in
				*Catppuccin) set-theme catppuccin "$(get-theme --mode)" ;;
				*Gruvbox) set-theme gruvbox "$(get-theme --mode)" ;;
				*Nord) set-theme nord "$(get-theme --mode)" ;;
            esac
