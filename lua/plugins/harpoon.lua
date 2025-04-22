return {
    'mbaklor/harpoon',
    branch = 'harpoon2',
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup({
            settings = {
                save_on_toggle = true,
                sync_on_ui_close = true
            },
        })

        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set("n", "<A-q>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<A-w>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<A-e>", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<A-r>", function() harpoon:list():select(4) end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<C-A-P>", function() harpoon:list():prev() end)
        vim.keymap.set("n", "<C-A-N>", function() harpoon:list():next() end)
    end,
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {

    }
}
