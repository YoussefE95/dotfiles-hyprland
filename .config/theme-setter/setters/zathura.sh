#!/bin/bash
palette=("${@}")
zathura="$HOME/.config/zathura/zathurarc"

sed -i "s/.*default-bg.*/set default-bg \"#${palette[0]}\"/" $zathura
sed -i "s/.*default-fg.*/set default-fg \"#${palette[1]}\"/" $zathura

sed -i "s/.*statusbar-bg.*/set statusbar-bg \"#${palette[12]}\"/" $zathura
sed -i "s/.*statusbar-fg.*/set statusbar-fg \"#${palette[1]}\"/" $zathura

sed -i "s/.*inputbar-bg.*/set inputbar-bg \"#${palette[12]}\"/" $zathura
sed -i "s/.*inputbar-fg.*/set inputbar-fg \"#${palette[1]}\"/" $zathura

sed -i "s/.*notification-error-bg.*/set notification-error-bg \"#${palette[5]}\"/" $zathura
sed -i "s/.*notification-error-fg.*/set notification-error-fg \"#${palette[1]}\"/" $zathura

sed -i "s/.*notification-warning-bg.*/set notification-warning-bg \"#${palette[7]}\"/" $zathura
sed -i "s/.*notification-warning-fg.*/set notification-warning-fg \"#${palette[1]}\"/" $zathura

sed -i "s/.*notification-bg.*/set notification-bg \"#${palette[12]}\"/" $zathura
sed -i "s/.*notification-fg.*/set notification-fg \"#${palette[1]}\"/" $zathura

sed -i "s/.*highlight-color .*/set highlight-color \"#${palette[8]}\"/" $zathura
sed -i "s/.*highlight-active-color.*/set highlight-active-color \"#${palette[0]}\"/" $zathura

sed -i "s/.*completion-highlight-bg.*/set completion-highlight-bg \"#${palette[12]}\"/" $zathura
sed -i "s/.*completion-highlight-fg.*/set completion-highlight-fg \"#${palette[1]}\"/" $zathura

sed -i "s/.*completion-bg.*/set completion-bg \"#${palette[12]}\"/" $zathura
sed -i "s/.*completion-fg.*/set completion-fg \"#${palette[1]}\"/" $zathura

sed -i "s/.*recolor-lightcolor.*/set recolor-lightcolor \"#${palette[0]}\"/" $zathura
sed -i "s/.*recolor-darkcolor.*/set recolor-darkcolor \"#${palette[1]}\"/" $zathura
