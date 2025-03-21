return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "BurntSushi/ripgrep",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },

  config = function()
    local telescope = require("telescope")


    telescope.setup({
      defaults = {
        path_display = { "truncate " },
      },
      extensions = {
        fzf = {},
      }
    })

    require("telescope").load_extension("fzf")

    -- set keymaps
    local set = vim.keymap.set
    local builtin = require("telescope.builtin")

    set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" })
    set("n", "<leader>fs", builtin.live_grep, { desc = "Find string in cwd" })
    set("n", "<leader>fh", builtin.help_tags, { desc = "Search Help Tags" })
    set("n", "<M-j>", "<cmd>cnext<CR>", { desc = "Next item qlist" })
    set("n", "<M-k>", "<cmd>cprev<CR>", { desc = "Previous item qlist" })
    set("n", "<M-o>", "<cmd>copen<CR>", { desc = "Previous item qlist" })
    set("n", "<M-c>", "<cmd>cclose<CR>", { desc = "Previous item qlist" })

  end,
}
