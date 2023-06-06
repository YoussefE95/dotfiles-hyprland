require("younix.set")
require("younix.remap")
require("nvim-tree").setup({
	view = {
		width = 25,
	},
})
require('rose-pine').setup({
	dark_variant = 'moon',
})

vim.cmd('colorscheme rose-pine')
