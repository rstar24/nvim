-- an example auto command for learning
-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
--   pattern = { "*.c", "*.h" },
--   callback = function() print("Enterign a C or C++ File") end
-- })
--
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function()
    local opts = { buffer = true, desc = "Run C/C++ Code" }

    -- Example keymap: <leader>r = run current file
    vim.keymap.set('n', '<F6>',
      '<ESC>:w<CR>:silent !tmux send-keys -t 0:0.2 "g++ -fsanitize=address -std=c++17 -DONPC -O2 -o %:p:r %:p && %:p:r < inp | lolcat" C-m<CR>',
      { noremap = true, silent = true }
    )
  end,
})
