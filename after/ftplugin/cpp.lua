local current_file_path = vim.api.nvim_buf_get_name(0)
local current_file_name = vim.fn.expand("%:t")
local target_name = current_file_name:gsub("%..*$","") --Removes the ex
local target_path = current_file_path:gsub(current_file_name,"") 
local target_loc = target_path .. target_name
local compile_run = string.format("g++ --std=c++11 %s -o %s && clear &&%s | lolcat ",current_file_path,target_loc,target_loc)
local final = string.format("tmux send-keys -t 0:0.1 '%s' Enter",compile_run)

vim.keymap.set('n','<leader>x', function()
    vim.fn.system(final)
end,
{noremap = true})

--print(current_file_path)
--print(target_name):
--print(current_file_name)
--print(target_path)
