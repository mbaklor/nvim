return {
    'mbbill/undotree',
    keys = {
        { '<leader>u', vim.cmd.UndotreeToggle }
    },
    init = function()
        vim.g.undotree_DiffCommand = "git diff --no-index"
    end
}
