local function send_to_agy()
  -- ビジュアル選択範囲の開始行と終了行を取得
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")
  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
  local text = table.concat(lines, "\n") .. "\r"

  -- 開いているターミナルバッファを探して送信
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].buftype == "terminal" then
      local chan = vim.bo[buf].channel
      vim.api.nvim_chan_send(chan, text)
      return
    end
  end
  vim.notify("ターミナルバッファが見つかりません", vim.log.levels.WARN)
end

-- ビジュアルモードで <Leader>s を押して実行
vim.keymap.set("v", "<Leader>s", function()
  -- ビジュアル選択のマーク('<, '>)を確定させてから関数を呼ぶ
  local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
  vim.api.nvim_feedkeys(esc, "x", false)
  send_to_agy()
end, { desc = "Send selection to agy terminal" })
