return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  opts = {
    indent = {
      enabled = true,
      char = "▏",

      -- single subtle highlight, no scope
      hl = "SnacksIndent",

      scope = {
        enabled = false, -- ❌ no blue, no active highlight
      },
    },
  },

  config = function(_, opts)
    require("snacks").setup(opts)

    -- extremely subtle Catppuccin-friendly color
    vim.api.nvim_set_hl(0, "SnacksIndent", {
      fg = "#1e1e2e", -- very close to background (barely visible)
    })
  end,
}
