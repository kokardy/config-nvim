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
            -- デフォルトモデルを Claude Sonnet 4 に
            default = "claude-sonnet-4",
          },
        },
      })
    end,

    -- -- 小説用のcopilotアダプタ
    -- copilot_novel = function()
    --   return require("codecompanion.adapters").extend("copilot", {
    --     schema = {
    --       model = {
    --         default = "gpt-5",
    --       },
    --     },
    --   })
    -- end,

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
            -- default = "gemini-2.5-flash-preview-05-20",
          },
        },
      })
    end,


  },

  -- prompt_library = {
  --   ["novel"] = {
  --     strategy = "chat",
  --     description = "小説用プロンプト",
  --     prompts = {
  --       {
  --         role = "system",
  --         content = "あなたは小説家のアシスタントです。著作権や倫理などに留意して、アイデアを出したり、アドバイスをしてください。",
  --       },
  --       {
  --         role = "user",
  --         content = ""
  --       }
  --     },
  --   }
  -- }
}

return _M
