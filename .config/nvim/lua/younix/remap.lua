local treeApi = require 'nvim-tree.api'
vim.keymap.set('n', '<C-b>', treeApi.tree.toggle)

vim.keymap.set('n', '<leader>st', ':so ~/.config/nvim/lua/younix/theme.lua<CR>')
vim.keymap.set('n', '<leader>rain', ':CellularAutomaton make_it_rain<CR>')
vim.keymap.set('n', '<leader>game', ':CellularAutomaton game_of_life<CR>')
vim.keymap.set('n', '<leader>sp', ':PetsNewCustom dog brown Peanut<CR>')
vim.keymap.set('n', '<leader>kp', ':PetsKillAll<CR>')

vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

vim.keymap.set('x', 'p', '"_dP')
vim.keymap.set('n', 'y', '"+y')
vim.keymap.set('v', 'y', '"+y')

vim.keymap.set('n', '<Tab>', ':tabnext<CR>')
vim.keymap.set('n', '<S-Tab>', ':tabprev<CR>')

vim.keymap.set('v', '<Tab>', '>gv')
vim.keymap.set('v', '<S-Tab>', '<gv')

vim.keymap.set('n', '<A-u>', '-8')
vim.keymap.set('n', '<A-d>', '+8')
vim.keymap.set('v', '<A-u>', '-8')
vim.keymap.set('v', '<A-d>', '+8')

vim.keymap.set('n', '<A-h>', '<C-w>h')
vim.keymap.set('n', '<A-j>', '<C-w>j')
vim.keymap.set('n', '<A-k>', '<C-w>k')
vim.keymap.set('n', '<A-l>', '<C-w>l')

vim.keymap.set('n', '<A-Up>', ':resize -2<CR>')
vim.keymap.set('n', '<A-Down>', ':resize +2<CR>')
vim.keymap.set('n', '<A-Left>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<A-Right>', ':vertical resize +2<CR>')

vim.keymap.set('t', '<A-h>', '<cmd>wincmd h<CR>')
vim.keymap.set('t', '<A-j>', '<cmd>wincmd j<CR>')
vim.keymap.set('t', '<A-k>', '<cmd>wincmd k<CR>')
vim.keymap.set('t', '<A-l>', '<cmd>wincmd l<CR>')

vim.keymap.set('t', '<A-Up>', '<cmd>resize -2<CR>')
vim.keymap.set('t', '<A-Down>', '<cmd>resize +2<CR>')
vim.keymap.set('t', '<A-Left>', '<cmd>vertical resize -2<CR>')
vim.keymap.set('t', '<A-Right>', '<cmd>vertical resize +2<CR>')
