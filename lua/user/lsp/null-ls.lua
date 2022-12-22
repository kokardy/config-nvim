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
  sources = {
    -- format
    formatting.prettier.with({
      filetypes = { "javascript", "typescript", "json" },
      extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
    }),
    formatting.isort.with({ filetypes = { "python" } }),
    formatting.black.with({ filetypes = { "python" }, extra_args = { "--fast" } }),
    formatting.remark.with({ filetypes = { "markdown" } }),
    -- formatting.stylua.with({
    --   filetypes = { "lua" },
    --   extra_args = {
    --     "--indent-type=Spaces",
    --     "--indent-width=2",
    --   },
    -- }),

    -- diagnostics
    -- diagnostics.flake8
    diagnostics.mypy.with({ filetype = { "python" }, extra_args = { "--strict" } }),
    diagnostics.pyproject_flake8.with({ filetype = { "python" } }),
    diagnostics.jsonlint.with({ filetype = { "json" } }),
  },
})
