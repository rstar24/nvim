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
        "nvim-telescope/telescope.nvim",
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
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
    { "catppuccin/nvim",                  name = "catppuccin" },
    --]]
    --Treesitter for the syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        run = ':TSUpdate'
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
            { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc =
            "Flash Treesitter" },
            { "r",     mode = "o",               function() require("flash").remote() end,            desc =
            "Remote Flash" },
            { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end,
                                                                                                          desc =
                "Treesitter Search" },
            { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc =
            "Toggle Flash Search" },
        },
    },
    "nvim-treesitter/playground",
    "theprimeagen/harpoon",
    "mbbill/undotree",
    "tpope/vim-fugitive",

    --THe lsp here
    ----- Uncomment these if you want to manage LSP servers from neovim
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-path' },
    { 'L3MON4D3/LuaSnip' },

    --For adding vs code like snippets
    { "rafamadriz/friendly-snippets" },
    { "saadparwaiz1/cmp_luasnip" },

    --Neovim debugger for c and c++ programs
    {
        "mfussenegger/nvim-dap",
        --config = function(_, _)
        --    require("core.utils").load_mappings("dap")
        --end
    },
    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        opts = {
            handlers = {}
        }
    },
    -- The obsidian for note making
    {
        "epwalsh/obsidian.nvim",
        version = "*",  -- recommended, use latest release instead of latest commit
        --lazy = true,
        ft = "markdown",
    },

}

local opts = {}

require("lazy").setup(plugins, opts)
