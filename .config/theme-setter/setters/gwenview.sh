#!/bin/bash
palette=("${@}")

dest_dir="$HOME/.config/"
dest_file="gwenviewrc"

output="$(cat << THEME
[Colors:View]
BackgroundAlternate=#${palette[0]}
BackgroundNormal=#${palette[0]}
DecorationFocus=#${palette[1]}
ForegroundActive=#${palette[2]}
ForegroundInactive=#${palette[2]}
ForegroundLink=#${palette[2]}
ForegroundNegative=#${palette[2]}
ForegroundNeutral=#${palette[2]}
ForegroundNormal=#${palette[2]}
ForegroundPositive=#${palette[2]}
ForegroundVisited=#${palette[2]}

[General]
LastUsedVersion=210800
SideBarPage=operations

[Recent Files]
File1[$e]=$HOME/Screenshots/2025-10-23 22-09-58.png
Name1[$e]=2025-10-23 22-09-58.png

[SideBar]
InformationSplitterSizes=229,246
SideBarSplitterSizes=248,676

[UiSettings]
ColorScheme=Dynamic-Theme
THEME
)"

printf '%s' "$output" > "${dest_dir}${dest_file}"
