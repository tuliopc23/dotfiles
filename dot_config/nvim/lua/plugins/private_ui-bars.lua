return {
  -- 1. Bufferline: Pill-shaped tabs
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        mode = "buffers",
        separator_style = "slant",
        indicator = {
          icon = "▎",
          style = "icon",
        },
        buffer_close_icon = "󰅖",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        offsets = {}, 
      },
    },
  },

  -- 2. Lualine: NvChad-like aesthetic (Pill-shaped Mode + Neovim Logo)
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      local icons = require("lazyvim.config").icons
      local c = require("xcode_theme").get_colors()

      opts.options = opts.options or {}
      opts.options.component_separators = { left = "", right = "" }
      opts.options.section_separators = { left = "", right = "" }

      -- NvChad-like Theme
      opts.options.theme = {
        normal = {
          a = { fg = c.bg, bg = c.keyword, gui = "bold" },
          b = { fg = c.fg, bg = c.bg_alt },
          c = { fg = c.fg_alt, bg = "none" },
        },
        insert = { a = { fg = c.bg, bg = c.function_name, gui = "bold" } },
        visual = { a = { fg = c.bg, bg = c.purple, gui = "bold" } },
        replace = { a = { fg = c.bg, bg = c.error, gui = "bold" } },
        command = { a = { fg = c.bg, bg = c.warning, gui = "bold" } },
        inactive = {
          a = { fg = c.fg_dark, bg = "none" },
          b = { fg = c.fg_dark, bg = "none" },
          c = { fg = c.fg_dark, bg = "none" },
        },
      }

      -- Custom Neovim Logo Component
      local mode_icon = {
        function() return "" end,
        padding = { left = 1, right = 1 },
        separator = { right = "" }, -- Pill end for the icon
        color = function()
          -- Dynamic color matching the mode
          local mode_color = {
            n = c.keyword,
            i = c.function_name,
            v = c.purple,
            [""] = c.purple,
            V = c.purple,
            c = c.warning,
            no = c.keyword,
            s = c.orange,
            S = c.orange,
            [""] = c.orange,
            ic = c.yellow,
            R = c.error,
            Rv = c.error,
            cv = c.error,
            ce = c.error,
            r = c.error,
            rm = c.keyword,
            ["r?"] = c.keyword,
            ["!"] = c.error,
            t = c.error,
          }
          return { fg = c.bg, bg = mode_color[vim.fn.mode()] }
        end,
      }
      
      local mode_text = {
        "mode",
        separator = { left = "", right = "" },
        padding = { left = 1, right = 1 },
      }

      opts.sections = {
        lualine_a = {
          -- Replicating the "Icon Block" look
          mode_icon,
          {
            "mode",
            separator = { left = " ", right = "" },
            padding = { left = 0, right = 1 },
            color = { gui = "bold" }, 
          },
        },
        lualine_b = {
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { "filename", separator = { right = "" } },
          { "branch", icon = "", separator = { left = "", right = "" } },
        },
        lualine_c = {
          { "diagnostics", symbols = { error = icons.diagnostics.Error, warn = icons.diagnostics.Warn, info = icons.diagnostics.Info, hint = icons.diagnostics.Hint } },
        },
        lualine_x = {
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
            separator = { left = "", right = "" },
          },
        },
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", separator = { left = "", right = "" }, padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          {
            function() return " " .. os.date("%R") end,
            separator = { left = "", right = "" },
            padding = { left = 1, right = 1 },
          },
        },
      }
    end,
  },
}
