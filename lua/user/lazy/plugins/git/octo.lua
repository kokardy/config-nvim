-- github
return {
  "pwntester/octo.nvim",
  event = { "VimEnter" },
  dependencies = {
    { "nvim-lua/plenary.nvim",         opt = true },
    { "nvim-telescope/telescope.nvim", opt = true },
    { "kyazdani42/nvim-web-devicons",  opt = true },
  },
  config = function()
    require("octo").setup({
      ssh_aliases = {
        ["github"] = "github.com",
      }, -- SSH aliases. e.g. `ssh_aliases = {["github.com-work"] = "github.com"}`
    })
  end,
}
