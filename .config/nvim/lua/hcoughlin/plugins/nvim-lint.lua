return {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile', },
    config = function()
        local lint = require('lint')

        -- adding linters to filetypes
        lint.linters_by_ft = {
            python = { 'pylint' },
            --lua = { 'luacheck' },
            cpp = { 'cpplint' },
            java = { 'checkstyle' },
        }

        -- create group / autocommand to run the linter
        local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true})

        vim.api.nvim_create_autocmd({'BufEnter', 'BufWritePost', 'InsertLeave', 'TextChanged' }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })

        vim.keymap.set('n', '<leader>ll', function()
            lint.try_lint()
        end, { desc = 'Trigger linting for current file' })
    end,
}
