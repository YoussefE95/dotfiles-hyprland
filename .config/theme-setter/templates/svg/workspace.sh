workspace_icon_dir="$HOME/.config/eww/arin/images/icons/workspace/"
focused_file="focused-workspace.svg"
active_file="active-workspace.svg"
inactive_file="inactive-workspace.svg"

[[ -d "$workspace_icon_dir" ]] || mkdir -pv "$workspace_icon_dir"

focused_output="$(cat << THEME
<?xml version="1.0" encoding="utf-8"?>
<!-- Uploaded to SVGRepo https://www.svgrepo.com -->
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	fill="#$(jq -r ".colors.\"$1\".green" "$2")" width="120px" height="120px" viewBox="0 0 120 120" enable-background="new 0 0 120 120" xml:space="preserve">
<circle cx="60" cy="60.834" r="54.167"/>
</svg>
THEME
)"

active_output="$(cat << THEME
<?xml version="1.0" encoding="utf-8"?>
<!-- Uploaded to SVGRepo https://www.svgrepo.com -->
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	fill="#$(jq -r ".colors.\"$1\".blue" "$2")" width="120px" height="120px" viewBox="0 0 120 120" enable-background="new 0 0 120 120" xml:space="preserve">
<circle cx="60" cy="60.834" r="54.167"/>
</svg>
THEME
)"

inactive_output="$(cat << THEME
<?xml version="1.0" encoding="utf-8"?>
<!-- Uploaded to SVGRepo https://www.svgrepo.com -->
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	fill="#$(jq -r ".colors.\"$1\".gray" "$2")" width="120px" height="120px" viewBox="0 0 120 120" enable-background="new 0 0 120 120" xml:space="preserve">
<circle cx="60" cy="60.834" r="54.167"/>
</svg>
THEME
)"

printf '%s' "$focused_output" > "${workspace_icon_dir}${focused_file}"
printf '%s' "$active_output" > "${workspace_icon_dir}${active_file}"
printf '%s' "$inactive_output" > "${workspace_icon_dir}${inactive_file}"