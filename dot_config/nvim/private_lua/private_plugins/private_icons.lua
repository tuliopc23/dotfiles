return {
  -- 1. Enable nvim-web-devicons (Nerd Font icons)
  {
    "nvim-tree/nvim-web-devicons",
    enabled = true,
    opts = {
      default = true,
      strict = true,
    },
  },

  -- 2. Explicitly disable mini.icons to prevent conflicts
  -- Renamed from echasnovski/mini.icons
  {
    "nvim-mini/mini.icons",
    enabled = false,
  },
}