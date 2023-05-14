vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-u>", "<C-u>zzzv")
vim.keymap.set("n", "<C-d>", "<C-d>zzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")

vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")

vim.keymap.set("n", "<A-+>", "<C-w>+")
vim.keymap.set("n", "<A-->", "<C-w>-")
vim.keymap.set("n", "<A->>", "<C-w>>")
vim.keymap.set("n", "<A-<>", "<C-w><")

vim.keymap.set("n", "<A-s>", "<C-w>s")
vim.keymap.set("n", "<A-v>", "<C-w>v")

vim.keymap.set("n", "<A-o>", "<C-w>o")
vim.keymap.set("n", "<A-c>", "<C-w>c")

vim.keymap.set("n", "<A-J>", "<cmd>m +1<CR>==")
vim.keymap.set("n", "<A-K>", "<cmd>m -2<CR>==")

vim.keymap.set("v", "<A-K>", "<cmd>'<,'>m '<-2<CR>gv=gv")
vim.keymap.set("v", "<A-J>", "<cmd>'<,'>m '>+1<CR>gv=gv")

vim.keymap.set("n", "<leader>t", function()
    vim.cmd("split")
    local term = vim.fn.bufnr("term")
    if term > 0 then
        vim.cmd('buf ' .. term)
    else
        vim.cmd("term")
    end
    vim.cmd("startinsert")
end)
