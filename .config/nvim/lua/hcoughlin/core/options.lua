--lua.init Line numbers + relative
vim.opt.nu = true
vim.opt.relativenumber = true

-- tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.shiftround = true

-- indenting
vim.opt.smartindent = true

-- no wrap
vim.opt.wrap = false

-- search highlight and incremental search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- colors
vim.opt.termguicolors = true

-- keep 8 rows when scrolling
vim.opt.scrolloff = 8

-- idk
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- set column color at column 80
vim.opt.colorcolumn = "80"
