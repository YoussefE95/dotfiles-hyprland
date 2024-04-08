#!/bin/bash
palette=("${@}")

dest_dir="$HOME/.config/tofi/"
dest_file="config"

output="$(cat << THEME
width = 100%
height = 100%
border-width = 0
outline-width = 0
padding-left = 35%
padding-top = 35%
result-spacing = 25
num-results = 5
font = hack
prompt-text = "Run: "
text-color = #${palette[1]}
selection-color = #${palette[10]}
background-color = #${palette[0]}E0
THEME
)"

printf '%s' "$output" > "${dest_dir}${dest_file}"
