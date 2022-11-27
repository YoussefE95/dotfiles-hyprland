dest_dir="$HOME/.config/polybar/"
dest_file="colors.ini"

[[ -d "$dest_dir" ]] || mkdir -pv "$dest_dir"

output="$(cat << THEME
;; ┌────────────────────────────────────────────────────────────┐
;; │░█▀█░█▀█░█░░░█░█░█▀▄░█▀█░█▀▄░░░░░░░░░█▀▀░█▀█░█░░░█▀█░█▀▄░█▀▀│
;; │░█▀▀░█░█░█░░░░█░░█▀▄░█▀█░█▀▄░░░░▀░░░░█░░░█░█░█░░░█░█░█▀▄░▀▀█│
;; │░▀░░░▀▀▀░▀▀▀░░▀░░▀▀░░▀░▀░▀░▀░░░░▀░░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀│
;; │░Created░By░Aditya░Shakya░@adi1090x░░░░░░░░░░░░░░░░░░░░░░░░░│
;; └────────────────────────────────────────────────────────────┘

;; _-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

[color]

;; Use pywal.sh in scripts directory to use colors from an image/wallpaper.

;; main colors
background = #$(jq -r ".colors.\"$1\".background" "$2")
foreground = #$(jq -r ".colors.\"$1\".foreground" "$2")
sep = #$(jq -r ".colors.\"$1\".gray" "$2")

white = #$(jq -r ".colors.\"$1\".white" "$2")
black = #$(jq -r ".colors.\"$1\".black" "$2")
red = #$(jq -r ".colors.\"$1\".red" "$2")
magenta = #$(jq -r ".colors.\"$1\".magenta" "$2")
blue = #$(jq -r ".colors.\"$1\".blue" "$2")
cyan = #$(jq -r ".colors.\"$1\".cyan" "$2")
green = #$(jq -r ".colors.\"$1\".green" "$2")
yellow = #$(jq -r ".colors.\"$1\".yellow" "$2")
orange = #$(jq -r ".colors.\"$1\".orange" "$2")
gray = #$(jq -r ".colors.\"$1\".gray" "$2")

;; _-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
THEME
)"

printf '%s' "$output" > "${dest_dir}${dest_file}"