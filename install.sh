yay -Syyu

yay -S awesome-git 
yay -S alacritty 
yay -S zsh 
yay -S starship 
yay -S apple-fonts 
yay -S nerd-fonts-meslo 
yay -S ttf-meslo-nerd-font-powerlevel10k
yay -S picom-ibhagwan-git
yay -S ttf-raleway
yay -S ranger
yay -S neofetch
yay -S cmatrix
yay -S gotop-bin
yay -S discord
yay -S dropbox
yay -S visual-studio-code-bin
yay -S expressvpn
yay -S spotify
yay -S spicetify-cli
yay -S libreoffice-fresh
yay -S cmake
yay -S extra-cmake-modules
yay -S jq
yay -S google-chrome
yay -S gnome-keyring
yay -S libsecret 
yay -S libgnome-keyring
yay -S python-pip
yay -S htop
yay -S playerctl
yay -S brightnessctl
yay -S wmctrl
yay -S xclip
yay -S scrot
yay -S cron
yay -S ueberzug
yay -S xorg-xinit
yay -S polkit-gnome
yay -S acpi
yay -S ttf-font-awesome-5
yay -S lightdm
yay -S lightdm-mini-greeter
yay -S i3lock
yay -S bluez 
yay -S bluez-utils
yay -S blueman-git
yay -S xsettingsd
yay -S thunar-git

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

python3 -m pip install -U https://github.com/leovoel/BeautifulDiscord/archive/master.zip

sudo rsync -a .zshrc .config .themes .icons .xinitrc .xserverrc .Xresources .bash_profile ~/
sudo cp .config/theme-setter/set-theme /usr/local/bin/
sudo cp .config/theme-setter/get-theme /usr/local/bin/

mkdir ~/.config/xsettingsd/
sudo cp xsettingsd.conf ~/.config/xsettingsd/

sudo rm -rf ~/Documents ~/Music ~/Public ~/Videos ~/Templates ~/Pictures

# set up cache for quote widget
touch /home/younix/.cache/widget.quote
touch /home/younix/.cache/widget.author

sudo systemctl enable bluetooth
sudo systemctl enable expressvpn

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
