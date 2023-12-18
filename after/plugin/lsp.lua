 local lsp= require('lsp-zero')

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  --lsp.default_keymaps({buffer = bufnr})
  local opts = {buffer = bufnr, remap = false}
  vim.opt.tabstop = 4
  vim.opt.softtabstop = 4
  vim.opt.shiftwidth = 4
  vim.opt.expandtab = true

  vim.opt.smartindent = true 
  vim.opt.wrap = false

  vim.opt.swapfile = false
  vim.opt.backup = false
  vim.opt.undodir = os.getenv("HOME").."/.vim/undodir"
  vim.opt.undofile = true

  vim.opt.hlsearch = false
  vim.opt.incsearch = true
  vim.opt.termguicolors = true

  vim.opt.scrolloff = 8
  vim.opt.signcolumn = yes
  vim.opt.isfname:apped("@-@")

  vim.opt.updatetime = 50
  vim.opt.colorcolumn = "80"

end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'tsserver',
    'eslint',
  },
  handlers = {
    lsp.default_setup,
  },
})

