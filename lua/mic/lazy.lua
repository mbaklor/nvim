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
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local sep = '/'
            local telescope = require("telescope")
            local telescopeConfig = require("telescope.config")
            local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

            table.insert(vimgrep_arguments, "--path-separator")
            table.insert(vimgrep_arguments, "/")


            table.insert(vimgrep_arguments, "--glob")
            table.insert(vimgrep_arguments, "!{.git/*}")

            telescope.setup({
                defaults = {
                    vimgrep_arguments = vimgrep_arguments
                },
                pickers = {
                    find_files = {
                        hidden = true,
                        find_command = {
                            "rg",
                            "--files",
                            "--color",
                            "never",
                            '--glob',
                            '!{.git/*}',
                            "--path-separator",
                            sep,
                        }
                    }
                }
            })
        end
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
        config = function()
            require('gitsigns').setup {
                on_attach = function(bufnr)
                    local gitsigns = require('gitsigns')

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map('n', ']c', function()
                        if vim.wo.diff then
                            vim.cmd.normal({ ']c', bang = true })
                        else
                            gitsigns.nav_hunk('next')
                        end
                    end)

                    map('n', '[c', function()
                        if vim.wo.diff then
                            vim.cmd.normal({ '[c', bang = true })
                        else
                            gitsigns.nav_hunk('prev')
                        end
                    end)

                    -- Actions
                    map('n', '<leader>hs', gitsigns.stage_hunk)
                    map('n', '<leader>hr', gitsigns.reset_hunk)
                    map('v', '<leader>hs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
                    map('v', '<leader>hr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
                    map('n', '<leader>hS', gitsigns.stage_buffer)
                    map('n', '<leader>hu', gitsigns.undo_stage_hunk)
                    map('n', '<leader>hR', gitsigns.reset_buffer)
                    map('n', '<leader>hp', gitsigns.preview_hunk)
                    map('n', '<leader>hb', function() gitsigns.blame_line { full = true } end)
                    map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
                    map('n', '<leader>hd', gitsigns.diffthis)
                    map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
                    map('n', '<leader>td', gitsigns.toggle_deleted)

                    -- Text object
                    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
                end
            }
        end,
        event = "VeryLazy"
    },
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'auto',
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = true,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                    }
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = {
                        {
                            'filename',
                            path = 1
                        }
                    },
                    lualine_x = { 'encoding', 'fileformat', 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' }
                },
                inactive_sections = {},
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {}
            }
        end,
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
    { 'brenoprata10/nvim-highlight-colors' },
    { "ziontee113/color-picker.nvim",      config = true }

})
