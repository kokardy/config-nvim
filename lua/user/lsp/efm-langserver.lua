local M = {}

M.setup = function()
	require("lspconfig").efm.setup({
		init_options = { documentFormatting = true },
		settings = {
			rootMarkers = {
				"pyproject.toml",
				"package.json",
				"setup.py",
				"setup.cfg",
				"requirements.txt",
				"Pipfile",
				"manage.py",
				"pyrightconfig.json",
				"go.mod",
				".git",
			},

			languages = {
				-- lua
				lua = {
					{ formatCommand = "stylua -", formatStdin = true },
				},
				-- python
				python = {
					{ formatCommand = "isort -", formatStdin = true },
					{ formatCommand = "black -" },
					{ lintCommand = "ruff -" },
					{ lintCommand = "mypy --strict --show-column-numbers" },
				},
				-- json
				-- json = {
				-- 	{ formatCommand = "prettier"},
				-- },

				-- javascript
				javascript = {
					{ formatCommand = "prettier --single-quote" },
				},

				-- jsx
				javascriptreact = {
					{ formatCommand = "prettier --no-semi --single-quote --jsx-single-quote" },
				},

				-- markdown
				markdown = {
					{ formatCommand = "remark", formatStdin = true },
				},
			},
		},
	})
end

return M
