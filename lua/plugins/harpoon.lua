return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { "<leader>a", function() require("harpoon"):list():add() end },
        { "<C-e>", function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end },

        { "<A-q>", function() require("harpoon"):list():select(1) end },
        { "<A-w>", function() require("harpoon"):list():select(2) end },
        { "<A-e>", function() require("harpoon"):list():select(3) end },
        { "<A-r>", function() require("harpoon"):list():select(4) end },

        -- Toggle previous & next buffers stored within Harpoon list
        { "<C-A-P>", function() require("harpoon"):list():prev() end },
        { "<C-A-N>", function() require("harpoon"):list():next() end },

    }
}
