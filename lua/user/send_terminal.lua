local function is_alive_terminal(buf)
  if not vim.api.nvim_buf_is_valid(buf) or not vim.api.nvim_buf_is_loaded(buf) then
    return false
  end
  if vim.bo[buf].buftype ~= "terminal" then
    return false
  end
  local chan = vim.bo[buf].channel
  return chan ~= nil and chan > 0 and vim.fn.jobwait({ chan }, 0)[1] == -1
end

local function is_ai_terminal(buf)
  local name = vim.api.nvim_buf_get_name(buf)
  return name:match("claude") ~= nil or name:match("agy") ~= nil
end

local function find_target_terminals()
  local visible_ai, visible_other = {}, {}
  local hidden_ai, hidden_other = {}, {}
  local seen = {}

  -- 現在タブに表示中のターミナルを優先
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local buf = vim.api.nvim_win_get_buf(win)
    if not seen[buf] and is_alive_terminal(buf) then
      seen[buf] = true
      if is_ai_terminal(buf) then
        table.insert(visible_ai, buf)
      else
        table.insert(visible_other, buf)
      end
    end
  end

  if #visible_ai > 0 then
    return visible_ai
  end
  if #visible_other > 0 then
    return visible_other
  end

  -- 表示中に無ければ裏にある実行中ターミナルを探す（claude / agy を優先）
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if not seen[buf] and is_alive_terminal(buf) then
      if is_ai_terminal(buf) then
        table.insert(hidden_ai, buf)
      else
        table.insert(hidden_other, buf)
      end
    end
  end

  if #hidden_ai > 0 then
    return hidden_ai
  end
  return hidden_other
end

local function send_text_to_buf(buf, text, submit)
  local chan = vim.bo[buf].channel
  -- Bracketed Paste で囲む（Claude の Vim NORMAL モードや複数行入力に対応）
  local payload = "\27[200~" .. text .. "\27[201~"
  vim.api.nvim_chan_send(chan, payload)
  if submit then
    vim.defer_fn(function()
      if is_alive_terminal(buf) then
        vim.api.nvim_chan_send(chan, "\r")
      end
    end, 150)
  end
end

local function send_selection(opts)
  opts = opts or {}
  local lines = vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos("."), { type = vim.fn.mode() })
  local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
  vim.api.nvim_feedkeys(esc, "nx", false)

  local text = table.concat(lines, "\n")
  if text == "" then
    return
  end

  local targets = find_target_terminals()
  if #targets == 0 then
    vim.notify("送信可能なターミナルバッファが見つかりません", vim.log.levels.WARN)
    return
  elseif #targets == 1 then
    send_text_to_buf(targets[1], text, opts.submit)
  else
    vim.ui.select(targets, {
      prompt = "送信先のターミナルを選択:",
      format_item = function(buf)
        return string.format("[%d] %s", buf, vim.api.nvim_buf_get_name(buf))
      end,
    }, function(choice)
      if choice then
        send_text_to_buf(choice, text, opts.submit)
      end
    end)
  end
end

-- 貼り付けのみ（指示を書き足してから手動で Enter）
vim.keymap.set("x", "<Leader>s", function()
  send_selection({ submit = false })
end, { desc = "Send selection to AI terminal (paste only)" })

-- 貼り付け + 遅延 Enter で即送信
vim.keymap.set("x", "<Leader>S", function()
  send_selection({ submit = true })
end, { desc = "Send selection to AI terminal and submit" })
