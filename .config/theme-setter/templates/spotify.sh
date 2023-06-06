palette=("${@}")

dest_dir="$HOME/.config/spicetify/Themes/Default/"
dest_file="color.ini"

[[ -d "$dest_dir" ]] || mkdir -pv "$dest_dir"

output="$(cat << THEME
[Ocean]
text               = ${palette[1]}
subtext            = ${palette[1]}
main               = ${palette[0]}
sidebar            = ${palette[0]}
player             = ${palette[0]}
card               = ${palette[0]}
shadow             = ${palette[0]}
selected-row       = ${palette[1]}
button             = ${palette[4]}
button-active      = ${palette[4]}
button-disabled    = ${palette[2]}
tab-active         = ${palette[2]}
notification       = ${palette[9]}
notification-error = ${palette[6]}
misc               = ${palette[0]}
THEME
)"

printf '%s' "$output" > "${dest_dir}${dest_file}"

spicetify update -q