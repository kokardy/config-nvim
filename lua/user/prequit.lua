-- すべての通常バッファが閉じられたらNeovimを終了する
vim.api.nvim_create_autocmd('QuitPre', {
  callback = function()
    -- 現在のウィンドウを取得
    local current_win = vim.api.nvim_get_current_win()
    local wins = vim.api.nvim_list_wins()

    -- 閉じた後に残る通常バッファの数をカウント
    local normal_buf_count = 0
    for _, win in ipairs(wins) do
      if win ~= current_win then
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].buftype == '' then
          normal_buf_count = normal_buf_count + 1
        end
      end
    end

    -- 通常バッファが1つ以下（閉じようとしているもののみ）なら終了
    if normal_buf_count <= 1 then
      vim.cmd.only({ bang = true })
    end
  end,
})
