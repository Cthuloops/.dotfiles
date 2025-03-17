return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "BurntSushi/ripgrep",
  },

  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")


    telescope.setup({
      defaults = {
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<C-p>"] = actions.move_selection_previous, -- move to prev result
            ["<C-n>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    -- set keymaps
    local set = vim.keymap.set
    local builtin = require("telescope.builtin")

    set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" })
    set("n", "<leader>fs", builtin.live_grep, { desc = "Find string in cwd" })
    set("n", "<leader>fh", builtin.help_tags, { desc = "Search Help Tags" })

  end,
}
