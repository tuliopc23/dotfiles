return {
  {
    "yetone/avante.nvim",
    opts = {
      provider = "claude-code",
      auto_suggestions_provider = "claude-code",
      acp_providers = {
        ["claude-code"] = {
          command = "claude",
          args = { "acp" },
        },
      },
      behaviour = {
        auto_suggestions = false, -- Experimental, usually better to rely on Copilot/Blink
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = true,
      },
      windows = {
        position = "right",
        width = 30,
        sidebar_header = {
          align = "center",
          rounded = true,
        },
      },
    },
  },
}
