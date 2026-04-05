return {
  -- ==========================================================================
  -- LANGUAGE SERVER (SourceKit-LSP)
  -- ==========================================================================
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        sourcekit = {
          filetypes = { "swift", "objc", "objcpp" },
          capabilities = {
            workspace = {
              didChangeWatchedFiles = {
                dynamicRegistration = true,
              },
            },
          },
          root_dir = function(filename, _)
            local util = require("lspconfig.util")
            local root = util.root_pattern("buildServer.json")(filename)
              or util.root_pattern("*.xcodeproj", "*.xcworkspace")(filename)
              or util.root_pattern("Package.swift")(filename)
              or util.find_git_ancestor(filename)
            return root
          end,
        },
      },
    },
  },

  -- ==========================================================================
  -- FORMATTING (Conform.nvim)
  -- ==========================================================================
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        swift = { "swift_format" }, -- Uses Apple's 'swift-format' (found in /opt/homebrew/bin/)
      },
    },
  },

  -- ==========================================================================
  -- LINTING (Nvim-lint)
  -- ==========================================================================
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        swift = { "swiftlint" },
      },
    },
  },

  -- ==========================================================================
  -- IOS/MACOS DEVELOPMENT SUITE (Xcodebuild.nvim)
  -- ==========================================================================
  {
    "wojciech-kulik/xcodebuild.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim", -- Required for pickers (or snacks picker adapter)
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-tree.lua", -- Optional: for project manager
      "nvim-treesitter/nvim-treesitter",
    },
    lazy = false,
    config = function()
      require("xcodebuild").setup({
        show_build_progress_bar = true,
        logs = {
          auto_open_on_success_tests = false,
          auto_open_on_failed_tests = true,
          auto_open_on_success_build = false,
          auto_open_on_failed_build = true,
          auto_focus = true,
          filetype = "objc", -- Use objc filetype for better highlighting in logs
        },
        code_coverage = {
          enabled = true,
        },
        integrations = {
          xcode_build_server = {
            enabled = true, -- Automatically manage buildServer.json
          },
        },
      })

      -- Keybindings for Xcodebuild
      local map = vim.keymap.set
      map("n", "<leader>X", "", { desc = "Xcode" })
      map("n", "<leader>Xb", "<cmd>XcodebuildBuild<cr>", { desc = "Build Project" })
      map("n", "<leader>Xr", "<cmd>XcodebuildBuildRun<cr>", { desc = "Build & Run" })
      map("n", "<leader>Xt", "<cmd>XcodebuildTest<cr>", { desc = "Run Tests" })
      map("n", "<leader>Xs", "<cmd>XcodebuildSelectScheme<cr>", { desc = "Select Scheme" })
      map("n", "<leader>Xd", "<cmd>XcodebuildSelectDevice<cr>", { desc = "Select Device/Simulator" })
      map("n", "<leader>Xp", "<cmd>XcodebuildToggleProjectManager<cr>", { desc = "Toggle Project Manager" })
    end,
  },
}