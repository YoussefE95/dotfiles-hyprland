yay -Syyu

yay -S berry-git alacritty picom-ibhagwan-git nerd-fonts-meslo ttf-meslo-nerd-font-powerlevel10k ttf-raleway ranger neofetch cmatrix gotop-bin discord dropbox visual-studio-code-bin expressvpn spotify spicetify-cli libreoffice-fresh cmake extra-cmake-modules jq google-chrome gnome-keyring libsecret libgnome-keyring python-pip htop playerctl brightnessctl wmctrl xclip eww scrot cron pipewire-pulse lightdm xorg-server lightdm-gtk-greeter ueberzug stalonetray

yay -S --noconfirm zsh-theme-powerlevel10k-git
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

python3 -m pip install -U https://github.com/leovoel/BeautifulDiscord/archive/master.zip

rsync -a .p10k.zsh .zshrc .stalonetrayrc .config .themes ~/
sudo cp .config/theme-setter/set-theme /usr/local/bin/

sudo rm -rf ~/Documents ~/Music ~/Public ~/Videos ~/Templates ~/Pictures

sudo systemctl enable expressvpn cronie.service
sudo systemctl start expressvpn cronie.service

# sudo nano /etc/lightdm/lightdm.conf
# greeter-session=lightdm-gtk-greeter
sudo cp berry.desktop /usr/share/xsessions

# set up eww cache
touch /home/younix/.cache/eww.quote
touch /home/younix/.cache/eww.author
~/.config/eww/arin/scripts/quotes update
~/.config/eww/arin/scripts/weather_info --getdata

# set crontab to update quotes every 10 minutes
# crontab -e
# */10 * * * *  /home/younix/.config/eww/arin/scripts/quotes update
# */10 * * * *  /home/younix/.config/eww/arin/scripts/weather_info --getdata

# set discord theme
# python3 -m beautifuldiscord --css ~/.config/beautdisc/global_theme.css

# set spotify theme
# sudo chmod a+wr /opt/spotify
# sudo chmod a+wr /opt/spotify/Apps -R
# spicetify config current_theme Default color_scheme Ocean
# spicetify backup apply
