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
