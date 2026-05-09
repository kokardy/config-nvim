-- colorscheme

-- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#222222" })
-- vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#222222" })

vim.cmd([[
try
  colorscheme cyberdream

catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])

-- ポップアップの背景色と枠線の色を設定する
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#ffffff", bg = "#1e1e1e" })
