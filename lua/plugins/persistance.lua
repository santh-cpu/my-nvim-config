return {
  "folke/persistence.nvim",

  event = "BufReadPre",

  opts = {
    dir = vim.fn.stdpath("state") .. "/sessions/",
    options = { "buffers", "curdir", "tabpages", "winsize" },
  },

  keys = {
    {
      "<leader>s",
      function() require("persistence").load() end,
      desc = "Restore session",
    },
    {
      "<leader>S",
      function() require("persistence").load({ last = true }) end,
      desc = "Restore last session",
    },
    {
      "<leader>ss",
      function() require("persistence").select() end,
      desc = "Select session",
    },
  },
}
