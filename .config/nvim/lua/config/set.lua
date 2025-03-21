-- Make space into leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local set = vim.keymap.set

-- Keybind set(mode, keys, command, { description })

-- Bind explore command
set("n", "<leader>fv", vim.cmd.Ex, { desc = "Explore" })

-- move your visual select around
--set("v", "J", ":m '>+0<CR>gv=gv")
--set("v", "K", ":m '<-3<CR>gv=gv")

-- Keep cursor in the middle during half-page jumps
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")

-- Keep cursor in the middle while searching
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

-- Delete to the void register (don't delete into the paste buffer)
set("n", "<leader>d", "\"_d")
set("v", "<leader>d", "\"_d")
-- Delete visual selection to the void register while pasting
set("x", "<leader>p", "\"_dP")


-- asbjornHaland keymap, yank to system clipboard
set("n", "<leader>y", "\"+y")
set("v", "<leader>y", "\"+y")
set("n", "<leader>Y", "\"+Y")


-- Search and replace, interactive, for the whole file, for the word the cursor is over.
set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")


-- undo tree (I should move this to undotree?)
set("n", "<leader>ut", vim.cmd.UndoTreeToggle, { desc = "toggle UndoTree" })


-- Source current file
set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Source current file" })


-- Execute lua
set("n", "<leader>x", ":.lua<CR>", { desc = "Execute whole file" })
set("v", "<leader>x", ":lua<CR>", { desc = "Execute visual selection" })

--set('n', '<space>q', vim.diagnostic.setloclist, { desc = "opens split w/ locations for diagnostic messages" })
