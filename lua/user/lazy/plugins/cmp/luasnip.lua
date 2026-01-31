--snippet engine
return {
  "L3MON4D3/LuaSnip",
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets/vscode" } })
    require("luasnip.loaders.from_snipmate").lazy_load({ paths = { "./snippets/snipmate" } })
  end,
}
