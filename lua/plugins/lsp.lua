return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local signs = { Error = " ", Warn = " ", Hint = "💡", Info = " " }
      vim.fn.sign_define("DiagnosticSignError", { text = signs.Error, texthl = "DiagnosticError" })
      vim.fn.sign_define("DiagnosticSignWarn", { text = signs.Warn, texthl = "DiagnosticWarn" })
      vim.fn.sign_define("DiagnosticSignHint", { text = signs.Hint, texthl = "DiagnosticHint" })
      vim.fn.sign_define("DiagnosticSignInfo", { text = signs.Info, texthl = "DiagnosticInfo" })

      vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true,
      })

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local on_attach = function(client, bufnr)
        local bufmap = function(keys, func)
          vim.keymap.set('n', keys, func, { buffer = bufnr, silent = true, desc = client.name .. " Map" })
        end

        bufmap('K', vim.lsp.buf.hover)
        bufmap('gd', vim.lsp.buf.definition)
        bufmap('gr', vim.lsp.buf.references)
        bufmap('gi', vim.lsp.buf.implementation)
        bufmap('[d', vim.diagnostic.goto_prev)
        bufmap(']d', vim.diagnostic.goto_next)
        bufmap('<leader>ca', vim.lsp.buf.code_action)
        bufmap('<leader>rn', vim.lsp.buf.rename)
      end

      require("mason-lspconfig").setup({
        ensure_installed = {
          "rust_analyzer", "gopls", "bashls", "dockerls", "yamlls",
          "lua_ls", "groovyls", "jsonls", "taplo", "intelephense", "html",
        },
        handlers = {
          ['*'] = function(server_name)
            require("lspconfig")[server_name].setup({
              on_attach = on_attach,
              capabilities = capabilities,
            })
          end,

          ["lua_ls"] = function()
            require("lspconfig").lua_ls.setup({
              on_attach = on_attach,
              capabilities = capabilities,
              settings = { Lua = { diagnostics = { globals = { "vim" } } } },
            })
          end,
          ["html"] = function ()
            require("lspconfig").html.setup({
              on_attach = on_attach,
              capabilities = capabilities,
              filetypes = { "html", "php" }
            })
          end
        }
      })
    end
  },
}
