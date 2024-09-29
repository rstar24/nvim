
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])


vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])


vim.keymap.set("n", "Q", "<nop>")
--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

-- making simple keymaps for compiling and executing 
-- cpp and c programs 


vim.keymap.set('n', '<F6>', '<ESC>:w<CR>:!g++ -fsanitize=address -std=c++17 -DONPC -O2 -o %< % && ./%<  < inp | lolcat <CR>', { noremap = true, silent = true })

-- A remap for live grep using telescope
vim.keymap.set('n', '<leader>lg', function()
      require('telescope.builtin').live_grep({
        search_dirs = {vim.fn.expand('%:p:h')},
        file_ignore_patterns = {"*.o", "*.exe",".class"}
      })
    end, {
      noremap = true,
      silent = true,
      desc = "Telescope live grep in current file directory"
    }
)

-- Trying jj to Esc keymap
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })

-- making indent line toggle keymap
-- Function to toggle indent lines
function toggle_indent_lines()
    if vim.g.indent_blankline_enabled == nil then
        vim.g.indent_blankline_enabled = true -- Set to true if it was never set
    end
    vim.g.indent_blankline_enabled = not vim.g.indent_blankline_enabled -- Toggle the state
    if vim.g.indent_blankline_enabled then
        print("Indent lines enabled")
    else
        print("Indent lines disabled")
    end
end

-- Create a key mapping to toggle indent lines
vim.api.nvim_set_keymap('n', '<leader>il', ':lua toggle_indent_lines()<CR>', { noremap = true, silent = true })

