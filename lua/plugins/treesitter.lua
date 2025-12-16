-- stolen from the config of someone on reddit, sorry I forgot to save the credit
-- this is a lesson to me to always write things down as soon as I steal them :(
local function install_and_start()
	-- Auto-install and start treesitter parser for any buffer with a registered filetype
	vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
		callback = function(event)
			local bufnr = event.buf
			local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })
			-- Skip if no filetype
			if filetype == "" then
				return
			end

			-- Get parser name based on filetype
			local parser_name = vim.treesitter.language.get_lang(filetype) -- WARNING: might return filetype (not helpful)
			if not parser_name then
				return
			end

			-- Check if parser_name is available in parser configs
			local parser_configs = require("nvim-treesitter.parsers")
			local parser_can_be_used = nil
			parser_can_be_used = parser_configs[parser_name]

			if not parser_can_be_used then
				return -- Parser not ailable, skip silently
			end

			local parser_installed = pcall(vim.treesitter.get_parser, bufnr, parser_name)

			-- If not installed, install parser synchronously
			if not parser_installed then
				require("nvim-treesitter").install({ parser_name }):wait(30000) -- main branch syntax
				vim.notify("Installed parser: " .. parser_name, vim.log.levels.INFO, { title = "core/treesitter" })
			end

			-- Check so tree-sitter can see the newly installed parser
			parser_installed = pcall(vim.treesitter.get_parser, bufnr, parser_name)
			if not parser_installed then
				vim.notify(
					"Failed to get parser for " .. parser_name .. " after installation",
					vim.log.levels.WARN,
					{ title = "core/treesitter" }
				)
				return
			end

			-- Start treesitter for this buffer
			vim.treesitter.start(bufnr, parser_name)
		end,
	})
end

-- TODO figure out treesitter main migrartion
return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		config = function()
			-- TODO: figure out auto-install

			local ensure_installed = {
				"javascript",
				"typescript",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"go",
				"css",
				"html",
				"svelte",
			}
			require("nvim-treesitter").install(ensure_installed)
			--register(ensure_installed)
			install_and_start()
			-- local alreadyInstalled = require("nvim-treesitter.config").get_installed()
			-- local parsersToInstall = vim.iter(ensureInstalled)
			-- 	:filter(function(parser)
			-- 		return not vim.tbl_contains(alreadyInstalled, parser)
			-- 	end)
			-- 	:totable()
			-- ts.install(parsersToInstall)

			-- vim.api.nvim_create_autocmd("FileType", {
			-- 	pattern = ensure_installed,
			-- 	callback = function()
			-- 		-- local installed = require("nvim-treesitter.config").get_installed()
			-- 		-- local current_ft = vim.bo.filetype
			-- 		-- for _, ft in ipairs(installed) do
			-- 		-- 	if ft == current_ft then
			-- 		vim.treesitter.start()
			-- 		-- 		end
			-- 		-- 	end
			-- 	end,
			-- })
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = {
			enable = true,
		},
	},
}
