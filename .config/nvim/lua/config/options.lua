local opt = vim.opt

-- Show absolute line number for current line and relative jumps
opt.number = true
opt.relativenumber = true

-- tabs
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.shiftround = true

-- indenting
opt.smartindent = true

-- no wrap
opt.wrap = false

-- search highlight and incremental search
opt.hlsearch = false
opt.incsearch = true

-- colors
opt.termguicolors = true

-- Keep 8 rows between the cursor and the edge of the window when scrolling vertically
opt.scrolloff = 8
-- Same as scrolloff but for columns, I hate it.
-- opt.sidescrolloff = 20

-- idk
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

-- set column color at column 80
opt.colorcolumn = "80"
