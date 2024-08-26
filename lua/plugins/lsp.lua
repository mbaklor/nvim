return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' }, -- Required
        {
            -- Optional
            'williamboman/mason.nvim',
            build = function()
                vim.cmd('MasonUpdate')
            end,
        },
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },     -- Required
        { 'hrsh7th/cmp-nvim-lsp' }, -- Required
        { 'L3MON4D3/LuaSnip' },     -- Required
        { 'hrsh7th/cmp-nvim-lsp-signature-help' },
        { 'hrsh7th/cmp-buffer' },
    },
    config = function()
        local lsp = require('lsp-zero')
        lsp.preset({})

        local augroup = vim.api.nvim_create_augroup
        local autocmd = vim.api.nvim_create_autocmd
        lsp.on_attach(function(client, bufnr)
            local opts = { buffer = bufnr, remap = false }
            lsp.default_keymaps({ buffer = bufnr, exclude = { "<F2>", "<F3>", "<F4>" } })

            vim.keymap.set("n", "<leader>crn", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set({ "n", "x" }, "<leader>crf", function() vim.lsp.buf.format() end, opts)
            vim.keymap.set("n", "<leader>cra", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
            vim.keymap.set("n", "gl", ":lua vim.diagnostic.setqflist()<CR>", opts)
            local save_group = augroup('CursorHighlight', {})
            autocmd('BufWritePre', {
                group = save_group,
                callback = function()
                    vim.lsp.buf.format()
                    print("saving")
                end
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
    end
}
