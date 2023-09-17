local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	-- parser_install_dir = "~/.config/nvim/tsparsers",

	--[[ ensure_installed = "all", -- one of "all" or a list of languages ]]
	ensure_installed = {
		-- "python",
		-- "svelte",
		-- "javascript",
		-- "typescript",
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
