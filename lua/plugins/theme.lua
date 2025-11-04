return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      integrations = {}
    })
    vim.cmd.colorscheme "catppuccin"
  end
}

