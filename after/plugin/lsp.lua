local lsp = require('lsp-zero')

lsp.preset('recommended')

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

