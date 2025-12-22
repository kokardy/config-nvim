-- Treesitter
return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      -- parser_install_dir = parser_dir,

      --[[ ensure_installed = "all", -- one of "all" or a list of languages ]]
      ensure_installed = {
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
      },
      sync_install = false,
      auto_install = false,
      ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
      highlight = {
        enable = true,               -- false will disable the whole extension
        disable = {},                -- list of language that will be disabled
      },
      autopairs = {
        enable = true,
      },
      indent = { enable = true, disable = { "python", "css" } },
    })

    vim.treesitter.language.register("yaml", { "yaml", "openapi" })
  end,
}
