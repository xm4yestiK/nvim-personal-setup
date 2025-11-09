return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua", "vim", "vimdoc",
        "bash",
        "dockerfile",
        "yaml",
        "json",
        "toml",
        "go",
        "rust",
        "python",
        "php",
        "html",
        "groovy"
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = false }, 
    })
  end
}
