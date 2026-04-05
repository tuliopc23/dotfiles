return {
  {
    "coder/claudecode.nvim",
    -- Keep Sidekick on <leader>a. Claude gets its own <leader>C prefix.
    keys = {
      { " C", "", desc = "+claude", mode = { "n", "v" } },
      -- Core controls
      { " Cc", " ClaudeCode ", desc = "Toggle Claude" },
      { " Cf", " ClaudeCodeFocus ", desc = "Focus Claude" },
      { " Cr", " ClaudeCode --resume ", desc = "Resume Claude" },
      { " CC", " ClaudeCode --continue ", desc = "Continue Claude" },
      { " Cb", " ClaudeCodeAdd % ", desc = "Add current buffer to Claude" },

      -- Sending context
      { " Cs", " ClaudeCodeSend ", mode = { "v" }, desc = "Send visual selection to Claude" },
      { " Ca", " ClaudeCodeTreeAdd ", desc = "Add file to Claude", ft = { "NvimTree", "neo-tree", "oil" } },

      -- Diff management (avoid Sidekick's <leader>a? keys)
      { " Cy", " ClaudeCodeDiffAccept ", desc = "Accept diff from Claude" },
      { " Cn", " ClaudeCodeDiffDeny ", desc = "Deny diff from Claude" },
    },
  },
}

