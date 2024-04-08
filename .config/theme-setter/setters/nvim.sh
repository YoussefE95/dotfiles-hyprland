#!/bin/bash
nvimThemes="$HOME/.config/nvim/lua/younix/theme.lua"

if [ "$2" == "light" ]; then
    sed -i "s/.*everforest_background.*/vim.g.everforest_background = 'soft'/" "$nvimThemes"
    sed -i "s/.*material_background.*/vim.g.gruvbox_material_background = 'soft'/" "$nvimThemes"

    sed -i "s/vim.o.background.*/vim.o.background = 'light'/" "$nvimThemes"
elif [ "$2" == "dark" ]; then
    sed -i "s/.*everforest_background.*/vim.g.everforest_background = 'hard'/" "$nvimThemes"   
    sed -i "s/.*material_background.*/vim.g.gruvbox_material_background = 'hard'/" "$nvimThemes"   
    sed -i "s/.*dark_variant.*/    dark_variant = 'main'/" "$nvimThemes"

    sed -i "s/vim.o.background.*/vim.o.background = 'dark'/" "$nvimThemes"
 else
    sed -i "s/.*everforest_background.*/vim.g.everforest_background = 'medium'/" "$nvimThemes" 
    sed -i "s/.*material_background.*/vim.g.gruvbox_material_background = 'medium'/" "$nvimThemes" 
    sed -i "s/.*dark_variant.*/    dark_variant = 'moon'/" "$nvimThemes"

    sed -i "s/vim.o.background.*/vim.o.background = 'dark'/" "$nvimThemes"
fi
sed -i "s/.*colorscheme.*/vim.cmd('colorscheme $1')/" "$nvimThemes"
