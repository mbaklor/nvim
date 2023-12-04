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
