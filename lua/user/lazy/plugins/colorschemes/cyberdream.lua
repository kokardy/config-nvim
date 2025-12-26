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
      }
    })

  end,
}
