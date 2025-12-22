-- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
vim.wo.colorcolumn = "99999"

return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    -- show_current_context = true,
    scope = {
      enabled = true,
    },
    exclude = {
      buftypes = { "terminal", "nofile" },
      filetypes = {
        "''",
        "NvimTree",
        "oil",
        "TelescopePrompt",
        "TelescopeResults",
        "Trouble",
        "checkhealth",
        "dashboard",
        "gitcommit",
        "help",
        "lspinfo",
        "man",
        "neogitstatus",
        "packer",
        "startify",
      },
    },
  }
}
