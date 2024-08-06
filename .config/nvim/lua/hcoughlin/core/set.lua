-- Make space into leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bind Explore command to space+pv (brings you back to netrw)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Explore"})

-- move your visual select around
-- vim.keymap.set("v", "J", ":m '>+0<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '<-3<CR>gv=gv")

-- Appends line beneath to current line + a space without moving the cursor
-- vim.keymap.set("n", "J", "mzJ'z")

-- allows half page jumping while keeping cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep cursor in the middle while searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- deleting to void register
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")
-- delete vis selection to void register while pasting
vim.keymap.set("x", "<leader>p", "\"_dP")

-- asbjornHaland keymap + register(systemclipboard) yanks to clip
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- saves changes when in vertical edit mode (not that i know how to get to that) (i actually figured it out lol <C-v>)
vim.keymap.set("i", "<C-c>", "<Esc>")

-- search and replace interactive for current word in the whole document
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- undotree
vim.keymap.set('n', '<leader>ut', vim.cmd.UndotreeToggle)

-- Nerd font
--vim.g.have_nerd_font = true

--vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { desc = "opens split w/ locations for diagnostic messages" })
