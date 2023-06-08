local api = require 'nvim-tree.api'
vim.keymap.set('n', '<C-b>', api.tree.toggle)

vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

vim.keymap.set('x', 'p', '"_dP')
vim.keymap.set('n', 'y', '"+y')
vim.keymap.set('v', 'y', '"+y')

vim.keymap.set('n', '<leader>st', ':so ~/.config/nvim/lua/younix/theme.lua')
