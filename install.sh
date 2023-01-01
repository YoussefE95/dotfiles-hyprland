yay -Syyu

yay -S hyprland-git
yay -S waybar-hyprland-git
yay -S swww
yay -S swaylock
yay -S kitty-git 
yay -S grim slurp
yay -S eww-wayland
yay -S rofi
yay -S zsh 
yay -S starship 
yay -S apple-fonts
yay -S nerd-fonts-meslo
yay -S ttf-meslo-nerd-font-powerlevel10k
yay -S ttf-font-awesome-5
yay -S ttf-raleway
yay -S papirus-icon-theme-git
yay -S ranger
yay -S neofetch
yay -S cmatrix
yay -S gotop-bin
yay -S discord
yay -S dropbox
yay -S notion-app-enhanced
yay -S visual-studio-code-bin
yay -S expressvpn
yay -S spotify
yay -S spicetify-cli
yay -S libreoffice-fresh
yay -S cmake
yay -S extra-cmake-modules
yay -S jq
yay -S polkit-gnome
yay -S gnome-keyring
yay -S libsecret
yay -S libgnome-keyring
yay -S python-pip
yay -S htop
yay -S brightnessctl
yay -S cron
yay -S acpi
yay -S bluez
yay -S bluez-utils
yay -S blueman-git
yay -S thunar
yay -S tumbler

# yay -S xorg-xinit
# yay -S xsettingsd

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

python3 -m pip install -U https://github.com/leovoel/BeautifulDiscord/archive/master.zip

sudo rsync -a .zshrc .config .local .themes .icons ~/
sudo cp .config/theme-setter/set-theme /usr/local/bin/
sudo cp .config/theme-setter/get-theme /usr/local/bin/

sudo rm -rf ~/Documents ~/Music ~/Public ~/Videos ~/Templates ~/Pictures

sudo systemctl enable bluetooth
sudo systemctl enable expressvpn

# set discord theme
# python3 -m beautifuldiscord --css ~/.config/beautdisc/global_theme.css

# set spotify theme
# sudo chmod a+wr /opt/spotify
# sudo chmod a+wr /opt/spotify/Apps -R
# spicetify config current_theme Default color_scheme Ocean
# spicetify backup apply
