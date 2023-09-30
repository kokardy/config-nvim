local status_ok, indent_blankline = pcall(require, "ibl")
if not status_ok then
	return
end

-- vim.g.indent_blankline_context_patterns = {
-- 	"class",
-- 	"return",
-- 	"function",
-- 	"method",
-- 	"^if",
-- 	"^while",
-- 	"jsx_element",
-- 	"^for",
-- 	"^object",
-- 	"^table",
-- 	"block",
-- 	"arguments",
-- 	"if_statement",
-- 	"else_clause",
-- 	"jsx_element",
-- 	"jsx_self_closing_element",
-- 	"try_statement",
-- 	"catch_clause",
-- 	"import_statement",
-- 	"operation_type",
-- }

-- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
vim.wo.colorcolumn = "99999"

indent_blankline.setup({
	show_current_context = true,
	scope = {
		enabled = true,
	},
	exclude = {
		buftypes = { "terminal", "nofile" },
		filetypes = {
			"''",
			"NvimTree",
			"TelescopePrompt",
			"TelescopeResults",
			"Trouble",
			"checkhealth",
			"dashboard",
			"gitcommit",
			"help",
			"help",
			"lspinfo",
			"man",
			"neogitstatus",
			"packer",
			"startify",
		},
	},
})
