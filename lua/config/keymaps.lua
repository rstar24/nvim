-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps her
--
-- set shorter name for keymap function
--

local kmap = vim.keymap.set

-- F5 processes the document once, and refreshes the view
kmap({ "n", "v", "i" }, "<F5>", function()
  require("knap").process_once()
end)

-- F6 closes the viewer application, and allows settings to be reset
kmap({ "n", "v", "i" }, "<F6>", function()
  require("knap").close_viewer()
end)

-- F7 toggles the auto-processing on and off
kmap({ "n", "v", "i" }, "<F7>", function()
  require("knap").toggle_autopreviewing()
end)

-- F8 invokes a SyncTeX forward search, or similar, where appropriate
kmap({ "n", "v", "i" }, "<F8>", function()
  require("knap").forward_jump()
end)

----this is the dap keybinds----

kmap("n", "<F5>", require("dap").continue)
kmap("n", "<F10>", require("dap").step_over)
kmap("n", "<F11>", require("dap").step_into)
kmap("n", "<F12>", require("dap").step_out)
kmap("n", "<leader>b", require("dap").toggle_breakpoint)

---#it ends here #-----
