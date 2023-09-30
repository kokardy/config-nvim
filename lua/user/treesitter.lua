local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

-- local parser_dir = "~/.config/nvim/tsparsers"
-- vim.opt.runtimepath:append(parser_dir)

configs.setup({
	-- parser_install_dir = parser_dir,

	--[[ ensure_installed = "all", -- one of "all" or a list of languages ]]
	ensure_installed = {
		"lua",
		"python",
		"svelte",
		"javascript",
		"typescript",
		"markdown",
	},
	sync_install = false,
	auto_install = false,
	ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "css" }, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python", "css" } },
	-- rainbow
	rainbow = {
		enable = true,
		extended_mode = true,
	},
})

vim.treesitter.language.register("yaml", { "yaml", "openapi" })
