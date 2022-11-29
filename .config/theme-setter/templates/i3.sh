dest_dir="$HOME/.config/i3/"
dest_file="colors.conf"

[[ -d "$dest_dir" ]] || mkdir -pv "$dest_dir"

output="$(cat << THEME
# class                 border  backgr. text    indicator child_border
client.focused          #$(jq -r ".colors.\"$1\".green" "$2") #$(jq -r ".colors.\"$1\".background" "$2") #$(jq -r ".colors.\"$1\".foreground" "$2") #$(jq -r ".colors.\"$1\".blue" "$2")   #$(jq -r ".colors.\"$1\".green" "$2")
client.focused_inactive #$(jq -r ".colors.\"$1\".background" "$2") #$(jq -r ".colors.\"$1\".background" "$2") #$(jq -r ".colors.\"$1\".foreground" "$2") #$(jq -r ".colors.\"$1\".blue" "$2")   #$(jq -r ".colors.\"$1\".background" "$2")
client.unfocused        #$(jq -r ".colors.\"$1\".background" "$2") #$(jq -r ".colors.\"$1\".background" "$2") #$(jq -r ".colors.\"$1\".foreground" "$2") #$(jq -r ".colors.\"$1\".blue" "$2")   #$(jq -r ".colors.\"$1\".background" "$2")
client.urgent           #$(jq -r ".colors.\"$1\".background" "$2") #$(jq -r ".colors.\"$1\".background" "$2") #$(jq -r ".colors.\"$1\".foreground" "$2") #$(jq -r ".colors.\"$1\".blue" "$2")   #$(jq -r ".colors.\"$1\".background" "$2")
client.placeholder      #$(jq -r ".colors.\"$1\".background" "$2") #$(jq -r ".colors.\"$1\".background" "$2") #$(jq -r ".colors.\"$1\".foreground" "$2") #$(jq -r ".colors.\"$1\".blue" "$2")   #$(jq -r ".colors.\"$1\".background" "$2")

client.background       #$(jq -r ".colors.\"$1\".background" "$2")
THEME
)"

printf '%s' "$output" > "${dest_dir}${dest_file}"