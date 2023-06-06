#!/bin/dash

# thanks to Kodehawa
# https://gist.github.com/Kodehawa/85b97416723a0e6cd3d7bd3dccb970f6

bold=$(tput bold)
normal=$(tput sgr0)

green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)

os=$(lsb_release -si)
kern=$(uname -r)
pkgs=$(pacman -Q | wc -l)
pkgsExp=$(pacman -Qqe | wc -l)
pkgsAUR=$(pacman -Qm | wc -l)
term=$(alacritty --version | cut -d ' ' -f 1,2)
shell=$(zsh --version | cut -d ' ' -f 1,2)
wm=$(wmctrl -m | grep "Name:" | cut -d ' ' -f 2)
cpu=$(lscpu | grep 'Model name' | cut -d ':' -f 2 | awk '{$1=$1}1')
gpu=$(lspci | grep VGA | cut -d ' ' -f 7,8,9,10)
mem=$(grep MemTotal /proc/meminfo | echo "scale=2;$(awk '{print $2}') / 1048576" | bc)

printf "\n    ${bold}  $USER@$(hostname)${normal}\n"
printf "    ${bold}${magenta}${normal}  $os, $kern\n"
printf "    ${bold}${yellow}${normal}  $pkgs (Explicit: $pkgsExp, AUR: $pkgsAUR)\n"
printf "    ${bold}${cyan}${normal}  ${wm^}\n"
printf "    ${bold}${green}${normal}  ${term^}\n"
printf "    ${bold}${green}󰐣${normal}  ${shell^}\n"
printf "    ${bold}${blue}${normal}  $cpu\n"
printf "    ${bold}${blue}󰍹${normal}  $gpu\n"
printf "    ${bold}${blue}${normal}  $mem GB\n"