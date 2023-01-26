local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local methods = require("null-ls.methods")
local helpers = require("null-ls.helpers")
local function ruff_fix()
  return helpers.make_builtin({
    name = "ruff",
    meta = {
      url = "https://github.com/charliermarsh/ruff/",
      description = "An extremely fast Python linter, written in Rust.",
    },
    method = methods.internal.FORMATTING,
    filetypes = { "python" },
    generator_opts = {
      command = "ruff",
      args = { "--fix", "-e", "-n", "--stdin-filename", "$FILENAME", "-" },
      to_stdin = true
    },
    factory = helpers.formatter_factory
  })
end

null_ls.setup({
  debug = false,
  sources = {
    --ruff fix
    ruff_fix(),
    null_ls.builtins.diagnostics.ruff,

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
    diagnostics.mypy.with({
      filetype = { "python" },
      extra_args = { "--strict" },
    }),
    diagnostics.pyproject_flake8.with({ filetype = { "python" } }),
    diagnostics.jsonlint.with({ filetype = { "json" } }),

    -- typo
    require('typos').actions,
    require('typos').diagnostics,

    -- root dir
    root_dir = function(fname)
      local util = require "lspconfig.util"
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
      return util.root_pattern(unpack(root_files))(fname) or util.root_pattern ".git" (fname) or util.path.dirname(fname)
    end,
  },
})
