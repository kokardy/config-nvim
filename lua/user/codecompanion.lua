local _M = {}

local params = {
  opts = {
    laungage = "Japanese",
    log_level = "DEBUG", -- or "TRACE"
  },
  display = {
    chat = {
      auto_scroll = false,
    },
  },
  strategies = {
    chat = {
      adapter = "copilot",
    },
    inline = {
      adapter = "copilot",
    },
    cmd = {
      adapter = "copilot",
    },
  },
  -- [追加]
  adapters = {
    -- copilotアダプタを上書き
    copilot = function()
      -- 既定のcopilotアダプタをベースに
      return require("codecompanion.adapters").extend("copilot", {
        schema = {
          model = {
            -- デフォルトモデルを Claude 3.7 Sonnet に
            default = "claude-3.7-sonnet",
          },
        },
      })
    end,
  },
}

_M.setup = function(opts)
  require("codecompanion").setup(params)
end

return _M
