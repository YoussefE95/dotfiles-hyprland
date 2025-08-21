#!/bin/bash
themes="$HOME/.config/nvim/lua/younix/theme.lua"

if [ "$1" == "gruvbox" ]; then
    nvim_theme="$1-material"

    sed -i "s/vim.o.background.*/vim.o.background = '$2'/" "$themes"
    sed -i \
        "s/.*material_background.*/vim.g.gruvbox_material_background = '$3'/" \
        "$themes"
else
    nvim_theme="$1"

    if [ "$2" == "light" ]; then
        flavour="latte"
    else
        if [ "$3" == "soft" ]; then
            flavour="frappe"
        elif [ "$3" == "medium" ]; then
            flavour="macchiato"
        else
            flavour="mocha"
        fi
    fi

    sed -i "s/.*flavour.*/    flavour = '$flavour'/" "$themes"
fi

sed -i "s/.*colorscheme.*/vim.cmd('colorscheme $nvim_theme')/" "$themes"
