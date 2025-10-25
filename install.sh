#!/bin/bash
# Delete unnecessary folders
sudo rm -rf ~/Documents ~/Music ~/Public ~/Videos ~/Templates ~/Pictures

# Copy config files
sudo rsync -a .config .local .zshrc ~/

# Copy theming scripts
sudo cp .config/theme-setter/set-theme .config/theme-setter/get-theme \
    /usr/local/bin/

# Create sym links for local icons
sudo ln -s ~/.local/share/icons/* /usr/share/icons

# Update and install packages
yay -Syu && yay -S \
    uwsm hyprland hyprlock hyprshot niri swww quickshell kitty starship \
    neovim ranger nvtop htop obsidian dropbox discord obs-studio \
    spotify-launcher spicetify-cli kvantum dolphin dolphin-plugins okular \
    gwenview ttf-jetbrains-mono ttf-jetbrains-mono-nerd brightnessctl \
    jq python-pipx python-pillow docker docker-buildx ripgrep wl-clipboard \
    hyprpolkitagent xdg-desktop-portal-hyprland qt5-wayland qt6-wayland \
    qt6ct-kde zsh zsh-autosuggestions zsh-history-substring-search \
    zsh-syntax-highlighting libappindicator-gtk3 archlinux-xdg-menu \
    xwayland-satellite

# Set wallpaper
swww img "~/.local/share/wallpaper.jpg" \
    --transition-type wipe \
    --transition-angle 30 \
    --transition-step 90

# Enable Bluetooth, Docker, and ExpressVPN
sudo systemctl enable bluetooth
sudo systemctl enable docker

# Add user to Docker group
sudo gpasswd -a $USER docker

# Make zsh default shell
chsh -s $(which zsh)

# Install Spicetify
# spicetify config inject_css 1 replace_colors 1 overwrite_assets 1 \
#   inject_theme_js 1
# spicetify config current_theme Comfy
# spicetify config color_scheme dynamic
# spicetify backup apply
