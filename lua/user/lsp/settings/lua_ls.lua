return {
	cmd = { "lua-language-server" },
	settings = {

		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				preloadFileSize = 3000,
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
			format = false,
		},
	},
}
