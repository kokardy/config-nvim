local function set_filetype_based_on_first_line()
  local first_line = vim.fn.getline(1)

  if first_line:match("^openapi *:") then
    vim.bo.filetype = "openapi"
  elseif first_line:match("bash$") then
    vim.bo.filetype = "bash"
    -- elseif first_line:match('^%%PDF') then
    --     vim.bo.filetype = 'pdf'
    -- else
    --     vim.bo.filetype = 'txt'
    -- -- 他の判定条件を追加
  end
end

-- vim.cmd([[autocmd BufReadPost * lua set_filetype_based_on_first_line()]])

vim.api.nvim_create_augroup("myFileType", {})

-- detect filetype by first line
vim.api.nvim_create_autocmd("BufReadPost", {
  group = "myFileType",
  callback = function()
    set_filetype_based_on_first_line()
  end,
})

-- nginx.conf
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  group = "myFileType",
  pattern = { "nginx.conf*" },
  callback = function(ev)
    vim.bo.filetype = "nginx"
  end,
})
-- nuejs
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  group = "myFileType",
  pattern = { "*.nue" },
  callback = function(ev)
    -- print(string.format("event fired: %s", vim.inspect(ev)))
    vim.bo.filetype = "html.nue"
  end,
})
