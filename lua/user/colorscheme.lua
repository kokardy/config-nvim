vim.cmd [[
try
  colorscheme darkplus

catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]

vim.api.nvim_set_hl(0, "CursorLine", { bg = "#222222" })
vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#222222" })

-- background
vim.api.nvim_set_hl(0, "Normal", { ctermbg = nil })
vim.api.nvim_set_hl(0, "NonText", { ctermbg = nil })
vim.api.nvim_set_hl(0, "LineNr", { ctermbg = nil })
vim.api.nvim_set_hl(0, "Folded", { ctermbg = nil })
vim.api.nvim_set_hl(0, "EndOfBuffer", { ctermbg = nil })

-- TODO: not work
vim.cmd[[
  augroup TransparentBG
    autocmd!
    autocmd Colorscheme * highlight Normal ctermbg=none
    autocmd Colorscheme * highlight NonText ctermbg=none
    autocmd Colorscheme * highlight LineNr ctermbg=none
    autocmd Colorscheme * highlight Folded ctermbg=none
    autocmd Colorscheme * highlight EndOfBuffer ctermbg=none 
  augroup END
]]


