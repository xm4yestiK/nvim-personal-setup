-- ~/.config/nvim/init.lua

-- 1. Setup 'lazy.nvim' (Plugin Manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 2. Panggil Opsi Dasar (WAJIB sebelum plugin)
require("core.options")

-- 3. Set Keymap Dasar
vim.g.mapleader = " " -- <leader> jadi Spasi
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Buka File Explorer (Netrw)" })

-- 4. Suruh lazy.nvim nge-load semua plugin dari folder 'lua/plugins'
require("lazy").setup("plugins")
