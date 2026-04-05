return {
  -- 1. nvim-treesitter-context: Show current code context (function/class) at the top
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPost",
    opts = {
      enable = true,
      max_lines = 3,
      trim_scope = "outer",
      mode = "cursor",
    },
  },

  -- 2. mini.cursorword: Autohighlight word under cursor
  {
    "echasnovski/mini.cursorword",
    version = "*",
    event = "BufReadPost",
    config = function()
      require("mini.cursorword").setup()
    end,
  },

  -- 3. mini.hipatterns: Highlight patterns in text (TODO, FIXME, hex colors)
  {
    "echasnovski/mini.hipatterns",
    version = "*",
    event = "BufReadPost",
    opts = function()
      local hipatterns = require("mini.hipatterns")
      return {
        highlighters = {
          -- Highlight hex color string (#aabbcc) with that color as a background
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      }
    end,
  },

  -- 4. rainbow-delimiters: Colored brackets
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufReadPost",
  },

  -- 5. Illumination: Highlighting other uses of the word under the cursor
  -- This is often preferred over mini.cursorword for LSP integration
  {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    opts = {
      delay = 200,
      large_file_cutoff = 2000,
      large_file_overrides = {
        providers = { "lsp" },
      },
    },
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
  },
}
