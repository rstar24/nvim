return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nightfly",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      term_colors = true,
      transparent_background = true,
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
  },
}
--this makes the tokyonight transparent
--can let see if nord can be made transparent
-- Currently disabled
--  {

--"bluz71/vim-nightfly-guicolors",
--opts = {
--},
--opts = {
-- nightflyItalics = false,
-- nightflyTerminalColors = true,
--nightflyTransparent = true,

--  transparent = true,
-- styles = {
--   sidebars = "transparent",
--  floats = "transparent",
-- },
--},
--  },
--}
