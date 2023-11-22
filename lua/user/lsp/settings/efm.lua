return {
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
				{ formatCommand = "black -", formatStdin = true },
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
				{
					lintCommand = "cspell lint",
					lintStdin = false,
					rootMarkers = { "cspell.yaml" },
				},
			},

			-- yaml
			yaml = {
				{
					lintCommand = "cspell lint",
					lintStdin = false,
					rootMarkers = { "cspell.yaml" },
				},
			},

			-- spectral
			openapi = {
				-- リダイレクトでテストできる
				-- { lintCommand = "echo OK >> /tmp/yaml.log", lintStdin = false },
				{
					lintCommand = "spectral lint -f text -F hint",
					lintStdin = false,
					rootMarkers = { ".spectral.yaml" },
				},
				{
					lintCommand = "cspell lint",
					lintStdin = false,
					rootMarkers = { "cspell.yaml" },
				},
			},
		},
	},
}
