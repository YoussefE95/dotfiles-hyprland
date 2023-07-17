vim.keymap.set('n', '<leader>st', ':so ~/.config/nvim/lua/younix/theme.lua<CR>')

local treeApi = require 'nvim-tree.api'
vim.keymap.set('n', '<C-b>', treeApi.tree.toggle)

vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

vim.keymap.set('x', 'p', '"_dP')
vim.keymap.set('n', 'y', '"+y')
vim.keymap.set('v', 'y', '"+y')

vim.keymap.set('n', '<Tab>', ':tabnext<CR>')
vim.keymap.set('n', '<S-Tab>', ':tabprev<CR>')

vim.keymap.set('v', '<Tab>', '>gv')
vim.keymap.set('v', '<S-Tab>', '<gv')

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set('n', '<C-Up>', ':resize -2<CR>')
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>')
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>')

vim.keymap.set('t', '<C-h>', '<cmd>wincmd h<CR>')
vim.keymap.set('t', '<C-j>', '<cmd>wincmd j<CR>')
vim.keymap.set('t', '<C-k>', '<cmd>wincmd k<CR>')
vim.keymap.set('t', '<C-l>', '<cmd>wincmd l<CR>')

vim.keymap.set('t', '<C-Up>', '<cmd>resize -2<CR>')
vim.keymap.set('t', '<C-Down>', '<cmd>resize +2<CR>')
vim.keymap.set('t', '<C-Left>', '<cmd>vertical resize -2<CR>')
vim.keymap.set('t', '<C-Right>', '<cmd>vertical resize +2<CR>')
