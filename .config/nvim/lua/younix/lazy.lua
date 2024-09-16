local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope.nvim', name = 'telescope' },
	'nvim-treesitter/nvim-treesitter',
	'nvim-treesitter/playground',
	'nvim-tree/nvim-tree.lua',
	'nvim-tree/nvim-web-devicons',
    'numToStr/Comment.nvim',
    'sainnhe/everforest',
    'sainnhe/gruvbox-material',
	{ 'rose-pine/neovim', name = 'rose-pine' },
    { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
    {
        'giusgad/pets.nvim',
        dependencies = { 'MunifTanjim/nui.nvim', 'giusgad/hologram.nvim' },
    },
    'eandrju/cellular-automaton.nvim'
})
