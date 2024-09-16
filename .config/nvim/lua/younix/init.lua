require('younix.lazy')
require('younix.set')
require('younix.remap')
require('younix.theme')
require('Comment').setup()
require('nvim-tree').setup({
	view = {
		width = 35,
	},
})
require('pets').setup({
    row = 7,
    col = 0,
    speed_multiplier = .65,
    popup = { 
        width = '100%', 
        winblend = 100, 
        hl = { Normal = 'Normal' }, 
        avoid_statusline = false, 
    }
})

vim.api.nvim_create_autocmd('VimEnter', {
    pattern = '*',
    command = ':PetsNewCustom dog brown Peanut'
})

vim.api.nvim_create_autocmd('VimEnter', {
    pattern = '*',
    command = ':PetsNewCustom slime blue Blu'
})
