return {
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      -- Configure Mason to look in Bun's global installation directory
      local bun_home = os.getenv("BUN_INSTALL") or vim.fn.expand("~/.bun")
      local bun_bin = bun_home .. "/bin"
      
      -- Add Bun bin directory to PATH for Mason
      local path = vim.env.PATH
      if not string.find(path, bun_bin) then
        vim.env.PATH = bun_bin .. ":" .. path
      end
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      automatic_installation = true,
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function()
      return {
        ensure_installed = {
          "stylua",
          "shfmt",
          "markdown-toc",
          "markdownlint-cli2",
          "sqlfluff",
          -- Swift / iOS
          "codelldb",       -- Debugger
          "swiftlint",      -- Linter
          -- Web frameworks
          "vue-language-server",
          "svelte-language-server",
          "astro",
        },
      }
    end,
    config = function(_, opts)
      require("mason-tool-installer").setup(opts)
    end,
  },
}
