vim.api.nvim_create_autocmd(
    {
        "BufNewFile",
        "BufRead",
    },
    {
        pattern = "*.mls",
        command = "setfiletype pascal"
    }
)
vim.api.nvim_create_autocmd(
    {
        "BufNewFile",
        "BufRead",
    },
    {
        pattern = "*.bcl",
        command = "setfiletype basic"
    }
)
