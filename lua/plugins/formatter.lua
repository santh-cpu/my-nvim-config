return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      python = { "black" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      rust = { "rustfmt" },
      c = { "clang_format" },
      cpp = { "clang_format" },
      java = { "google_java_format" },
    },

    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },

  config = function(_, opts)
    require("conform").setup(opts)

    vim.keymap.set("n", "<leader>F", function()
      require("conform").format()
    end, { desc = "Format file" })
  end,
}

