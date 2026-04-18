-- Treesitter
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  init = function()
    vim.treesitter.language.register("yaml", { "yaml", "openapi" })
  end,

  config = function()
    local ensure_installed = {
      "lua",
      "python",
      "javascript",
      "typescript",
      "markdown",
      "yaml",
      "toml",
      "json",
      "html",
      "htmldjango",
      "go",
    }
    require("nvim-treesitter").install(ensure_installed)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}
