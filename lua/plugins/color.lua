return {
    'catppuccin/nvim',
    name = 'catppuccin',
    init = function()
        require("catppuccin").setup({
            transparent_background = true,
            highlight_overrides = {
                all = function(colors)
                    return {
                        TelescopeSelection = {
                            fg = colors.text,
                            bg = colors.surface0,
                        },
                    }
                end,
            }
        })
        vim.cmd("colorscheme catppuccin-frappe")
    end
}
