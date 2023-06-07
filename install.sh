yay -Syyu

yay -S hyprland-git waybar-hyprland-git swww swaylock polkit libsecret polkit-gnome alacritty grim slurp dmenu zsh neovim starship apple-fonts ttf-iosevka-nerd ranger discord dropbox expressvpn spotify spicetify-cli cmake extra-cmake-modules jq python-pip htop brightnessctl acpi bluez bluez-utils blueman-git pavucontrol nodejs npm

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

python3 -m pip install -U https://github.com/leovoel/BeautifulDiscord/archive/master.zip

sudo rsync -a .config .local .zshrc ~/
sudo cp .config/theme-setter/set-theme /usr/local/bin/
sudo cp .config/theme-setter/get-theme /usr/local/bin/
sudo cp .config/theme-setter/reapply-theme /usr/local/bin/

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
