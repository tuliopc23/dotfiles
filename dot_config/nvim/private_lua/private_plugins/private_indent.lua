return {
  {
    "folke/snacks.nvim",
    opts = {
      indent = {
        enabled = true,
        char = "│",
        only_scope = true, -- Hides all indent lines except the one for the current scope
        only_current = false, -- Show all levels of the current scope
        hl = "SnacksIndent", -- Subtler highlights (configured in theme.lua)
      },
      scope = {
        enabled = true,
        char = "│",
        underline = false, -- Cleaner look without underlines
        edge = true, -- Show the edge of the scope
      },
    },
  },
  -- Disable indent-blankline to let snacks.indent take over
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
}
