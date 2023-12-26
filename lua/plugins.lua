local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--The plugin list for the neovim
local plugins = {
    -- Experimenting with 
    -- Github Copilot
    --"zbirenbaum/copilot.lua",
    "lervag/vimtex",
    "eandrju/cellular-automaton.nvim",
    --"nvim-tree/nvim-web-devicons",
    --Telescope Plugin
    {
        "nvim-telescope/telescope.nvim", tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim'}
    },
    ---[[ all themes 
    {
        "rose-pine/nvim",
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    },
    "dracula/vim",
    { "catppuccin/nvim", name = "catppuccin" },
    --]]
    --Treesitter for the syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        run = ':TSUpdate'
    }, 
    "nvim-treesitter/playground",
    "theprimeagen/harpoon",
    "mbbill/undotree",
    "tpope/vim-fugitive", 

    --THe lsp here 
    ----- Uncomment these if you want to manage LSP servers from neovim
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},

    --For adding vs code like snippets
    {"rafamadriz/friendly-snippets"},
    {"saadparwaiz1/cmp_luasnip"},
}

local opts = {}

require("lazy").setup(plugins, opts)
