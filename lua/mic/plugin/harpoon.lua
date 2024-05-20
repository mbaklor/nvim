local harpoon = require("harpoon")

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<A-q>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<A-w>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<A-e>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<A-r>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-A-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-A-N>", function() harpoon:list():next() end)
