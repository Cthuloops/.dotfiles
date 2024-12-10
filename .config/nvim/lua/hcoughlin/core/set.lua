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

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp" },
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
