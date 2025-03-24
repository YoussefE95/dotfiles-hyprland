#!/bin/bash
palette=("${@}")

dest_dir="$HOME/.config/fuzzel/"
dest_file="fuzzel.ini"

output="$(cat << THEME
font=JetBrains Mono SemiBold:size=10
icons-enabled=yes
launch-prefix=uwsm app --
prompt=">> "

anchor=center
x-margin=0
y-margin=0
lines=10
width=30

[colors]
background=${palette[0]}ff
text=${palette[2]}ff
prompt=${palette[3]}ff
placeholder=${palette[3]}ff
input=${palette[2]}ff
match=${palette[10]}ff
selection=${palette[7]}88
selection-text=${palette[2]}ff
selection-match=${palette[10]}ff
counter=93a1a1ff
border=002b36ff
THEME
)"

printf '%s' "$output" > "${dest_dir}${dest_file}"
