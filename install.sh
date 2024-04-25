yay -S hyprland hyprpaper hyprlock tofi dunst zsh starship ttf-hack ttf-hack-nerd kitty neovim zathura zathura-pdf-poppler ranger htop nvtop expressvpn obsidian nautilus discord dropbox spicetify-cli spotify xwaylandvideobridge xdg-desktop-portal-hyprland polkit libsecret polkit-kde-agent wl-clipboard grim slurp cmake extra-cmake-modules bc jq python-pipx python-pillow brightnessctl acpi alsa-utils bluez bluez-utils blueman pavucontrol nodejs npm

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

chsh -s $(which zsh)

gsettings set org.gnome.desktop.interface cursor-theme "Capitaine-Cursors"

# ~/.local/bin/beautifuldiscord --css ~/.config/beautifuldiscord.css

# sudo chmod a+wr /opt/spotify
# sudo chmod a+wr /opt/spotify/Apps -R
# spicetify config inject_css 1 replace_colors 1 overwrite_assets 1 inject_theme_js 1
# spicetify config current_theme Comfy
# spicetify config color_scheme dynamic
# spicetify backup apply
