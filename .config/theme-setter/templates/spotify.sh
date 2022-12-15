dest_dir="$HOME/.config/spicetify/Themes/Default/"
dest_file="color.ini"

[[ -d "$dest_dir" ]] || mkdir -pv "$dest_dir"

output="$(cat << THEME
[Ocean]
text               = $(jq -r ".colors.\"$1\".foreground" "$2")
subtext            = $(jq -r ".colors.\"$1\".foreground" "$2")
main               = $(jq -r ".colors.\"$1\".background" "$2")
sidebar            = $(jq -r ".colors.\"$1\".background" "$2")
player             = $(jq -r ".colors.\"$1\".background" "$2")
card               = $(jq -r ".colors.\"$1\".background" "$2")
shadow             = $(jq -r ".colors.\"$1\".background" "$2")
selected-row       = $(jq -r ".colors.\"$1\".foreground" "$2")
button             = $(jq -r ".colors.\"$1\".red" "$2")
button-active      = $(jq -r ".colors.\"$1\".red" "$2")
button-disabled    = $(jq -r ".colors.\"$1\".black" "$2")
tab-active         = $(jq -r ".colors.\"$1\".black" "$2")
notification       = $(jq -r ".colors.\"$1\".cyan" "$2")
notification-error = $(jq -r ".colors.\"$1\".yellow" "$2")
misc               = $(jq -r ".colors.\"$1\".background" "$2")
THEME
)"

printf '%s' "$output" > "${dest_dir}${dest_file}"

spicetify update -q