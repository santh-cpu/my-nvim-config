return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Highlight groups
    vim.api.nvim_set_hl(0, "AlphaAscii", { fg = "#A766B2", bold = true })
    vim.api.nvim_set_hl(0, "AlphaBlock", { fg = "#A766B2", bold = true })
    vim.api.nvim_set_hl(0, "AlphaName",  { fg = "#00FFFF", bold = true })

    dashboard.section.header.val = {
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "                                                             ░██                                                                         ░██                      ",
      "                                                             ░██                                                                                                  ",
      " ░████████  ░███████   ░███████   ░███████   ░███████     ░████████  ░██████   ░██    ░██     ░███████   ░███████   ░███████   ░██████   ░██░████████   ░███████  ",
      "░██    ░██ ░██    ░██ ░██    ░██ ░██        ░██    ░██       ░██          ░██   ░██  ░██     ░██    ░██ ░██    ░██ ░██    ░██       ░██  ░██░██    ░██ ░██    ░██ ",
      "░██    ░██ ░█████████ ░█████████  ░███████  ░█████████       ░██     ░███████    ░█████      ░██        ░██    ░██ ░██         ░███████  ░██░██    ░██ ░█████████ ",
      "░██   ░███ ░██        ░██               ░██ ░██              ░██    ░██   ░██   ░██  ░██     ░██    ░██ ░██    ░██ ░██    ░██ ░██   ░██  ░██░██    ░██ ░██        ",
      " ░█████░██  ░███████   ░███████   ░███████   ░███████         ░████  ░█████░██ ░██    ░██     ░███████   ░███████   ░███████   ░█████░██ ░██░██    ░██  ░███████  ",
      "       ░██                                                                                                                                                        ",
      " ░███████                                                                                                                                                         ",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
    }

    dashboard.section.header.opts.position = "center"
    dashboard.section.header.opts.hl = {
      { { "AlphaBlock", 0, -1 } },
      { { "AlphaBlock", 0, -1 } },
      { { "AlphaBlock", 0, -1 } },
      { { "AlphaBlock", 0, -1 } },
      { { "AlphaBlock", 0, -1 } },
      { { "AlphaBlock", 0, -1 } },
      { { "AlphaBlock", 0, -1 } },
      { { "AlphaBlock", 0, -1 } },
      { { "AlphaBlock", 0, -1 } },
      { { "AlphaBlock", 0, -1 } },
      { { "AlphaBlock", 0, -1 } },
      { { "AlphaBlock", 0, -1 } },
      { { "AlphaBlock", 0, -1 } },
      { { "AlphaBlock", 0, -1 } },
      { { "AlphaBlock", 0, -1 } },
      { { "AlphaBlock", 0, -1 } },
      { { "AlphaBlock", 0, -1 } },
      { { "AlphaBlock", 0, -1 } },
      { { "AlphaBlock", 0, -1 } },
      { { "AlphaBlock", 0, -1 } },
      { { "AlphaBlock", 0, -1 } },
      { { "AlphaBlock", 0, -1 } },
      { { "AlphaBlock", 0, -1 } },
    }

    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find File",       ":Telescope find_files<CR>"),
      dashboard.button("g", "  Live Grep",        ":Telescope live_grep<CR>"),
      dashboard.button("r", "  Recent",           ":Telescope oldfiles<CR>"),
      dashboard.button("s", "  Restore Session",  ":lua require('persistence').load()<CR>"),
      dashboard.button("n", "  New File",         ":ene<CR>"),
      dashboard.button("q", "  Quit",             ":qa<CR>"),
    }

    dashboard.section.buttons.opts.position = "center"
    alpha.setup(dashboard.config)
  end,
}
