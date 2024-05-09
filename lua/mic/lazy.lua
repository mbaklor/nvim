local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({


    {
        'prichrd/netrw.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = { use_devicons = true }
    },

    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        config = function()
            vim.cmd("colorscheme catppuccin-frappe")
        end
    },

    {
        'lewis6991/gitsigns.nvim',
        config = true,
        event = "VeryLazy"
    },
    {
        'nvim-lualine/lualine.nvim',
        config = true,
        lazy = false
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = true
    },
    { 'mbbill/undotree' },
    { 'tpope/vim-fugitive' },
    { "nvim-treesitter/nvim-treesitter-context" },

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp-signature-help' },
            { 'hrsh7th/cmp-buffer' },
        }
    },
    { "jose-elias-alvarez/null-ls.nvim" },
    {
        'numToStr/Comment.nvim',
        config = true,
        event = "BufEnter"
    },
    { 'tpope/vim-surround' },
    {
        'kristijanhusak/vim-dadbod-ui',
        dependencies = {
            {
                'tpope/vim-dadbod',
                lazy = true
            },
            {
                'kristijanhusak/vim-dadbod-completion',
                ft = { 'sql', 'mysql', 'plsql' },
                lazy = true
            },
        },
        cmd = {
            'DBUI',
            'DBUIToggle',
            'DBUIAddConnection',
            'DBUIFindBuffer',
        },
        init = function()
            -- Your DBUI configuration
            vim.keymap.set("n", "<leader>db", function()
                vim.cmd("DBUIToggle")
            end)
            vim.g.db_ui_use_nerd_fonts = 1
        end,
    },
    {
        'andymass/vim-matchup',
        init = function()
            -- may set any options here
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
            vim.g.matchup_surround_enabled = 1
        end
    },
    { "RRethy/vim-illuminate" },
    { 'brenoprata10/nvim-highlight-colors' }

})
