-- cmdbuf
-- ex-modeをバッファで開く
return {
  "notomo/cmdbuf.nvim",
  config = function()
    vim.keymap.set("n", "q:", function()
      require("cmdbuf").split_open(vim.o.cmdwinheight)
    end)
  end,
}
