local opt = vim.opt

opt.number = true
opt.relativenumber = false
opt.signcolumn = 'no'
opt.wrap = false
opt.scrolloff = 8

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = false

opt.mouse = 'a'

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "None" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None" })
  end,
})

