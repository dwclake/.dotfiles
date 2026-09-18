-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = false

vim.opt.textwidth = 0
vim.opt.wrapmargin = 0
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.showbreak = "|—/ "
vim.opt.breakindentopt = "shift:4,min:20"
vim.opt.linebreak = true

vim.opt.colorcolumn = "80"

vim.opt.winborder = "rounded"
vim.opt.guicursor =
	"n-v-c-sm:block-blinkwait300-blinkon700-blinkoff300,i-ci-ve:ver30-blinkwait300-blinkon700-blinkoff300,r-cr-o:hor25-blinkwait300-blinkon700-blinkoff300"
