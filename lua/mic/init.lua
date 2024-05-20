require("mic.set")
require("mic.remap")
require("mic.lazy")
require("mic.filetypes")
require("mic.plugin")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})


autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 100,
        })
    end,
})

local highlight = augroup('HighlightCssColor', {})
autocmd('BufReadPost', {
    group = highlight,
    pattern = '*.css,*.vue',

    callback = function()
        local color = require('nvim-highlight-colors')
        color.setup {
            render = "virtual",
            virtual_symbol = '■',
            enable_named_colors = true,
            enable_tailwind = true
        }
        color.turnOn()
    end,
})
autocmd('BufLeave', {
    group = highlight,
    pattern = '*.css,*.vue',
    callback = function()
        local color = require('nvim-highlight-colors')
        color.turnOff()
    end,
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
