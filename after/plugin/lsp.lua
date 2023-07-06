local lsp = require('lsp-zero').preset({})

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    local cursor_group = augroup('CursorHighlight', {})
    local save_group = augroup('CursorHighlight', {})
    autocmd('BufWritePre', {
        group = save_group,
        callback = function()
            vim.lsp.buf.format()
            print("saving")
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

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'buffer',                 keyword_length = 3 },
        { name = 'luasnip',                keyword_length = 2 },
    },
    -- mapping = {
    --   ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    --   ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    -- }
})
