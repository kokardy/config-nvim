-- matchup
return {
  "andymass/vim-matchup",
  event = { "VimEnter" },
  setup = function()
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
  end,
}
