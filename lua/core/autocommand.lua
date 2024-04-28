vim.api.nvim_create_autocmd({"BufEnter","BufWinEnter"},{
    pattern = {"*.c","*.h"},
    callback = function() print("Enterign a C or C++ File") end
})
