require('catppuccin').setup({
    flavour = 'frappe'
})
require('thorn').setup({
    background = 'cold'
})

vim.o.background = 'dark'
vim.g.gruvbox_material_background = 'hard'

vim.cmd('colorscheme thorn')
