local function has_executable(cmd)
  return vim.fn.executable(cmd) == 1
end

local function has_env(name)
  local value = vim.env[name]
  return type(value) == "string" and value ~= ""
end

local function provider_candidates()
  return {
    {
      id = "claude_code",
      ready = function()
        -- Prefer existing CLI auth/session; no keys are hardcoded in config.
        return has_executable("claude")
          or has_executable("npx")
          or has_env("CLAUDE_CODE_OAUTH_TOKEN")
          or has_env("ANTHROPIC_API_KEY")
      end,
    },
    {
      id = "codex",
      ready = function()
        return has_executable("codex")
          or has_executable("codex-acp")
          or has_env("OPENAI_API_KEY")
          or has_env("CODEX_API_KEY")
      end,
    },
    {
      id = "gemini_cli",
      ready = function()
        return has_executable("gemini") or has_env("GEMINI_API_KEY")
      end,
    },
  }
end

local function detect_ready_adapters()
  local ready = {}
  for _, provider in ipairs(provider_candidates()) do
    if provider.ready() then
      table.insert(ready, provider.id)
    end
  end
  return ready
end

local function choose_primary_adapter()
  local ready = detect_ready_adapters()
  return ready[1], ready
end

return {
  {
    "olimorris/codecompanion.nvim",
    version = "^19.0.0",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = function()
      local primary, ready = choose_primary_adapter()

      if not primary then
        vim.schedule(function()
          vim.notify(
            "CodeCompanion ACP: no ready provider detected. Install/auth one of: claude, codex, gemini.",
            vim.log.levels.WARN
          )
        end)
      end

      local interactions = {}
      if primary then
        interactions = {
          chat = { adapter = primary },
          inline = { adapter = primary },
          cmd = { adapter = primary },
        }
      end

      return {
        adapters = {
          acp = {
            -- Keep defaults so existing CLI/session/env auth can be used.
            claude_code = function()
              return require("codecompanion.adapters").extend("claude_code", {})
            end,
            codex = function()
              return require("codecompanion.adapters").extend("codex", {})
            end,
            gemini_cli = function()
              return require("codecompanion.adapters").extend("gemini_cli", {})
            end,
          },
        },
        interactions = interactions,
        opts = {
          log_level = "ERROR",
        },
        display = {
          action_palette = {
            provider = "default",
          },
        },
        strategies = {
          chat = {
            adapter = primary or "claude_code",
          },
          inline = {
            adapter = primary or "claude_code",
          },
          cmd = {
            adapter = primary or "claude_code",
          },
        },
      }
    end,
    keys = function()
      local primary, ready = choose_primary_adapter()
      local provider_label = primary and (" (" .. primary .. ")") or ""

      return {
        { " A", "", desc = "+codecompanion", mode = { "n", "v" } },
        { " Aa", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions" .. provider_label, mode = { "n", "v" } },
        { " Ac", "<cmd>CodeCompanionChat Toggle<cr>", desc = "CodeCompanion Chat Toggle" .. provider_label, mode = { "n", "v" } },
        { " Av", "<cmd>CodeCompanionChat Add<cr>", desc = "CodeCompanion Add Selection/Buffer", mode = { "n", "v" } },
        { " Ai", "<cmd>CodeCompanion<cr>", desc = "CodeCompanion Inline Prompt", mode = { "n", "v" } },
        {
          " Ax",
          function()
            vim.notify(
              "Stop request: press q inside CodeCompanion chat/inline buffer.",
              vim.log.levels.INFO
            )
          end,
          desc = "CodeCompanion Stop Hint",
          mode = { "n", "v" },
        },
        {
          " Ap",
          function()
            if #ready == 0 then
              vim.notify("No ACP providers detected for CodeCompanion", vim.log.levels.WARN)
            else
              vim.notify("CodeCompanion ACP providers: " .. table.concat(ready, ", "), vim.log.levels.INFO)
            end
          end,
          desc = "Show ACP Providers",
        },
      }
    end,
  },
}

