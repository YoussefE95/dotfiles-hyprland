yay -Syyu

yay -S hyprland waybar-hyprland-git swww swaylock polkit libsecret polkit-gnome alacritty grim slurp dmenu dunst zsh neovim wl-clipboard starship apple-fonts ttf-iosevka-nerd ranger ueberzugpp discord slack-desktop dropbox expressvpn spotifyd spotify-tui cmake extra-cmake-modules jq python-pip htop brightnessctl acpi alsa bluez bluez-utils blueman-git pavucontrol nodejs npm

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

python3 -m pip install -U https://github.com/leovoel/BeautifulDiscord/archive/master.zip

sudo rsync -a .config .local .zshrc ~/
sudo cp .config/theme-setter/set-theme /usr/local/bin/
sudo cp .config/theme-setter/get-theme /usr/local/bin/
sudo cp .config/theme-setter/reapply-theme /usr/local/bin/

sudo cp .config/spotifyd/spotifyd.service /etc/systemd/user/

sudo rm -rf ~/Documents ~/Music ~/Public ~/Videos ~/Templates ~/Pictures

systemctl --user enable spotifyd.service --now
sudo systemctl enable bluetooth
sudo systemctl enable expressvpn

# set discord theme
# python3 -m beautifuldiscord --css ~/.config/beautdisc/global_theme.css
