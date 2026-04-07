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
      local go_diags_enabled = false
      local py_diags_enabled = true

      local function set_go_diags(bufnr, enabled)
        vim.diagnostic.enable(enabled, { bufnr = bufnr })
      end

      local function set_py_diags(bufnr, enabled)
        vim.diagnostic.enable(enabled, { bufnr = bufnr })
      end

      -- Go toggle
      vim.api.nvim_create_user_command("GoDiagToggle", function()
        go_diags_enabled = not go_diags_enabled
        for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
          if vim.bo[bufnr].filetype == "go" then
            set_go_diags(bufnr, go_diags_enabled)
          end
        end
        vim.notify(
          "go diagnostics " .. (go_diags_enabled and "enabled" or "disabled"),
          vim.log.levels.INFO
        )
      end, {})

      -- Python toggle
      vim.api.nvim_create_user_command("PyDiagToggle", function()
        py_diags_enabled = not py_diags_enabled
        for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
          if vim.bo[bufnr].filetype == "python" then
            set_py_diags(bufnr, py_diags_enabled)
          end
        end
        vim.notify(
          "python diagnostics " .. (py_diags_enabled and "enabled" or "disabled"),
          vim.log.levels.INFO
        )
      end, {})

      -- UI improvements
      vim.lsp.handlers["textDocument/hover"] =
        vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

      vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

      local on_attach = function(_, bufnr)
        if vim.bo[bufnr].filetype == "go" then
          set_go_diags(bufnr, go_diags_enabled)
        end

        if vim.bo[bufnr].filetype == "python" then
          set_py_diags(bufnr, py_diags_enabled)
        end

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
        k("n", "<leader>de", vim.diagnostic.open_float, o)

        k("n", "<leader>f", function()
          vim.lsp.buf.format({ async = true })
        end, o)

        -- toggles
        k("n", "<leader>gd", "<cmd>GoDiagToggle<cr>", o)

        if vim.bo[bufnr].filetype == "python" then
          k("n", "pd", "<cmd>PyDiagToggle<cr>", o)
        end
      end

      local servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",        -- less strict
                diagnosticMode = "openFilesOnly", -- only current files
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
              },
            },
          },
        },

        rust_analyzer = {},
        tsserver = {},
        jdtls = {},
        clangd = {},

        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
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
