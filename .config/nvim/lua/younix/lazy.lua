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
    { 'nvim-telescope/telescope.nvim', name = 'telescope' },
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons',
    'numToStr/Comment.nvim',
    'sainnhe/gruvbox-material',
    { 'catppuccin/nvim', name = 'catppuccin' },
    'eandrju/cellular-automaton.nvim',
    {
        "vimwiki/vimwiki",
        event = "BufEnter *.md",
        keys = { "<leader>ww", "<leader>wt" },
        init = function()
            vim.g.vimwiki_folding = ""
            vim.g.vimwiki_list = {
                {
                    path = "~/Dropbox/Notes/",
                    syntax = "markdown",
                    ext = ".md",
                },
            }
            vim.g.vimwiki_ext2syntax = {
                [".md"] = "markdown",
                [".markdown"] = "markdown",
                [".mdown"] = "markdown",
            }
        end,
    }
})
