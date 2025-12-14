return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      view = {
        width = 30,
        side = "left",
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          show = {
            git = true,
            file = true,
            folder = true,
            folder_arrow = true,
          },
        },
      },
      actions = {
        open_file = {
          quit_on_open = false,
        },
      },
      git = {
        enable = true,
        ignore = false,
      },
    })

    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
    vim.keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>", { desc = "Find File in Explorer" })
  end,
}
