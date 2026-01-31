return {
  -- 1. Noice.nvim: Rounded borders for cmdline, popups, and messages
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
      views = {
        cmdline_popup = {
          border = { style = "rounded", padding = { 0, 1 } },
        },
        hover = {
          border = { style = "rounded", padding = { 0, 1 } },
        },
        popupmenu = {
          border = { style = "rounded", padding = { 0, 1 } },
        },
      },
    },
  },

  -- 2. WhichKey: Rounded borders & New Groups
  {
    "folke/which-key.nvim",
    opts = {
      win = {
        border = "rounded",
        padding = { 1, 2 },
      },
      spec = {
        { "<leader>f", group = "file/find", icon = " " },
        { "<leader>s", group = "search", icon = " " },
        { "<leader>x", group = "trouble", icon = " " },
        { "<leader>t", group = "test", icon = " " },
        { "<leader>r", group = "refactor", icon = " " },
        { "<leader>a", group = "ai", icon = " " },
        { "<leader>g", group = "git", icon = " " },
      },
    },
  },

  -- 3. Edgy.nvim: Borderless-looking sidebars and panels
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    opts = {
      animate = { enabled = true },
      options = {
        left = { size = 32 },
        right = { size = 36 },
        bottom = { size = 12 },
        top = { size = 10 },
      },
      wo = {
        winbar = false,
        winfixwidth = true,
        winfixheight = false,
        winhighlight = "Normal:EdgyNormal,WinSeparator:EdgySeparator,FloatBorder:EdgySeparator",
        signcolumn = "no",
      },
    },
  },

  -- 4. Snacks.nvim: Dashboard & Rounded borders
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    init = function()
      vim.ui.select = function(...)
        return Snacks.picker.select(...)
      end
      vim.ui.input = function(...)
        return Snacks.input(...)
      end
      -- Sync dashboard colors with current theme by linking to existing highlight groups
      local function apply_dashboard_hl()
        vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { link = "Title" })
        vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { link = "Special" })
        vim.api.nvim_set_hl(0, "SnacksDashboardKey", { link = "Identifier" })
        vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { link = "Comment" })
        vim.api.nvim_set_hl(0, "SnacksDashboardSpecial", { link = "Constant" })
      end

      -- Apply once the colorscheme is actually loaded
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = apply_dashboard_hl,
      })
    end,
    opts = function()
      local header_lines = {
        [[
██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗
██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║
██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║
██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║
███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
        ]],
      }

      local msg1 = vim.fn.nr2char(0xe711) .. " MacbookPro"
      local msg2 = "Wellcome to your Neovim, Tulio " .. vim.fn.nr2char(0xF0036)

      local header = table.concat({
        header_lines[1],
      })

      return {
        styles = {
          notification = { wo = { wrap = true } },
        },
        dashboard = {
          preset = {
            header = header,
          },
          sections = {
            { section = "header" },
            { section = "keys", gap = 1, padding = 1 },
            { text = "\n", padding = 1 },
            { text = msg1, align = "center", hl = "SnacksDashboardSpecial" },
            { text = msg2, align = "center", hl = "SnacksDashboardDesc" },
          },
        },
        picker = {
          ui_select = true,
          win = {
            input = {
              keys = { ["<Esc>"] = { "close", mode = { "n", "i" } } },
            },
          },
          layout = {
            preset = "default", -- Use the default floating preset
            cycle = true,
          },
        },
      }
    end,
  },

  -- 5. Smear cursor animation
  {
    "sphamba/smear-cursor.nvim",
    opts = {
      cursor_color = "#ff5257",
      smear_between_buffers = true,
      smear_between_neighbor_lines = true,
      scroll_buffer_space = true,
      smear_insert_mode = true,
      stiffness = 0.7,
      trailing_stiffness = 0.5,
    },
  },

  -- 6. Mini.animate
  {
    "nvim-mini/mini.animate",
    opts = function()
      local animate = require("mini.animate")
      return {
        cursor = { enable = false }, -- Using smear-cursor instead
        scroll = {
          enable = true,
          timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
        },
        resize = {
          enable = true,
          timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
        },
        open = {
          enable = true,
          timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
        },
        close = {
          enable = true,
          timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
        },
      }
    end,
  },

  -- 7. Global Floating Window Borders (LSP, etc.)
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        float = { border = "rounded" },
      },
    },
    config = function(_, opts)
      -- Force standard "vim.lsp.util.open_floating_preview" to use rounded borders
      local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
      function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = opts.border or "rounded"
        return orig_util_open_floating_preview(contents, syntax, opts, ...)
      end
    end,
  },

  -- 8. Render Markdown: Better visualization for Markdown & Avante
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      file_types = { "markdown", "Avante" }, -- Enable for Avante chat
      code = {
        sign = false,
        width = "block",
        right_pad = 1,
      },
      heading = {
        sign = false,
        icons = {}, -- No icons, just bold/colors for a clean "Tahoe" look
      },
    },
    ft = { "markdown", "Avante" },
  },

  -- 9. Inc-Rename: Visual incremental renaming
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
    keys = {
      { "<leader>rn", function() return ":IncRename " .. vim.fn.expand("<cword>") end, desc = "Rename (Inc)", expr = true },
    },
  },
}
