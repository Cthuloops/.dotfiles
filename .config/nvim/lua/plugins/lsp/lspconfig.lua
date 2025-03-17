return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    config = function()
      -- Add lsp keymaps only when the lsp is attached.
      local set = vim.keymap.set
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Buffer local mappings
          -- See ':help vim.lsp.*' for documentation.
          local opts = { buffer = ev.buf, silent = true }
          local builtin = require("telescope.builtin")

          opts.desc = "Show LSP references"
          set("n", "gR", builtin.lsp_references, opts)

          opts.desc = "Go to declaration"
          set("n", "gD", vim.lsp.buf.declaration, opts)

          opts.desc = "Show LSP defintions"
          set("n", "gd", builtin.lsp_definitions, opts)

          opts.desc = "Show LSP implementations"
          set("n", "gi", builtin.lsp_implementations, opts)

          opts.desc = "Show LSP type definitions"
          set("n", "gtd", builtin.lsp_type_definitions, opts)

          opts.desc = "See available code actions"
          set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts)

          opts.desc = "Smart rename"
          set("n", "<leader>rn", vim.lsp.buf.rename, opts)

          opts.desc = "Show buffer diagnostics"
          set("n", "<leader>D", builtin.diagnostics, opts)

          opts.desc = "Show line diagnostics"
          set("n", "<leader>d", vim.diagnostic.open_float, opts)

          opts.desc = "Go to previous diagnostic"
          set("n", "[d", vim.diagnostic.goto_prev, opts)

          opts.desc = "Go to next diagnostic"
          set("n", "]d", vim.diagnostic.goto_next, opts)

          opts.desc = "LSP hover"
          set("n", "K", vim.lsp.buf.hover, opts)

          opts.desc = "Restart LSP"
          set("n", "<leader>rs", ":LspRestart<CR>", opts)

          opts.desc = "Signature help"
          set({"n", "i"}, "<C-k>", vim.lsp.buf.signature_help, opts)

        end,
      })
      -- Setup language servers.
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup {}
      lspconfig.pyright.setup {}
      lspconfig.zls.setup {}
    end,
  }
}

