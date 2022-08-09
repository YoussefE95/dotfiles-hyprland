yay -Syyu

yay -S awesome-git alacritty zsh starship apple-fonts nerd-fonts-meslo ttf-meslo-nerd-font-powerlevel10k picom-ibhagwan-git ttf-raleway ranger neofetch cmatrix gotop-bin discord dropbox visual-studio-code-bin expressvpn spotify spicetify-cli libreoffice-fresh cmake extra-cmake-modules jq google-chrome gnome-keyring libsecret libgnome-keyring python-pip htop playerctl brightnessctl wmctrl xclip scrot cron ueberzug xorg-xinit polkit-gnome acpi ttf-font-awesome-5 lightdm lightdm-mini-greeter i3lock bluez bluez-utils blueman-git

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

python3 -m pip install -U https://github.com/leovoel/BeautifulDiscord/archive/master.zip

sudo rsync -a .zshrc .config .themes .icons .xinitrc .xserverrc .bash_profile ~/
sudo cp .config/theme-setter/set-theme /usr/local/bin/
sudo cp .config/theme-setter/get-theme /usr/local/bin/

sudo rm -rf ~/Documents ~/Music ~/Public ~/Videos ~/Templates ~/Pictures

# set up cache for quote widget
touch /home/younix/.cache/widget.quote
touch /home/younix/.cache/widget.author

# enable bluetooth
sudo systemctl enable bluetooth

# copy login screen files
sudo cp lightdm.conf lightdm-mini-greeter.conf /etc/lightdm/

# enable gui login screen
sudo systemctl enable lightdm

# set discord theme
# python3 -m beautifuldiscord --css ~/.config/beautdisc/global_theme.css

# set spotify theme
# sudo chmod a+wr /opt/spotify
# sudo chmod a+wr /opt/spotify/Apps -R
# spicetify config current_theme Default color_scheme Ocean
# spicetify backup apply