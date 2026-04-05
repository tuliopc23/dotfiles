local M = {}

M.setup = function()
  local starter = require('mini.starter')
  
  -- Custom "MINI" Header
  local header = {
    [[                                             ]],
    [[                                             ]],
    [[  ███╗   ███╗██╗███╗   ██╗██╗                ]],
    [[  ████╗ ████║██║████╗  ██║██║                ]],
    [[  ██╔████╔██║██║██╔██╗ ██║██║                ]],
    [[  ██║╚██╔╝██║██║██║╚██╗██║██║                ]],
    [[  ██║ ╚═╝ ██║██║██║ ╚████║██║                ]],
    [[  ╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝                ]],
    [[                                             ]],
    [[              MacbookPro                    ]],
    [[    Wellcome to your Neovim, Tulio 󰀵       ]],
    [[                                             ]],
  }

  starter.setup({
    evaluate_single = true,
    items = {
      starter.sections.recent_files(5, false, false),
      starter.sections.sessions(5, true),
      starter.sections.builtin_actions(),
    },
    content_hooks = {
      -- Use icons for sections
      function(content)
        local coords = starter.content_coords(content, 'section')
        for _, c in ipairs(coords) do
          local unit = content[c.line][c.unit]
          local icon = '  ' -- Default folder icon
          
          if unit.string:find('Sessions') then icon = '  ' end
          if unit.string:find('Builtin') then icon = '  ' end
          
          -- Apply icon and ensure consistent spacing
          unit.string = icon .. unit.string
        end
        return content
      end,
      starter.gen_hook.adding_bullet("  ", false),
      starter.gen_hook.aligning('center', 'center'),
    },
    header = table.concat(header, '\n'),
    footer = '',
    -- Ensure navigation works (disable query if it interferes)
    query_updaters = 'abcdefghijklmnopqrstuvwxyz0123456789_-.',
  })
  
  -- Force Normal mode mapping to ensure j/k work if something hijacked them
  vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniStarterOpened',
    callback = function()
      vim.keymap.set('n', 'j', '<Cmd>lua MiniStarter.update_current_item("next")<CR>', { buffer = true, nowait = true })
      vim.keymap.set('n', 'k', '<Cmd>lua MiniStarter.update_current_item("prev")<CR>', { buffer = true, nowait = true })
    end,
  })
end

return M
