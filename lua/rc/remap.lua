vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-u>", "<C-u>zzzv")
vim.keymap.set("n", "<C-d>", "<C-d>zzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")


vim.keymap.set("n", "<A-J>", ":m +1<CR>==")
vim.keymap.set("n", "<A-K>", ":m -2<CR>==")

vim.keymap.set("v", "<A-K>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<A-J>", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "<leader>o", "o<ESC>")
vim.keymap.set("n", "<leader>O", "O<ESC>")

vim.keymap.set("n", "<leader>t", function()
    local term = vim.fn.bufnr("term")
    local win = vim.fn.bufwinnr(term)
    if win > 0 then
        vim.cmd(win .. 'wincmd w')
    else
        vim.cmd("split")
        if term > 0 then
            vim.cmd('buf ' .. term)
        else
            vim.cmd("term")
        end
    end
    vim.cmd("startinsert")
end)
vim.api.nvim_create_user_command('Hd',
    function()
        require("hardtime").setup()
    end,
    {})
