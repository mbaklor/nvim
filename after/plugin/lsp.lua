local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
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
