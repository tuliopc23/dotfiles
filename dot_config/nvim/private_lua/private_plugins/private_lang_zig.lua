return {
  -- ==========================================================================
  -- 1. LSP SUPPORT (ZLS)
  -- ==========================================================================
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        zls = {
          -- ZLS settings can be added here if needed, but defaults are usually solid
          settings = {
             zls = {
                enable_inlay_hints = true,
                enable_snippets = true,
                warn_style = true,
             },
          },
        },
      },
    },
  },

  -- ==========================================================================
  -- 2. FORMATTING
  -- ==========================================================================
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        zig = { "zigfmt" },
      },
    },
  },

  -- ==========================================================================
  -- 4. MASON
  -- ==========================================================================
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "zls" })
    end,
  },
}
