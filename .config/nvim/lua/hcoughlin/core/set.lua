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

-- Create an autocmd for C/C++ files
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = { "c", "cpp" },
--     callback = function()
--         -- Set the key mapping for block comment
--         vim.keymap.set('n', '<leader>bc', function()
--             vim.api.nvim_put({ '/**', ' * ', ' */' }, 'l', true, true)
--             vim.cmd('normal! kA')
--         end, { buffer = true, noremap = true, silent = true })
--     end,
-- })
-- Create an autocmd for C/C++ files
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = { "c", "cpp" },
--     callback = function()
--         -- Set the key mapping for block comment
--         vim.keymap.set('n', '<leader>bc', function()
--             -- Save current cursor position
--             local cursor_pos = vim.api.nvim_win_get_cursor(0)
--             -- Insert the block comment lines
--             vim.api.nvim_put({ '/**', ' * ', ' */' }, 'l', true, true)
--             -- Restore the cursor to the second line (' * ') and move to the end of the line in insert mode
--             vim.api.nvim_win_set_cursor(0, {cursor_pos[1] + 1, 3}) -- Set cursor to ' * ' line, at the end of ' * '
--             vim.cmd('startinsert!') -- Enter insert mode
--         end, { buffer = true, noremap = true, silent = true })
--     end,
-- })
-- Create an autocmd for C/C++ files
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = { "c", "cpp" },
--     callback = function()
--         -- Set the key mapping for block comment
--         vim.keymap.set('n', '<leader>bc', function()
--             -- Insert the block comment lines
--             vim.api.nvim_put({ '/**', ' * ', ' */' }, 'l', true, true)
--             -- Move the cursor to the middle line (2nd line) after the ' * ' and enter insert mode
--             local current_row = vim.api.nvim_win_get_cursor(0)[1] -- Get current row
--             vim.api.nvim_win_set_cursor(0, {current_row - 1, 3})  -- Move to the 2nd line, after '* '
--             vim.cmd('startinsert!') -- Enter insert mode
--         end, { buffer = true, noremap = true, silent = true })
--     end,
-- })
-- Create an autocmd for C/C++ files
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp" },
    callback = function()
        -- Set the key mapping for block comment
        vim.keymap.set('n', '<leader>bc', function()
            -- Get the current row where the cursor is located before inserting the comment
            local current_row = vim.api.nvim_win_get_cursor(0)[1]

            -- Function to find the indentation of the nearest previous indented line
            local function get_nearest_indent()
                for i = current_row - 1, 1, -1 do
                    local line_indent = vim.fn.indent(i)
                    if line_indent > 0 then
                        return line_indent
                    end
                end
                return 0 -- Fallback to no indentation if no previous indented line is found
            end

            -- Get the nearest indentation level
            local indent = get_nearest_indent()

            -- Prepare the block comment lines with indentation
            local comment_lines = {
                string.rep(" ", indent) .. "/**",
                string.rep(" ", indent) .. " * ",
                string.rep(" ", indent) .. " */",
            }

            -- Insert the block comment lines
            vim.api.nvim_put(comment_lines, 'l', true, true)

            -- After inserting, move the cursor to the second line (the ' * ' line)
            vim.api.nvim_win_set_cursor(0, {current_row + 2, indent + 3})  -- Move to the second line after ' * '
            vim.cmd('startinsert!') -- Enter insert mode
        end, { buffer = true, noremap = true, silent = true })
    end,
})
