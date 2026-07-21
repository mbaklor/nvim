return {
	"catppuccin/nvim",
	name = "catppuccin",
	opts = {
		transparent_background = true,
		auto_integrations = true,
	},
	init = function()
		vim.cmd("colorscheme catppuccin-frappe")
	end,
}
