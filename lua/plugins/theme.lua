-- ~/.config/nvim/lua/plugins/theme.lua
return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000, -- WAJIB: Pastiin dia ke-load paling duluan

  config = function()
    require("catppuccin").setup({
        -- Kita GAK USAH set transparansi di sini.
        -- File options.lua lo udah ngatur itu pake autocmd.
        -- Ini lebih bagus & universal.
        integrations = {}
    })

    -- Panggil tema barunya
    vim.cmd.colorscheme "catppuccin"
  end
}
