local M = {}

local yoshi = {
	"             /＼  ／ヽ",
	"            {／￣￣￣ヽ!",
	"            ∠＿＿╋＿＿ｊ",
	"保存ヨシ!   / (.)八(.)  ヽ",
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

M.setup = function(opt)
	local notify = require("notify").instance(opt)
	M.show = function()
		notify.notify(yoshi, "info", opt)
	end

	-- create vim command
	vim.api.nvim_create_user_command("Yoshi", M.show, {})

	-- 保存にフック
	vim.cmd([[
    augroup yoshi
      autocmd!
      autocmd BufWritePost * :Yoshi
    augroup end
  ]])
end

M.setup({
	title = "保存しました",
	timeout = 150,
	animate = false,
	render = "simple",
	stages = "slide",
})

return M
