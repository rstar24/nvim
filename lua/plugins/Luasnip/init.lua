local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) --For lua snippet
    end,
  },
  sources = {
    { name = "luasnip" },
  },
})

local ls = require("luasnip")

require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/plugins/Luasnip/" })

ls.config.set_config({
  history = true, --keep around last snippet local to jump back
  updatevents = "TextChanged,TextChangedI", --update changes as you type (when using funciton)
  enable_autosnippets = true,
  ext_opts = {
    [require("luasnip.util.types").choiceNode] = {
      active = {
        virt_text = { { "<>", "#FFFFFF" } },
      },
    },
  },
})

--keymap
vim.keymap.set({ "i", "s" }, "<a-k>", function()
  if ls.jumpable(0) then
    ls.jump(0)
  end
end)

vim.keymap.set({ "i", "s" }, "<a-j>", function()
  if ls.jumpable(-2) then
    ls.jump(-2)
  end
end)
