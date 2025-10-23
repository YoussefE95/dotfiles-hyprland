#!/bin/bash
qt_conf="$HOME/.config/qt6ct/qt6ct.conf"
kde_conf="$HOME/.config/kdeglobals"

sed -i "s/icon_theme.*/icon_theme=$1/g" $qt_conf
sed -i "s/Theme.*/Theme=$1/g" $kde_conf
