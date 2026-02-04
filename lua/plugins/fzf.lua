return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "BufEnter",
		---@module "fzf-lua"
		---@type fzf-lua.Config|{}
		---@diagnostics disable: missing-fields
		opts = { "telescope", files = { git_icons = true }, oldfiles = { git_icons = true } },
		---@diagnostics enable: missing-fields
		keys = {
			{ "<leader>ff", "<cmd>FzfLua files<cr>", desc = "fzf files" },
			{
				"<leader>fj",
				function()
					FzfLua.files({ cwd = vim.fn.expand("%:p:h") })
				end,
				desc = "fzf files in buffer directory",
			},
			{ "<leader>fo", "<cmd>FzfLua oldfiles cwd_only=true<cr>", desc = "fzf files" },
			{ "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "fzf buffers" },
			{ "<leader>fs", "<cmd>FzfLua grep<cr>", desc = "fzf grep" },
			{ "<leader>fl", "<cmd>FzfLua live_grep<cr>", desc = "fzf live grep project" },
			{ "<leader>fg", "<cmd>FzfLua lgrep_curbuf<cr>", desc = "fzf live grep current" },
			{ "<leader>gl", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "fzf live grep project" },
			{ "<leader>gr", "<cmd>FzfLua lsp_references<cr>", desc = "fzf live grep project" },
			{ "gO", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "Open Document Symbols" },
			{ "gW", "<cmd>FzfLua lsp_workspace_symbols<cr>", desc = "Open Workspace Symbols" },
			{ "grt", "<cmd>FzfLua lsp_typedefs<cr>", desc = "[G]oto [T]ype Definition" },
		},
	},
}
