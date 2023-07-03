require("rc.packer")
require("rc.set")
require("rc.remap")
require("rc.filetypes")

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

require("lsp-zero").on_attach(function()
    local cursor_group = augroup('CursorHighlight', {})
    autocmd('BufWritePre', {
        callback = function()
            vim.lsp.buf.format()
        end
    })
    autocmd({ 'CursorHold', 'CursorHoldI' }, {
        group = cursor_group,
        callback = function()
            vim.lsp.buf.document_highlight()
        end,
    })
    autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        group = cursor_group,
        callback = function()
            vim.lsp.buf.clear_references()
        end,
    })
end)

local highlight = augroup('HighlightCssColor', {})
autocmd('BufReadPost', {
    group = highlight,
    pattern = '*.css,*.vue',

    callback = function()
        local color = require('nvim-highlight-colors')
        color.setup {}
        color.turnOn()
    end,
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
