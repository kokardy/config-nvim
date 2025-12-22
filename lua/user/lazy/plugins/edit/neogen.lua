-- document
return {
  "danymat/neogen",
  config = function()
    require("neogen").setup({
      enabled = true,
      snippet_engine = "luasnip",
      languages = {
        python = {
          template = {
            annotation_convention = "google_docstrings", -- for a full list of annotation_conventions, see supported-languages below,
            --[[ annotation_convention = "numpydoc", ]]
            --[[ annotation_convention = "reST", ]]
          },
        },
      },
    })
  end,
  dependencies = {
    { "nvim-treesitter/nvim-treesitter" },
  },
}
