return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Highlight groups
    vim.api.nvim_set_hl(0, "AlphaAscii", { fg = "#A766B2", bold = true })   -- yellow
    vim.api.nvim_set_hl(0, "AlphaBlock", { fg = "#FF8C00" })               -- cyan
    vim.api.nvim_set_hl(0, "AlphaName",  { fg = "#00FFFF", bold = true })   -- purple

    dashboard.section.header.val = {
      " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗",
      " ████╗  ██║██╔════╝██╔═══██╗██║   ██║",
      " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║",
      " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝ ",
      " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ",
      " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ",
      "              santh                ",
      "",
      "                                     :e",
      "                                    'M$\\",
      "                                   sf$$br",
      "                                 J\\J\\J$L$L",
      "                               :d  )fM$$$$$r",
      "                          ..P*\\ .4MJP   '*\\",
      "                 sed\"\"\"\"\"\" ser d$$$F",
      "             .M\\  ..JM$$$B$$$$BJ$MR  ...",
      "            dF  nMMM$$$R$$$$$$$h\"$ks$$\"$$r",
      "          J\\.. .MMM8$$$$$LM$P\\..'**\\    *\\",
      "         d :d$r \"M$$$$br'$M\\d$R",
      "        J\\MM\\ *L   *M$B8MM$B.**",
      "       :fd$>  :fhr 'MRM$$M$$\"",
      "       MJ$>    '5J5..M8$$>",
      "      :fMM     d$Fd$$R$$F",
      "      4M$P .$$*.J*$$**",
      "      M4$> '$>dRdF",
      "      MMM\\   *L*B.",
      "     :$$F     ?k\"Re",
      "   .$$P\\        **'$$B...",
      " :e$F\"               '\"\"\"\"",
    }

    dashboard.section.header.opts.position = "center"

 dashboard.section.header.opts.hl = {
      {{"AlphaAscii",0,100}},
      {{"AlphaAscii",0,100}},
      {{"AlphaAscii",0,100}},
      {{"AlphaAscii",0,100}},
      {{"AlphaAscii",0,100}},
      {{"AlphaAscii",0,100}},
      {{"AlphaName",0,100}},
      {{"AlphaBlock",0,100}},
      {{"AlphaBlock",0,100}},
      {{"AlphaBlock",0,100}},
      {{"AlphaBlock",0,100}},
      {{"AlphaBlock",0,100}},
      {{"AlphaBlock",0,100}},
      {{"AlphaBlock",0,100}},
      {{"AlphaBlock",0,100}},
      {{"AlphaBlock",0,100}},
      {{"AlphaBlock",0,100}},
      {{"AlphaBlock",0,100}},
      {{"AlphaBlock",0,100}},
      {{"AlphaBlock",0,100}},
      {{"AlphaBlock",0,100}},
      {{"AlphaBlock",0,100}},
      {{"AlphaBlock",0,100}},
      {{"AlphaBlock",0,100}},
      {{"AlphaBlock",0,100}},
      {{"AlphaBlock",0,100}},
      {{"AlphaBlock",0,100}},
      {{"AlphaBlock",0,100}},
      {{"AlphaBlock",0,100}},
    }

    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
      dashboard.button("g", "  Live Grep", ":Telescope live_grep<CR>"),
      dashboard.button("r", "  Recent", ":Telescope oldfiles<CR>"),
      dashboard.button("s", "  Restore Session", ":lua require('persistence').load()<CR>"),
      dashboard.button("n", "  New File", ":ene<CR>"),
      dashboard.button("q", "  Quit", ":qa<CR>"),
    }

    dashboard.section.buttons.opts.position = "center"

    alpha.setup(dashboard.config)
  end,
}

