#!/bin/bash
palette=("${@}")

dest_dir="$HOME/.local/share/themes/${palette[13]}/gtk-2.0"
dest_file="gtkrc"

output="$(cat << THEME
# Based on Bridge by ScionicSpectre and Adwaita by GNOME
# vim:set ts=2 sw=2 sts=2 ai et:
#
# This is the GTK 2 version of Gruvbox-Material-Dark-HIDPI. It's whole purpose is to look as the
# GTK 3 version as much as possible until GTK 2 dies completely.
#
# Note: comments for explaining styles are on the bottom of each file beside the
# widget matches.

# Declare the colours used throughout the theme.
# There shouldn't be any fiddling with them in the theme files themselves in
# order to not mess up the dark theme.

# Text/base
gtk-color-scheme = "base_color:#${palette[0]}"
gtk-color-scheme = "text_color:#${palette[2]}"
# Foreground/background
gtk-color-scheme = "bg_color:#${palette[0]}"
gtk-color-scheme = "fg_color:#${palette[2]}"
# Selected foreground/background
gtk-color-scheme = "selected_bg_color:#${palette[7]}"
gtk-color-scheme = "selected_fg_color:#${palette[2]}"
# Titlebar foreground/background
gtk-color-scheme = "titlebar_bg_color:#${palette[0]}"
gtk-color-scheme = "titlebar_fg_color:#${palette[2]}"
# Menus
gtk-color-scheme = "menu_color:#${palette[0]}"
# Tooltips foreground/background
gtk-color-scheme = "tooltip_bg_color:#${palette[0]}"
gtk-color-scheme = "tooltip_fg_color:#${palette[2]}"
# Links
gtk-color-scheme = "link_color:#${palette[7]}"
gtk-color-scheme = "visited_link_color:#${palette[8]}"

# Set GTK settings
gtk-auto-mnemonics              = 1
gtk-primary-button-warps-slider = 1

# And hand over the control to the theme files
include "main.rc"
include "apps.rc"
include "hacks.rc"
THEME
)"

printf '%s' "$output" > "${dest_dir}/${dest_file}"

