local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	diagnostics_format = "#{m} (#{c})",
	sources = {

		-- python
		diagnostics.ruff.with({
			filetypes = { "python" },
		}),
		diagnostics.mypy.with({
			filetype = { "python" },
			extra_args = { "--strict" },
		}),
		formatting.isort.with({ filetypes = { "python" } }),
		formatting.black.with({ filetypes = { "python" }, extra_args = { "--fast" } }),

		-- javascript
		formatting.prettier.with({
			filetypes = { "javascript", "typescript", "json" },
			extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
		}),

		-- markdown
		formatting.remark.with({ filetypes = { "markdown" } }),

		-- json
		diagnostics.jsonlint.with({ filetype = { "json" } }),

		-- typo
		require("typos").actions,
		require("typos").diagnostics,

		-- root dir
		root_dir = function(fname)
			local util = require("lspconfig.util")
			local root_files = {
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
			}
			local root = util.root_pattern(unpack(root_files))(fname)
				or util.root_pattern(".git")(fname)
				or util.path.dirname(fname)
			return root
		end,
	},
})
