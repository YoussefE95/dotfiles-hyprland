#!/bin/bash
themes="$HOME/.config/nvim/lua/younix/theme.lua"

sed -i "s/vim.o.background.*/vim.o.background = '$1'/" "$themes"
sed -i "s/.*material_background.*/vim.g.gruvbox_material_background = '$2'/" "$themes"