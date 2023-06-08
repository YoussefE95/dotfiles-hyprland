nvimThemes="$HOME/.config/nvim/lua/younix/theme.lua"

if [[ "$1" == "catppuccin" ]]; then
    if [[ "$2" == "light" ]]; then
        sed -i "s/.*flavour.*/    flavour = 'latte'/" "$nvimThemes"
    elif [[ "$2" == "dark" ]]; then
        sed -i "s/.*flavour.*/    flavour = 'mocha'/" "$nvimThemes"
    else
        sed -i "s/.*flavour.*/    flavour = 'macchiato'/" "$nvimThemes"
    fi
    sed -i "s/.*colorscheme.*/vim.cmd('colorscheme catppuccin')/" "$nvimThemes"
elif [[ "$1" == "gruvbox" ]]; then
    if [[ "$2" == "light" ]]; then
        sed -i "s/.*material_background.*/vim.g.gruvbox_material_background = 'soft'/" "$nvimThemes"
        sed -i "s/vim.o.background.*/vim.o.background = 'light'/" "$nvimThemes"
    elif [[ "$2" == "dark" ]]; then
        sed -i "s/.*material_background.*/vim.g.gruvbox_material_background = 'hard'/" "$nvimThemes"   
        sed -i "s/vim.o.background.*/vim.o.background = 'dark'/" "$nvimThemes"
     else
        sed -i "s/.*material_background.*/vim.g.gruvbox_material_background = 'medium'/" "$nvimThemes" 
        sed -i "s/vim.o.background.*/vim.o.background = 'dark'/" "$nvimThemes"
    fi
    sed -i "s/.*colorscheme.*/vim.cmd('colorscheme gruvbox-material')/" "$nvimThemes"
elif [[ "$1" == "rose-pine" ]]; then
    if [[ "$2" == "light" ]]; then
        sed -i "s/vim.o.background.*/vim.o.background = 'light'/" "$nvimThemes"
    elif [[ "$2" == "dark" ]]; then
        sed -i "s/.*dark_variant.*/    dark_variant = 'main'/" "$nvimThemes"
        sed -i "s/vim.o.background.*/vim.o.background = 'dark'/" "$nvimThemes"
    else
        sed -i "s/.*dark_variant.*/    dark_variant = 'moon'/" "$nvimThemes"
        sed -i "s/vim.o.background.*/vim.o.background = 'dark'/" "$nvimThemes"
    fi
    sed -i "s/.*colorscheme.*/vim.cmd('colorscheme rose-pine')/" "$nvimThemes"
fi
