local _M = {}

GEMINI_API_KEY = os.getenv("GEMINI_API_KEY")

_M.opts = {
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
      -- adapter = "gemini",
    },
    inline = {
      adapter = "copilot",
      -- adapter = "gemini",
    },
    cmd = {
      adapter = "copilot",
      -- adapter = "gemini",
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
    -- geminiアダプタを追加
    gemini = function()
      -- 既定のgeminiアダプタをベースに
      return require("codecompanion.adapters").extend("gemini", {
        env = {
          -- Gemini APIキーを設定
          api_key = GEMINI_API_KEY,
        },
        schema = {
          model = {
            -- デフォルトモデルを Gemini 2.5 Pro に
            default = "gemini-2.5-pro-preview-06-05",
            -- default = "gemini-2.5-pro",
          },
        },
      })
    end,
  },
}

return _M
