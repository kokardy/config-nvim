-- colorscheme

vim.api.nvim_set_hl(0, "CursorLine", { bg = "#222222" })
vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#222222" })

vim.api.nvim_create_augroup("TransparentBG", {})
vim.api.nvim_create_autocmd("ColorScheme", {
	group = "TransparentBG",
	callback = function()
		vim.api.nvim_set_hl(0, "Normal", { cterm = nil })
		vim.api.nvim_set_hl(0, "NonText", { cterm = nil })
		vim.api.nvim_set_hl(0, "LineNr", { cterm = nil })
		vim.api.nvim_set_hl(0, "Folded", { cterm = nil })
		vim.api.nvim_set_hl(0, "EndOfBuffer", { cterm = nil })
		vim.api.nvim_set_hl(0, "NvimTreeNormal", { cterm = nil })
		vim.api.nvim_set_hl(0, "NvimTreeBg", { cterm = nil })
		vim.api.nvim_set_hl(0, "Comment", { fg = "#FF00FF" })
		vim.api.nvim_set_option("winhighlight", "Normal:NvimTreeBg")
	end,
})

vim.cmd([[
try
  colorscheme dracula

catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])
