local M = {}
local notify = require("notify").instance()

local yoshi = {
  "             /＼  ／ヽ",
  "            {／￣￣￣ヽ!",
  "            ∠＿＿╋＿＿ｊ",
  " :w ヨシ!   / (.)八(.)  ヽ",
  "           ｛=/(人_)=|´￣)｀ヽ",
  "            ＼ { {_,ﾉ ﾉ   //~ `",
  "        ⊂￣ヽ_＞―――‐''’,〈   (＿)",
  "         `ヘ(＿ ィ r―‐γ   !",
  "              _,ﾉ j   |   |",
  "            ｛   ｛    ﾉ  /＼",
  "             ＼ス￣￣￣lしｲ＼ ＼",
  "            (￣ ）     j /   ＼_j＼",
  "             ￣￣     ( ｀ヽ   ＼__)",
  "                       ＼__ﾉ",
}


M.show = function()
  notify.notify(yoshi, "info", {
    timeout = 100,
    animate = false,
  })
end

vim.api.nvim_create_user_command('Yoshi', M.show, {})

vim.cmd([[
  augroup yoshi
    autocmd!
    autocmd BufWritePost * :Yoshi
  augroup end
]])


return M
