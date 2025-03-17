return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ignore_install = {},
            auto_install = true,
            ensure_installed = { "c", "cpp", "bash", "lua", "vim", "vimdoc", "query", "java", "python" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
