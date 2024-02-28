local rootMakers = {
	python = {
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"pyrightconfig.json",
		"requirements.txt",
		-- "manage.py",
	},
	go = {
		"go.mod",
	},
	javascript = {
		"package.json",
	},
}
return {
	init_options = { documentFormatting = true },
	settings = {
		rootMarkers = {
			-- "Pipfile",
			".git",
		},

		languages = {
			-- lua
			lua = {
				{ formatCommand = "stylua -", formatStdin = true },
			},

			-- python
			python = {
				{
					formatCommand = "isort -",
					formatStdin = true,
					rootMakers = rootMakers.python,
				},
				{
					formatCommand = "black -",
					formatStdin = true,
					rootMakers = rootMakers.python,
				},
				{
					formatCommand = "ruff --stdin-filename ${INPUT} --fix --exit-zero --quiet -",
					formatStdin = true,
					rootMakers = rootMakers.python,
				},

				{ lintCommand = "ruff -", rootMakers = rootMakers.python },
				{
					lintCommand = "rye run mypy --strict --show-column-numbers",
					rootMakers = rootMakers.python,
					lintIgnoreExitCode = true,
				},
				-- { lintCommand = "rye run mypy --strict --show-column-numbers", rootMakers = rootMakers.python },
			},

			-- json
			-- json = {
			-- 	{ formatCommand = "prettier"},
			-- },

			-- javascript
			javascript = {
				{ formatCommand = "prettier --single-quote", rootMakers = rootMakers.javascript },
			},

			-- jsx
			javascriptreact = {
				{
					formatCommand = "prettier --no-semi --single-quote --jsx-single-quote",
					rootMakers = rootMakers.javascript,
				},
			},

			-- markdown
			markdown = {
				{ formatCommand = "remark", formatStdin = true },
				{
					lintCommand = "cspell lint --no-progress --no-summary --no-color",
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
					lintCommand = "cspell lint --no-progress --no-summary --no-color ",
					lintStdin = false,
					rootMarkers = { "cspell.yaml" },
				},
			},
		},
	},
}
