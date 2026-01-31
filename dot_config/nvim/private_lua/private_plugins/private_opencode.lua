return {
  {
    "sudo-tee/opencode.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          anti_conceal = { enabled = false },
          file_types = { "markdown", "opencode_output" },
        },
        ft = { "markdown", "Avante", "copilot-chat", "opencode_output" },
      },
      "saghen/blink.cmp",
      "folke/snacks.nvim",
    },
    config = function()
      require("opencode").setup({
        preferred_picker = "snacks",
        preferred_completion = "blink",
        ui = {
          border = "rounded",
        },
        keymap_prefix = "<leader>o",
      })
    end,
    -- Lazy load on command or key
    cmd = { "Opencode" },
    keys = {
      { "<leader>og", mode = { "n", "v" }, desc = "Toggle Opencode" },
      { "<leader>oi", mode = { "n", "v" }, desc = "Opencode Input" },
      { "<leader>os", mode = { "n", "v" }, desc = "Opencode Sessions" },
    },
  },
}
