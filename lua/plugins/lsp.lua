-- ~/.config/nvim/lua/plugins/lsp.lua

-- Definisikan 'on_attach' (keymap) di paling atas
local on_attach = function(client, bufnr)
  local bufmap = function(keys, func)
    vim.keymap.set('n', keys, func, { buffer = bufnr })
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

-- List plugin-nya
return {
  -- A. "App Store" buat LSP Server
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end
  },

  -- B. "Colokan" (LSPConfig)
  {
    "neovim/nvim-lspconfig",
    
    -- KUNCI #1: Paksa lspconfig nunggu Kanagawa (tema) selesai
    dependencies = {"catppuccin/nvim"},
    
    config = function()
      -- KUNCI #2: Definisikan ikon SEKARANG
      -- (Aman, karena tema udah ke-load & warna 'DiagnosticWarn' ada)
      local signs = { Error = " ", Warn = " ", Hint = "💡", Info = " " }
      vim.fn.sign_define("DiagnosticSignError", { text = signs.Error, texthl = "DiagnosticError" })
      vim.fn.sign_define("DiagnosticSignWarn", { text = signs.Warn, texthl = "DiagnosticWarn" })
      vim.fn.sign_define("DiagnosticSignHint", { text = signs.Hint, texthl = "DiagnosticHint" })
      vim.fn.sign_define("DiagnosticSignInfo", { text = signs.Info, texthl = "DiagnosticInfo" })

      -- Setup tampilan error/warning
      vim.diagnostic.config({
        virtual_text = false,
        signs = true, 
        underline = true,
      })
    end
  },

  -- C. "Lem" (Mason-LSPConfig)
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {"williamboman/mason.nvim", "neovim/nvim-lspconfig"},
    opts = {
      -- List server yg mau di-install
      ensure_installed = {
        "rust_analyzer", "gopls", "bashls", "dockerls", "yamlls",
        "lua_ls", "groovyls", "jsonls", "taplo", "intelephense", "html",
      },
      
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({
            on_attach = on_attach,
          })
        end,
        ["lua_ls"] = function()
          require("lspconfig").lua_ls.setup({
            on_attach = on_attach,
            settings = { Lua = { diagnostics = { globals = { "vim" } } } }
          })
        end,
        -- Fix HTML di dalem PHP
        ["html"] = function ()
          require("lspconfig").html.setup({
            on_attach = on_attach,
            filetypes = { "html", "php" } 
          })
        end
      }
    }
  },
}
