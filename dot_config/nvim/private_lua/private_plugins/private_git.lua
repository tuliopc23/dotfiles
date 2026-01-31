return {
  -- Use mini.diff instead of gitsigns for a cleaner, modern look
  {
    "nvim-mini/mini.diff",
    event = "VeryLazy",
    opts = {
      view = {
        style = "sign",
        signs = { add = "▎", change = "▎", delete = "" },
      },
    },
    keys = {
      {
        "<leader>gh",
        function()
          require("mini.diff").toggle_overlay(0)
        end,
        desc = "Toggle Hunk Overlay",
      },
    },
  },
  -- Disable gitsigns to avoid redundancy
  { "lewis6991/gitsigns.nvim", enabled = false },
}
