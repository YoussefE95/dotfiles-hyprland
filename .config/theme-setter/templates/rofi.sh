# Idea from: https://github.com/dylanaraps/pywal/issues/264

dest_dir="$HOME/.config/rofi/"
dest_file="colors.rasi"

[[ -d "$dest_dir" ]] || mkdir -pv "$dest_dir"

output="$(cat << THEME
/*******************************************************
 * ROFI Arch Dark Transparent colors for EndeavourOS
 * Maintainer: joekamprad <joekamprad@endeavouros.com>
 *******************************************************/
* {
    selected-normal-foreground:  #$(jq -r ".colors.\"$1\".foreground" "$2");
    foreground:                  #$(jq -r ".colors.\"$1\".foreground" "$2");
    normal-foreground:           @foreground;
    alternate-normal-background: rgba ( 45, 48, 59, 1 % );
    red:                         rgba ( 220, 50, 47, 100 % );
    selected-urgent-foreground:  rgba ( 249, 249, 249, 100 % );
    blue:                        rgba ( 38, 139, 210, 100 % );
    urgent-foreground:           rgba ( 204, 102, 102, 100 % );
    alternate-urgent-background: rgba ( 75, 81, 96, 90 % );
    active-foreground:           rgba ( 101, 172, 255, 100 % );
    lightbg:                     rgba ( 238, 232, 213, 100 % );
    selected-active-foreground:  rgba ( 249, 249, 249, 100 % );
    alternate-active-background: #$(jq -r ".colors.\"$1\".background" "$2");
    background:                  #$(jq -r ".colors.\"$1\".background" "$2");
    alternate-normal-foreground: @foreground;
    normal-background:           rgba ( 45, 48, 59, 1 % );
    lightfg:                     rgba ( 88, 104, 117, 100 % );
    selected-normal-background:  #$(jq -r ".colors.\"$1\".gray" "$2");
    border-color:                rgba ( 124, 131, 137, 100 % );
    spacing:                     2;
    separatorcolor:              rgba ( 45, 48, 59, 1 % );
    urgent-background:           rgba ( 45, 48, 59, 15 % );
    selected-urgent-background:  rgba ( 165, 66, 66, 100 % );
    alternate-urgent-foreground: @urgent-foreground;
    background-color:            rgba ( 0, 0, 0, 0 % );
    alternate-active-foreground: @active-foreground;
    active-background:           rgba ( 29, 31, 33, 17 % );
    selected-active-background:  rgba ( 26, 28, 35, 100 % );
}

THEME
)"

printf '%s' "$output" > "${dest_dir}${dest_file}"