require('younix.lazy')
require('younix.set')
require('younix.remap')
require('younix.theme')
require('Comment').setup()
require('nvim-tree').setup({
	view = {
		width = 29,
	},
})
require("pets").setup({
    row = 4,
    col = 0,
    speed_multiplier = .65,
    popup = { 
        width = "100%", 
        winblend = 100, 
        hl = { Normal = "Normal" }, 
        avoid_statusline = false, 
    }
})
