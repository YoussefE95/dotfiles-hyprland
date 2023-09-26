# Update
yay -Syu

# Install everything
yay -S hyprland waybar-hyprland swww swaylock polkit libsecret polkit-gnome obsidian alacritty code grim slurp dmenu dunst zsh neovim wl-clipboard starship ttf-hack ttf-hack-nerd ttf-iosevka-nerd ranger ueberzugpp discord dropbox expressvpn spicetify-cli spotify-launcher cmake extra-cmake-modules bc jq python-pipx htop brightnessctl acpi alsa-utils bluez bluez-utils blueman pavucontrol nodejs npm

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

# Enable daemons
sudo systemctl enable bluetooth
sudo systemctl enable expressvpn

# set discord theme
# ~/.local/bin/beautifuldiscord --css ~/.config/beautifuldiscord.css

# set spotify theme
# spicetify config inject_css 1 replace_colors 1 overwrite_assets 1 inject_theme_js 1
# spicetify config current_theme Comfy
# spicetify config color_scheme dynamic
# spicetify backup apply

# vs code extensions: ESLint, Gruvbox Material, Material Product Icons, Prettier, Python, Rose Pine, Thunder Client, Vue Language Features