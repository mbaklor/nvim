return {
	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = {
			enable = true,
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")

			config.setup({
				-- A list of parser names, or "all" (the five listed parsers should always be installed)
				ensure_installed = { "javascript", "typescript", "lua", "vim", "vimdoc", "query", "go" },

				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,

				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
				auto_install = true,

				---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
				-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

				highlight = {
					enable = true,

					-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
					-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
					-- Using this option may slow down your editor, and you may see some duplicate highlights.
					-- Instead of true it can also be a list of languages
					additional_vim_regex_highlighting = false,
				},
			})
		end,
	},
}

--[[ TODO figure out treesitter main migrartion
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		config = function()
			-- TODO: figure out auto-install

			local ts = require("nvim-treesitter")

			local ensureInstalled = {
				"javascript",
				"typescript",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"go",
			}
			local alreadyInstalled = require("nvim-treesitter.config").get_installed()
			local parsersToInstall = vim.iter(ensureInstalled)
				:filter(function(parser)
					return not vim.tbl_contains(alreadyInstalled, parser)
				end)
				:totable()
			ts.install(parsersToInstall)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = ensureInstalled,
				callback = function()
					-- local installed = require("nvim-treesitter.config").get_installed()
					-- local current_ft = vim.bo.filetype
					-- for _, ft in ipairs(installed) do
					-- 	if ft == current_ft then
					vim.treesitter.start()
					-- 		end
					-- 	end
				end,
			})
		end,
	},
--]]
