return {

  -- Mason
  {
    "williamboman/mason.nvim",
    config = true,
  },

  -- Mason LSP bridge
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    opts = {
      ensure_installed = {
        "pyright",
        "rust_analyzer",
        "ts_ls",
        "jdtls",
        "clangd",
      },
    },
  },

  -- Native LSP
  {
    "neovim/nvim-lspconfig",
    config = function()

      -- UI polish
      vim.lsp.handlers["textDocument/hover"] =
        vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

      vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

      -- On attach keymaps
      local on_attach = function(_, bufnr)
        local k = vim.keymap.set
        local o = { buffer = bufnr }

        k("n","gd",vim.lsp.buf.definition,o)
        k("n","gD",vim.lsp.buf.declaration,o)
        k("n","gi",vim.lsp.buf.implementation,o)
        k("n","gr",vim.lsp.buf.references,o)

        k("n","K",vim.lsp.buf.hover,o)
        k("n","<leader>rn",vim.lsp.buf.rename,o)
        k("n","<leader>ca",vim.lsp.buf.code_action,o)

        k("n","[d",vim.diagnostic.goto_prev,o)
        k("n","]d",vim.diagnostic.goto_next,o)
        k("n","<leader>e",vim.diagnostic.open_float,o)

        k("n","<leader>f",function()
          vim.lsp.buf.format({ async = true })
        end,o)
      end

      -- Servers
      local servers = {
        pyright = {},
        rust_analyzer = {},
        ts_ls = {},
        jdtls = {},
        clangd = {},
      }

      for name, opts in pairs(servers) do
        vim.lsp.config(name, vim.tbl_extend("force", {
          on_attach = on_attach,
        }, opts))
        vim.lsp.enable(name)
      end
    end
  }
}

