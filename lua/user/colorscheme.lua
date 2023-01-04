vim.cmd [[
try
  colorscheme darkplus

catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]

vim.api.nvim_set_hl(0, "CursorLine", {bg="#222222"})
vim.api.nvim_set_hl(0, "CursorColumn", {bg="#222222"})
