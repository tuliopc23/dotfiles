return {
  -- ==========================================================================
  -- CORE NAVIGATION & PICKER (Snacks.nvim)
  -- ==========================================================================
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      -- Enable explorer in picker options for unified experience
      opts.picker = opts.picker or {}
      opts.picker.win = opts.picker.win or {}
      opts.picker.win.input = opts.picker.win.input or {}
      opts.picker.win.input.keys = vim.tbl_extend("force", opts.picker.win.input.keys or {}, {
        ["<a-s>"] = { "flash", mode = { "n", "i" } },
        ["s"] = { "flash" },
      })
    end,
    keys = {
      -- 1. PROJECT FILE MANAGER (Snacks Explorer)
      -- Replaces the "Project Sidebar" concept with the modern Picker/Explorer
      { "<leader>e", function() Snacks.picker.explorer() end, desc = "Explorer (Project Root)" },
      { "<leader>E", function() Snacks.picker.explorer({ cwd = vim.fn.expand("%:p:h") }) end, desc = "Explorer (Current Dir)" },

      -- 2. FILE FINDING
      { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
      { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files (Root)" },
      { "<leader>fF", function() Snacks.picker.files({ cwd = false }) end, desc = "Find Files (CWD)" },
      { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent Files" },
      { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
      {
        "<leader>fz",
        function()
          local items = vim.fn.systemlist("zoxide query -l")
          vim.ui.select(items, { prompt = "Zoxide Jump" }, function(choice)
            if choice then
              vim.fn.chdir(choice)
              vim.cmd("Oil --float")
            end
          end)
        end,
        desc = "Zoxide -> Oil",
      },
      
      -- 3. SEARCH / GREP
      { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep (Root)" },
      { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep (Root)" },
      { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual Selection or Word" },
      
      -- 4. BUFFERS
      { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>,", function() Snacks.picker.buffers() end, desc = "Switch Buffer" },

      -- 5. TERMINAL (IDE-like persistent toggle)
      { "<c-/>", function() Snacks.terminal.toggle() end, desc = "Toggle Terminal" },
      { "<c-_>", function() Snacks.terminal.toggle() end, desc = "Toggle Terminal" }, -- For some terminals that send C-_ for C-/
    },
  },

  -- ==========================================================================
  -- SYSTEM FILE MANAGER (Yazi)
  -- ==========================================================================
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>-",
        function()
          require("yazi").yazi()
        end,
        desc = "System Manager (Yazi)",
      },
      {
        "<leader>cw",
        function()
          require("yazi").yazi(nil, vim.fn.getcwd())
        end,
        desc = "Yazi (Work Dir)",
      },
    },
    opts = {
      open_for_directories = false,
      keymaps = {
        show_help = "<f1>",
      },
    },
  },

  -- ==========================================================================
  -- DISABLE LEGACY EXPLORERS
  -- ==========================================================================
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  { "nvim-mini/mini.files", enabled = false },

  -- ==========================================================================
  -- MOTIONS & JUMPING (Flash.nvim)
  -- ==========================================================================
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      labels = "asdfghjklqwertyuiopzxcvbnm",
      search = {
        multi_window = true,
        forward = true,
        wrap = true,
        mode = "search",
        incremental = true,
      },
      jump = {
        jumplist = true,
        autojump = true,
      },
      label = {
        uppercase = false,
        after = true,
        before = false,
        style = "overlay",
        distance = true,
        rainbow = { enabled = true, shade = 5 },
      },
      highlight = {
        backdrop = true,
        matches = true,
      },
      modes = {
        search = { enabled = true },
        char = { jump_labels = true },
        treesitter = {
          labels = "asdfghjklqwertyuiopzxcvbnm",
          jump = { pos = "range", autojump = true },
          label = { before = true, after = true, style = "inline" },
        },
        treesitter_search = {
          jump = { pos = "range" },
          search = { multi_window = true, wrap = true, incremental = false },
          label = { before = true, after = true, style = "inline" },
        },
        remote = {
          remote_op = { restore = true, motion = true },
        },
      },
    },
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  -- ==========================================================================
  -- DIAGNOSTICS & LISTS (Trouble.nvim)
  -- ==========================================================================
  {
    "folke/trouble.nvim",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
      { "<leader>xs", "<cmd>Trouble symbols toggle<cr>", desc = "Symbols (Trouble)" },
      { "<leader>xl", "<cmd>Trouble lsp toggle<cr>", desc = "LSP (Trouble)" },
      { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
      { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
    },
  },

  -- ==========================================================================
  -- WHICH-KEY GROUPS
  -- ==========================================================================
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>f", group = "file/find", icon = " " },
        { "<leader>s", group = "search", icon = " " },
        { "<leader>x", group = "trouble", icon = " " },
      },
    },
  },
}