local M = {}

local yoshi = {
	"             /＼  ／ヽ",
	"            {／￣￣￣ヽ!",
	"            ∠＿＿╋＿＿ｊ",
	"    ヨシ!   / (.)八(.)  ヽ",
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
	-- create method
	-- opt.timeout = 300
	-- opt.animate = false
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
	title = "保存ヨシ!",
	timeout = 250,
	animate = false,
	render = "simple",
	stages = "slide",
})

return M
