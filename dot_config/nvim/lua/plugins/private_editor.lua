return {
  -- 1. Spider: Smart Sub-word Navigation (CamelCase support)
  {
    "chrisgrieser/nvim-spider",
    lazy = true,
    keys = {
      { "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" }, desc = "Spider-w" },
      { "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" }, desc = "Spider-e" },
      { "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" }, desc = "Spider-b" },
      { "ge", "<cmd>lua require('spider').motion('ge')<CR>", mode = { "n", "o", "x" }, desc = "Spider-ge" },
    },
  },

  -- 2. Multicursors: VS Code style editing
  {
    "smoka7/multicursors.nvim",
    dependencies = { "nvimtools/hydra.nvim" },
    opts = {
        hint_config = {
            border = "rounded",
            position = "bottom",
        },
    },
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    keys = {
      {
        mode = { "v", "n" },
        "<C-n>",
        "<cmd>MCstart<cr>",
        desc = "Start Multicursor",
      },
    },
  },

  -- 3. Refactoring: Extract functionality
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      { "<leader>r", "", desc = "+refactor", mode = { "n", "v" } },
      {
        "<leader>rs",
        function() require('refactoring').select_refactor() end,
        mode = "v",
        desc = "Refactor Menu",
      },
      {
        "<leader>ri",
        function() require('refactoring').refactor('Inline Variable') end,
        mode = { "n", "v" },
        desc = "Inline Variable",
      },
      {
        "<leader>rb",
        function() require('refactoring').refactor('Extract Block') end,
        desc = "Extract Block",
      },
      {
        "<leader>rf",
        function() require('refactoring').refactor('Extract Block To File') end,
        desc = "Extract Block To File",
      },
       {
        "<leader>rv",
        function() require('refactoring').refactor('Extract Variable') end,
        mode = "v",
        desc = "Extract Variable",
      },
    },
    opts = {},
  },

  -- 4. Neovim Tips: Daily tips
  {
    "saxon1964/neovim_tips",
    opts = {},
  },
}
