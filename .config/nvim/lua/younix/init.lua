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
require("pets").setup({
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

vim.api.nvim_create_autocmd("BufNew", {
    pattern = vim.fn.expand("~/Dropbox/Notes/*.md"),
    callback = function()
        vim.cmd("NvimTreeClose")
        vim.cmd("NvimTreeToggle ~/Dropbox/Notes")
        vim.cmd("NvimTreeOpen")
    end,
})

vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = vim.fn.expand("~/Dropbox/Notes/diary/*.md"),
    callback = function()
        local file = vim.fn.expand('%')
        vim.cmd("silent 0r !~/.config/nvim/scripts/diary.sh '" .. file .. "'")
    end,
})
