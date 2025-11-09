return {
  "ianklapouch/wildberries.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("wildberries").setup()
    vim.cmd.colorscheme "wildberries"
  end
}
