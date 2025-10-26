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
set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostic" })
set("n", "grD", vim.lsp.buf.declaration, { desc = "Go to declaration" }) -- go to declaration
set("n", "grd", vim.lsp.buf.definition, { desc = "Show LSP definition" }) -- show lsp definition


vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp", "javascript" },
    callback = function()
        vim.keymap.set('n', '<leader>bc', function()
            local current_row = vim.api.nvim_win_get_cursor(0)[1]
            local shiftwidth = vim.fn.shiftwidth()

            local function get_context_indent()
                local current_line = vim.api.nvim_buf_get_lines(0, current_row-1, current_row, true)[1]
                local base_indent = vim.fn.indent(current_row)

                -- If line ends with opening brace, increase indent
                if current_line:match("{%s*$") then
                    return base_indent + shiftwidth
                end

                -- Look for parent scope's indent
                local scope_level = 0
                for i = current_row, 1, -1 do
                    local line = vim.api.nvim_buf_get_lines(0, i-1, i, true)[1]
                    for _ in line:gmatch("}") do
                        scope_level = scope_level - 1
                    end
                    for _ in line:gmatch("{") do
                        scope_level = scope_level + 1
                        if scope_level > 0 then
                            return vim.fn.indent(i) + shiftwidth
                        end
                    end
                end
                return base_indent
            end

            local indent = get_context_indent()
            local comment_lines = {
                string.rep(" ", indent) .. "/**",
                string.rep(" ", indent) .. " * ",
                string.rep(" ", indent) .. " */"
            }

            vim.api.nvim_buf_set_lines(0, current_row, current_row, true, comment_lines)
            vim.api.nvim_win_set_cursor(0, {current_row + 2, indent + 3})
            vim.cmd('startinsert!')
        end, { buffer = true, noremap = true, silent = true })
    end,
})
