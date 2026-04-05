-- Real NvChad statusline (modeline): NvChad/ui + NvChad/base46, configured via lua/chadrc.lua
-- Docs: https://github.com/NvChad/ui + https://nvchad.com/docs/config/walkthrough
--
-- base46 compiles statusline + nvcheatsheet + tbline (see chadrc excluded list); dexco keeps main editor colors.
--
-- Mason: LazyVim auto-installs mason.nvim `ensure_installed` + mason-lspconfig servers you configure.
-- NvChad adds `:MasonInstallAll` (discover lspconfig/conform/nvim-lint names → install). Optional overlap — use
-- `chadrc.mason.skip` / `pkgs` if you rely on that command and want to trim installs.

return {
  { "nvim-lualine/lualine.nvim", enabled = false },

  {
    "NvChad/ui",
    branch = "v3.0",
    lazy = false,
    priority = 2000,
  },

  {
    "NvChad/base46",
    branch = "v3.0",
    lazy = false,
    priority = 1000,
    dependencies = { "NvChad/ui", "nvim-tree/nvim-web-devicons" },
    build = function()
      pcall(function()
        require("base46").load_all_highlights()
      end)
    end,
    config = function()
      require("base46").load_all_highlights()
      require("nvchad")
      vim.o.laststatus = 3
      vim.cmd.redrawstatus()
    end,
  },
}
