return {
  -- 1. Oil.nvim: Edit your filesystem like a buffer
  {
    "stevearc/oil.nvim",
    opts = {
      default_file_explorer = false, -- We use Snacks for browsing
      view_options = {
        show_hidden = true,
      },
      float = {
        padding = 2,
        max_width = 90,
        max_height = 0,
      },
    },
    keys = {
      { "-", "<cmd>Oil --float<cr>", desc = "Oil (Edit Files)" },
    },
  },

  -- 2. Neotest: Unified Test Interface
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      -- Adapters
      "nvim-neotest/neotest-jest",
      "marilari88/neotest-vitest",
      "fredrikaverpil/neotest-golang",
      "rouge8/neotest-rust",
    },
    keys = {
      { "<leader>t", "", desc = "+test" },
      { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File" },
      { "<leader>tr", function() require("neotest").run.run() end, desc = "Run Nearest" },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Summary" },
      { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output" },
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-jest")({ jestCommand = "npm test --" }),
          require("neotest-vitest"),
          require("neotest-golang"),
          require("neotest-rust"),
        },
      })
    end,
  },
  
  -- 3. Dadbod: Database Interface
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, 
    },
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
}
