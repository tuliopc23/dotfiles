return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "mason-org/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
    },
    opts = function()
      local dap = require("dap")
      
      -- 1. Configure codelldb (installed via Mason)
      -- NOTE: Ensure 'codelldb' is installed in Mason
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
          args = { "--port", "${port}" },
        },
      }

      -- 2. Link Swift to codelldb
      dap.configurations.swift = {
        {
          name = "Launch (Xcodebuild)",
          type = "codelldb",
          request = "launch",
          program = function()
             -- xcodebuild.nvim will inject the executable path here if configured
             return require("xcodebuild.core.config").get_config().app_path
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          waitFor = true,
        },
      }
    end,
    config = function(_, opts)
      -- UI Setup
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      
      -- Auto-open debugger UI
      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
    end,
  },
  
  -- Ensure Mason installs codelldb
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = { "codelldb" },
    },
  },
}
