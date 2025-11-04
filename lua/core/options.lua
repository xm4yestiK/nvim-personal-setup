-- ~/.config/nvim/lua/core/options.lua
local opt = vim.opt

-- Tampilan & Editor
opt.number = false          -- Matiin nomor baris (Sesuai request lo)
opt.relativenumber = false  -- Matiin nomor baris relatif
opt.signcolumn = 'yes'      -- WAJIB: Sediain kolom buat ikon error 
opt.wrap = false            -- Jangan nge-wrap baris panjang
opt.scrolloff = 8           -- Jaga jarak 8 baris pas scroll

-- Indentasi
opt.tabstop = 4             -- Ukuran tab
opt.shiftwidth = 4          -- Ukuran indent
opt.expandtab = false       -- Pake TAB asli, bukan spasi (Sesuai request lo)

-- Lain-lain
opt.mouse = 'a'             -- Aktifin mouse

--
-- == PENGATURAN TRANSPARANSI (Best Practice) ==
--
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*", -- Berlaku buat semua tema
  callback = function()
    -- Set background editor utama
    vim.api.nvim_set_hl(0, "Normal", { bg = "None" })
    
    -- Set background pop-up (menu autocomplete, dll)
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None" })
  end,
})
