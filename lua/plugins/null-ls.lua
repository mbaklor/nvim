return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.prettierd,
                null_ls.builtins.formatting.black,
                -- null_ls.builtins.diagnostics.flake8.with({ extra_args = { "--max-line-length", "160" } }),
                null_ls.builtins.diagnostics.pylint.with({
                    extra_args = {
                        "--disable", "missing-class-docstring",
                        "--disable", "missing-function-docstring",
                        "--disable", "missing-module-docstring",
                        "--disable", "unspecified-encoding",
                        "--disable", "import-error"
                    }
                }),
            }
        })
    end
}
