return {
  dir = vim.fn.stdpath("config") .. "/lua/local/autorun",
  name = "autorun",
  config = function()
    require("local.autorun").setup()
  end,
}

