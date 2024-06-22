local config_for_japanese_markdown = function()
	print("japanese_markdown!!!!")
end

vim.api.nvim_create_augroup("japanese_markdown", {})
vim.api.nvim_create_autocmd("Filetype", {
	pattern = "japanese_markdown",
	group = "japanese_markdown",
	callback = config_for_japanese_markdown,
})
