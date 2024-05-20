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
