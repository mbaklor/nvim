return {
    { 'tpope/vim-surround' },
    {
        'andymass/vim-matchup',
        init = function()
            -- may set any options here
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
            vim.g.matchup_surround_enabled = 1
        end
    },
    { "RRethy/vim-illuminate" }
}
