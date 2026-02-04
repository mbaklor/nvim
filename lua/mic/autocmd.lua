local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.hl.on_yank({
			higroup = "IncSearch",
			timeout = 100,
		})
	end,
})

-- local highlight = augroup('HighlightCssColor', {})
-- autocmd('BufReadPost', {
--     group = highlight,
--     pattern = '*.css,*.vue',
--
--     callback = function()
--         local color = require('nvim-highlight-colors')
--         color.setup {
--             render = "virtual",
--             virtual_symbol = '■',
--             enable_named_colors = true,
--             enable_tailwind = true
--         }
--         color.turnOn()
--     end,
-- })
-- autocmd('BufLeave', {
--     group = highlight,
--     pattern = '*.css,*.vue',
--     callback = function()
--         local color = require('nvim-highlight-colors')
--         color.turnOff()
--     end,
-- })

autocmd("BufReadPost", {
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)

		if mark[1] > 0 and mark[1] <= line_count then
			vim.cmd('normal! g`"zz')
		end
	end,
})

local lsp_progress = {}
vim.api.nvim_create_autocmd("LspProgress", {
	group = vim.api.nvim_create_augroup("my.lsp.config", { clear = true }),
	callback = function(ev)
		local value = ev.data.params.value
		local client_id = ev.data.client_id
		local token = ev.data.params.token

		if value.kind == "begin" then
			local client = vim.lsp.get_client_by_id(client_id)
			if not client then
				return
			end
			if not lsp_progress[client_id] then
				lsp_progress[client_id] = {}
			end
			local progress = {
				kind = "progress",
				status = "running",
				percent = value.percentage,
				title = string.format("LspProgress(%s[%d])", client.name, ev.data.client_id),
			}
			lsp_progress[client_id][token] = progress
			progress.id = vim.api.nvim_echo({ { value.title } }, false, progress)
			return
		end

		local progress = lsp_progress[client_id][token]
		if value.kind == "report" then
			progress.percent = value.percentage
			vim.api.nvim_echo({ { value.title } }, false, progress)
		else
			progress.percent = 100
			progress.status = "success"
			vim.api.nvim_echo({ { value.title } }, true, progress)
			lsp_progress[client_id][token] = nil
			if not next(lsp_progress[client_id]) then
				lsp_progress[client_id] = nil
			end
		end
	end,
})
