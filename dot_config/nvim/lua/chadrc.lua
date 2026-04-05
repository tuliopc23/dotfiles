-- NvChad: merged into https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Walkthrough: https://nvchad.com/docs/config/walkthrough
--
-- base46 compiles: statusline (St_*), nvcheatsheet, tbline — dexco/LazyVim keep other editor colors.
-- See lua/plugins/nvchad-statusline.lua for Mason vs LazyVim notes.

return {
  base46 = {
    theme = "onedark",
    transparency = true,
    integrations = {},
    excluded = {
      "blankline",
      "blink",
      "cmp",
      "defaults",
      "devicons",
      "git",
      "lsp",
      "mason",
      "nvimtree",
      "syntax",
      "treesitter",
      "telescope",
      "whichkey",
    },
  },

  ui = {
    statusline = {
      enabled = true,
      theme = "default",
      separator_style = "round",
      order = nil,
      modules = nil,
    },

    -- NvChad tabufline (bufferline.nvim disabled in lua/plugins/bufferline.lua)
    tabufline = {
      enabled = true,
      lazyload = false,
      treeOffsetFt = "neo-tree",
      order = { "treeOffset", "buffers", "tabs", "btns" },
      modules = nil,
      bufwidth = 21,
    },
  },

  cheatsheet = {
    theme = "grid",
    excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" },
  },

  colorify = {
    enabled = true,
    mode = "virtual",
    virt_text = "󱓻 ",
    highlight = { hex = true, lspvars = true },
  },

  -- Tweak :MasonInstallAll (NvChad) — pkgs = extra names to install; skip = never install
  mason = {
    pkgs = {},
    skip = {},
  },
}
