local _M = {}

_M.setup = function(opts)
end

_M.opts = {
  strategies = {
    chat = {
      adapter = "copilot",
    },
    inline = {
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


return _M
