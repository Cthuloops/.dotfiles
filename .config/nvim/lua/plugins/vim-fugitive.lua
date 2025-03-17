return {
    "tpope/vim-fugitive",

    config = function()

    local set = vim.keymap.set

    set("n", "<leader>gs", vim.cmd.Git, {desc = "git status, thanks TPope/Primeagen"})
    set("n", "<leader>gp", function()
            vim.cmd.Git('push')
        end, {desc = "Push current commit"})
    set("n", "<leader>ga", function()
            vim.cmd.Git('add %')
        end, {desc = "Add current file to commit"})
    set("n", "<leader>gc", function()
            vim.cmd.Git('commit')
        end, {desc = "Commit"})

    end
}
