return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local telescope = require 'telescope'
        local actions = require 'telescope.actions'

        -- https://github.com/nvim-telescope/telescope.nvim/issues/2446#issuecomment-2475424902
        -- https://github.com/MagicDuck/grug-far.nvim/pull/305
        -- https://github.com/nvim-neo-tree/neo-tree.nvim/blob/a77af2e764c5ed4038d27d1c463fa49cd4794e07/lua/neo-tree/utils/init.lua#L1057
        local is_windows = vim.fn.has('win64') == 1 or vim.fn.has('win32') == 1
        local vimfnameescape = vim.fn.fnameescape
        local winfnameescape = function(path)
            local escaped_path = vimfnameescape(path)
            if is_windows then
                local need_extra_esc = path:find('[%[%]`%$~]')
                local esc = need_extra_esc and '\\\\' or '\\'
                escaped_path = escaped_path:gsub('\\[%(%)%^&;]', esc .. '%1')
                if need_extra_esc then
                    escaped_path = escaped_path:gsub("\\\\['` ]", '\\%1')
                end
            end
            return escaped_path
        end

        local select_default = function(prompt_bufnr)
            vim.fn.fnameescape = winfnameescape
            local result = actions.select_default(prompt_bufnr, "default")
            vim.fn.fnameescape = vimfnameescape
            return result
        end

        telescope.setup {
            defaults = {
                mappings = {
                    i = {
                        ['<cr>'] = select_default,
                    },
                    n = {
                        ['<cr>'] = select_default,
                    }
                },
            },
        }
    end,
    init = function()
        local builtin = require('telescope.builtin')
        local utils = require('telescope.utils')

        local wrap = function(func, ...)
            local args = { ... }
            return function()
                func(unpack(args))
            end
        end

        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fi', wrap(builtin.find_files, { no_ignore = true }), {})
        vim.keymap.set('n', '<leader>gf', wrap(builtin.find_files, { cwd = utils.buffer_dir() }), {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>fs', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>fg', builtin.grep_string)
        vim.keymap.set('n', '<leader>fl', builtin.live_grep)
        vim.keymap.set('n', '<leader>fz', builtin.current_buffer_fuzzy_find, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

        vim.keymap.set('n', '<leader>gl', builtin.diagnostics, {})
        vim.keymap.set('n', '<leader>gr', builtin.lsp_references, {})
    end
}
