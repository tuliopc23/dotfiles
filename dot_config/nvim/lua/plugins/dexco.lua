return {
  {
    "RobotPajamas/dexco.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dexco",
    },
    config = function(_, opts)
      require("lazyvim").setup(opts)

      local dexco_highlights = require("config.dexco-highlights")

      local function transparent_bg()
        local groups = {
          "Normal",
          "NormalNC",
          "NormalFloat",
          "FloatBorder",
          "SignColumn",
          "EndOfBuffer",
          "StatusLine",
          "StatusLineNC",
          "LineNr",
          "FoldColumn",
          "Pmenu",
        }
        for _, group in ipairs(groups) do
          vim.api.nvim_set_hl(0, group, { bg = "none" })
        end
      end

      transparent_bg()
      dexco_highlights.apply()
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          transparent_bg()
          dexco_highlights.apply()
        end,
      })

      vim.api.nvim_create_user_command("DexcoRefreshHighlights", function()
        transparent_bg()
        dexco_highlights.apply()
      end, { desc = "Refresh dexco highlights and transparency" })
    end,
  },
}
