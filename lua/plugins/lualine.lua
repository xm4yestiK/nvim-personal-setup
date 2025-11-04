-- ~/.config/nvim/lua/plugins/lualine.lua
return {
  'nvim-lualine/lualine.nvim',

  -- GANTI "BOS"-nya balik ke 'catppuccin/nvim'
  dependencies = { 'catppuccin/nvim', 'nvim-tree/nvim-web-devicons' },

  config = function()
    require('lualine').setup({
      options = {
        -- GANTI TEMA-nya balik ke 'catppuccin'
        theme = 'catppuccin', 

        icons_enabled = true,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {},
        always_divide_middle = true,
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {{'filename', path = 1}},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
    })
  end,
}
