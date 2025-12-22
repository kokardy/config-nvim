-- asterisk
return {
  "rapan931/lasterisk.nvim",
  config = function()
    vim.keymap.set("n", "*", function()
      require("lasterisk").search()
    end)
    vim.keymap.set("n", "g*", function()
      require("lasterisk").search({ is_whole = false })
    end)
    vim.keymap.set("x", "g*", function()
      require("lasterisk").search({ is_whole = false })
    end)

    -- not support visual asterisk & is_whole = true
    -- vim.keymap.set('x', '*',  function() require("lasterisk").search() end)
  end,
}
