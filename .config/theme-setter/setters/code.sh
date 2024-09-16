#!/bin/bash
settings="$HOME/.config/Code - OSS/User/settings.json"

if [ "$1" == "dark" ]; then
    sed -i "s/.*workbench.colorTheme.*/\"workbench.colorTheme\": \"Gruvbox Material Dark\",/" "$settings"
    sed -i "s/.*gruvboxMaterial.darkContrast.*/\"gruvboxMaterial.darkContrast\": \"$2\",/" "$settings"
else
    sed -i "s/.*workbench.colorTheme.*/\"workbench.colorTheme\": \"Gruvbox Material Light\",/" "$settings"
    sed -i "s/.*gruvboxMaterial.lightContrast.*/\"gruvboxMaterial.lightContrast\": \"$2\",/" "$settings"
fi