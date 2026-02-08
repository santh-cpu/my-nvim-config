return {
  {
    "williamboman/mason.nvim",
    config = true,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    opts = {
      ensure_installed = {
        "pyright",
        "rust_analyzer",
        "tsserver",
        "jdtls",
        "clangd",
        "gopls",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      -- go-only diagnostic filter
      local orig = vim.lsp.handlers["textDocument/publishDiagnostics"]
      vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
        if ctx and ctx.bufnr then
          local ft = vim.bo[ctx.bufnr].filetype
          if ft == "go" and result and result.diagnostics then
            result.diagnostics = vim.tbl_filter(function(d)
              return d.code ~= "ST1003" and d.code ~= "ST1005"
            end, result.diagnostics)
          end
        end
        return orig(err, result, ctx, config)
      end

      vim.lsp.handlers["textDocument/hover"] =
        vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

      vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

      local on_attach = function(_, bufnr)
        local k = vim.keymap.set
        local o = { buffer = bufnr }

        k("n", "gd", vim.lsp.buf.definition, o)
        k("n", "gD", vim.lsp.buf.declaration, o)
        k("n", "gi", vim.lsp.buf.implementation, o)
        k("n", "gr", vim.lsp.buf.references, o)

        k("n", "K", vim.lsp.buf.hover, o)
        k("n", "<leader>rn", vim.lsp.buf.rename, o)
        k("n", "<leader>ca", vim.lsp.buf.code_action, o)

        k("n", "[d", vim.diagnostic.goto_prev, o)
        k("n", "]d", vim.diagnostic.goto_next, o)
        k("n", "<leader>e", vim.diagnostic.open_float, o)

        k("n", "<leader>f", function()
          vim.lsp.buf.format({ async = true })
        end, o)
      end

      local servers = {
        pyright = {},
        rust_analyzer = {},
        tsserver = {},
        jdtls = {},
        clangd = {},
        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
              analyses = {
                unusedparams = true,
                shadow = true,
              },
              staticcheck = true,
            },
          },
        },
      }

      for name, opts in pairs(servers) do
        vim.lsp.config(name, vim.tbl_extend("force", {
          on_attach = on_attach,
        }, opts))
        vim.lsp.enable(name)
      end
    end,
  },
}
