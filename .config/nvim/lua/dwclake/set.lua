vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.textwidth = 0
vim.opt.wrapmargin = 0
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.showbreak = "|—/ "
vim.opt.breakindentopt = "shift:4,min:20"
vim.opt.linebreak = true
vim.opt.columns = 90

-- aaaaaaaa aaaaaaaaaaa aaaaaaaaaaa aaaaaaaaaa aaaaaaaa a a aaaaaaa a aaaaa aa aaaaaaaa a aaaaaaaaaaaaaaaa

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.winborder = 'rounded'
