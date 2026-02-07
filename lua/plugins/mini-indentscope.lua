return {
  "echasnovski/mini.indentscope",
  version = false,
  init = function()
    -- Disable by default (raw-dog mode)
    vim.g.miniindentscope_disable = true
  end,
  opts = {
    symbol = "▏",
    options = {
      try_as_border = true,
    },
  },
  keys = {
    {
      "<leader>i",
      function()
        vim.g.miniindentscope_disable =
          not vim.g.miniindentscope_disable
        vim.cmd("redraw")
      end,
      desc = "Toggle indent scope",
    },
  },
}
