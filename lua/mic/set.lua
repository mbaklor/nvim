vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = (os.getenv("HOME") or os.getenv("USERPROFILE")) .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.laststatus = 3

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.termguicolors = true

if vim.uv.os_uname().sysname == "Windows_NT" then
	vim.opt.shell = "pwsh"
	vim.opt.shellcmdflag = "-nologo -noprofile -ExecutionPolicy RemoteSigned -command"
	vim.opt.shellxquote = ""
end

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.exrc = true

if vim.version().minor >= 12 then
	require("vim._extui").enable({
		enable = true,
		msg = {
			pos = "box",
			box = {
				timeout = 4000,
			},
		},
	})
end

vim.g.mapleader = " "
