local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    --ALl the plugins that i want will be installed here
    --I am going to do every thing on top of this lazyvim conf

    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { "lervag/vimtex" },
    { "fadein/vim-figlet" },
    { "L3MON4D3/LuaSnip" },
    { "SirVer/ultisnips" },
    { "ellisonleao/gruvbox.nvim" },
    { "ThePrimeagen/harpoon" },
    --THeme that i like
    { "nordtheme/vim" },
    { "bluz71/vim-nightfly-guicolors" },
    --for Icons
    --{ "yamatsum/nvim-nonicons" },
    --{ "projekt0n/circles.nvim" },
    -- Icons will be dealt soon
    { "nvim-tree/nvim-web-devicons" },
    -- vimtex
    -- for live reload for
    --{ "folke/persistence.nvim" },
    { "junegunn/fzf" },
    { "frabjous/knap" },
    { "mfussenegger/nvim-dap" },
    { "rcarriga/nvim-dap-ui" },
    { "nvim-treesitter/nvim-treesitter" },
    { "theHamsta/nvim-dap-virtual-text" },
    { "nvim-telescope/telescope-dap.nvim" },
    -- for making surrounding keybinds
    { "kylechui/nvim-surround" },
    -- import any extras modules here
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.ui.mini-animate" },
    --import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
    --[[{
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "catppuccin",
      },
    },
    {
      "catppuccin/nvim",
      name = "catppuccin",
      opts = {
        term_colors = true,
        transparent_background = false,
        styles = {
          comments = {},
          conditionals = {},
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
        },
        color_overrides = {
          mocha = {
            base = "#000000",
            mantle = "#000000",
            crust = "#000000",
          },
        },
      },
    },--]]
  },
  --install = { colorscheme = { "gruvbox", "habamax" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        --"tutor",
        "zipPlugin",
      },
    },
  },
})
