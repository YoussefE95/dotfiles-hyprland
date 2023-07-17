require('rose-pine').setup({
    dark_variant = 'moon'
})
require('catppuccin').setup({
    flavour = 'macchiato'
})
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_background = 'medium'

vim.o.background = 'dark'

vim.cmd('colorscheme gruvbox-material')
