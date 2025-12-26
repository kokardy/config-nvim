-- colorscheme

-- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#222222" })
-- vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#222222" })

vim.api.nvim_create_augroup("TransparentBG", {})
vim.api.nvim_create_autocmd("ColorScheme", {
	group = "TransparentBG",
	callback = function()
		-- vim.api.nvim_set_hl(0, "Normal", { cterm = nil })
		-- vim.api.nvim_set_hl(0, "NonText", { cterm = nil })
		-- vim.api.nvim_set_hl(0, "LineNr", { cterm = nil })
		-- vim.api.nvim_set_hl(0, "Folded", { cterm = nil })
		vim.api.nvim_set_hl(0, "EndOfBuffer", { cterm = nil })
		vim.api.nvim_set_hl(0, "Comment", { fg = "#FF00FF" })
	end,
})

vim.cmd([[
try
  colorscheme cyberdream

catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])
