# Update
yay -Syu

# Install everything
yay -S hyprland waybar-hyprland-git swww swaylock polkit libsecret polkit-gnome alacritty grim slurp dmenu dunst zsh neovim wl-clipboard starship apple-fonts ttf-iosevka-nerd ranger ueberzugpp discord slack-desktop dropbox expressvpn spicetify-cli spotify-launcher cmake extra-cmake-modules bc jq python-pipx htop brightnessctl acpi alsa-utils bluez bluez-utils blueman-git pavucontrol nodejs npm

# Packer for Neovim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Syntax highlighting for Zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git\
 ~/.zsh/zsh-syntax-highlighting

# Auto suggestions for Zsh
git clone https://github.com/zsh-users/zsh-autosuggestions\
 ~/.zsh/zsh-autosuggestions

# Beautiful Discord
pipx install https://github.com/leovoel/BeautifulDiscord/archive/master.zip

# Copy all config files
sudo rsync -a .config .local .zshrc ~/

# Copy commands for theme setter
sudo cp .config/theme-setter/set-theme /usr/local/bin/
sudo cp .config/theme-setter/get-theme /usr/local/bin/
sudo cp .config/theme-setter/reapply-theme /usr/local/bin/

# Delete unused directories
sudo rm -rf ~/Documents ~/Music ~/Public ~/Videos ~/Templates ~/Pictures

# Copy Spotify Systemd service
sudo cp .config/spotifyd/spotifyd.service /etc/systemd/user/

# Enable daemons
systemctl --user enable spotifyd.service --now
sudo systemctl enable bluetooth
sudo systemctl enable expressvpn

# set discord theme
# ~/.local/bin/beautifuldiscord --css ~/.config/beautdisc/global_theme.css
