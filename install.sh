yay -Syu

yay -S hyprland xwaylandvideobridge-bin xdg-desktop-portal-hyprland waybar-hyprland swww swaylock polkit libsecret polkit-kde-agent nautilus gnome-calculator obsidian alacritty code grim slurp tofi dunst zsh starship ttf-hack ttf-hack-nerd ttf-iosevka-nerd ranger ueberzugpp discord dropbox expressvpn spicetify-cli spotify-launcher cmake extra-cmake-modules bc jq python-pipx htop brightnessctl acpi alsa-utils bluez bluez-utils blueman pavucontrol nodejs npm

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ~/.zsh/zsh-history-substring-search

pipx install https://github.com/leovoel/BeautifulDiscord/archive/master.zip

sudo rsync -a .config .local .zshrc ~/

sudo cp .config/theme-setter/set-theme /usr/local/bin/
sudo cp .config/theme-setter/get-theme /usr/local/bin/

sudo rm -rf ~/Documents ~/Music ~/Public ~/Videos ~/Templates ~/Pictures

sudo systemctl enable bluetooth
sudo systemctl enable expressvpn

# ~/.local/bin/beautifuldiscord --css ~/.config/beautifuldiscord.css

# spicetify config inject_css 1 replace_colors 1 overwrite_assets 1 inject_theme_js 1
# spicetify config current_theme Comfy
# spicetify config color_scheme dynamic
# spicetify backup apply

# vs code:
#   ESLint
#   Gruvbox Material
#   Material Product Icons
#   Prettier
#   Python
#   Rose Pine
#   Thunder Client
#   Vue Language Features