-- colorscheme
return {
  "scottmckendry/cyberdream.nvim",

  config = function()
    local ok, cyberdream = pcall(require, "cyberdream")
    if not ok then
      return
    end
    cyberdream.setup({
      transparent = true,
      options = {
        theme = "auto",
      },
      highlights = {
        Comment = { fg = "#FF00FF" },
        Visual = { bg = "#225555" },
        LineNr = { fg = "#BBBBBB" },
        CursorLineNr = { bg = "blue", fg = "yellow", },
      },
    })
  end,
}
