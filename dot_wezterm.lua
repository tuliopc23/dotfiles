local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.window_decorations = "TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"

-- Hide tab bar when only one tab is open
config.hide_tab_bar_if_only_one_tab = true

-- Popular built-in themes:
-- "Catppuccin Mocha", "Tokyo Night", "Nightfly", "Nord", "Gruvbox Dark"
config.color_scheme = 'Nord Dark'

config.colors = {
  tab_bar = {
    -- Full background blend (Catppuccin Mocha base #1e1e2e)
    background = '#1e1e2e',

    -- Active tab: invisible bg, light text
    active_tab = {
      bg_color = '#1e1e2e',  -- Base (matches background)
      fg_color = '#cdd6f4',  -- Rosewater text
    },

    -- Inactive tab: darker subtle bg
    inactive_tab = {
      bg_color = '#181825',  -- Mantle
      fg_color = '#a6adc8',  -- Overlay0
    },

    -- Hover: slight lift from mantle
    inactive_tab_hover = {
      bg_color = '#1e1e2e',  -- Back to base
      fg_color = '#cdd6f4',
    },

    -- New tab button: subtle
    new_tab = {
      bg_color = '#181825',  -- Mantle
      fg_color = '#a6adc8',
    },

    -- New tab hover
    new_tab_hover = {
      bg_color = '#1e1e2e',  -- Base
      fg_color = '#cdd6f4',
    },
  },
}

return config
