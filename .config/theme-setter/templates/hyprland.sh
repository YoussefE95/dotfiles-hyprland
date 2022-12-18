hyprctl keyword general:col.active_border "0xff$(jq -r ".colors.\"$1\".green" "$2")"
hyprctl keyword general:col.inactive_border "0xff$(jq -r ".colors.\"$1\".gray" "$2")"