gsettings set org.gnome.desktop.interface gtk-theme "$(jq -r ".gtk.\"$1\".theme" "$2")"
gsettings set org.gnome.desktop.interface cursor-theme "$(jq -r ".gtk.\"$1\".cursor" "$2")"
gsettings set org.gnome.desktop.interface icon-theme "$(jq -r ".gtk.\"$1\".icons" "$2")"
gsettings set org.gnome.desktop.interface font-name 'SFMono'