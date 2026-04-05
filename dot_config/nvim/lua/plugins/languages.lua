return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Requested languages
        sourcekit = {}, -- Swift
        gopls = {}, -- Go
        zls = {}, -- Zig
        -- Rust: disable rust-analyzer here so LazyVim's rustaceanvim integration owns Rust LSP.
        rust_analyzer = { enabled = false },
        vtsls = {}, -- TS/JS

        -- Web stack
        html = {},
        cssls = {},
        tailwindcss = {},
        eslint = {},
        jsonls = {},
        yamlls = {},
        taplo = {},
        bashls = {},
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        -- Core + requested
        "swift",
        "go",
        "zig",
        "rust",
        "typescript",
        "tsx",
        "javascript",

        -- Web and common config/data formats
        "html",
        "css",
        "scss",
        "json",
        "yaml",
        "toml",
        "graphql",
        "astro",
        "svelte",
        "vue",

        -- Shell/editor/common
        "bash",
        "lua",
        "markdown",
        "markdown_inline",
        "regex",
        "vim",
        "vimdoc",
        "query",
      })
    end,
  },

  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- Format/lint helpers
        "prettierd",
        "eslint_d",
        "stylua",
        "shfmt",
      },
    },
  },
}
