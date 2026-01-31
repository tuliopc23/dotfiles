# Xcodedark Neovim Configuration

## Overview
This is a comprehensive LazyVim configuration with the xcodedark theme fully integrated across all UI elements. The configuration features modern macOS aesthetics with rounded borders, smooth animations, and consistent styling.

## Theme
- **Primary Theme**: xcodedark.nvim
- **Transparency**: Enabled
- **Style**: macOS-inspired with rounded corners and modern UI elements

## Core Features

### 1. Global UI Settings (`lua/config/options.lua`)
- ✅ Native Neovim 0.11+ rounded borders (`winborder = "rounded"`)
- ✅ Transparency settings (pumblend, winblend)
- ✅ Global statusline (laststatus = 3)
- ✅ Stable screen splitting (splitkeep = "screen")
- ✅ Smooth scrolling
- ✅ LSP handlers with rounded borders
- ✅ Diagnostic configuration with rounded borders

### 2. Plugin Manager (`lua/config/lazy.lua`)
- ✅ Lazy.nvim with rounded border UI
- ✅ Custom icons with macOS symbols
- ✅ Backdrop transparency
- ✅ Xcodedark as default colorscheme

### 3. Plugins with Xcodedark Integration

#### Colorscheme (`lua/plugins/colorscheme.lua`)
- V4N1LLA-1CE/xcodedark.nvim
- All integrations enabled:
  - telescope ✓
  - nvim_tree ✓
  - gitsigns ✓
  - bufferline ✓
  - incline ✓
  - lazygit ✓
  - which-key ✓
  - notify ✓
  - snacks ✓
  - blink ✓

#### Completion (`lua/plugins/blink.lua`)
- Modern blink.cmp completion engine
- Rounded borders for completion menu
- Auto-documentation with rounded borders
- Signature help with rounded borders

#### Bufferline (`lua/plugins/bufferline.lua`)
- Thin separator style
- LSP diagnostics integration
- Hover support
- Underline indicator style
- Neo-tree offset support

#### Statusline (`lua/plugins/lualine.lua`)
- Auto theme detection (uses xcodedark)
- Modern icons
- Global statusline
- Diagnostics with custom symbols
- Time display

#### File Explorer (`lua/plugins/neo-tree.lua`)
- Rounded borders
- Git status integration
- Diagnostics support
- Modern icons
- Auto-follow current file

#### Fuzzy Finder (`lua/plugins/telescope.lua`)
- Rounded borders for all windows
- Top-down layout
- Smart path display
- Custom key mappings

#### Notifications (`lua/plugins/snacks.lua`)
- Modern notification system
- Rounded borders
- Compact style
- Custom icons for all levels
- Transparent backdrop

#### Key Hints (`lua/plugins/which-key.lua`)
- Modern preset
- Rounded borders
- Window transparency
- Custom key icons
- Compact layout

#### Package Manager (`lua/plugins/mason.lua`)
- Rounded border UI
- Custom icons
- Optimized size

#### Git Integration (`lua/plugins/gitsigns.lua`)
- Modern git signs
- Rounded preview borders
- Custom symbols
- Auto-follow files

## Installation

1. **Backup your current config** (if any):
   ```fish
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone or use this configuration**:
   The configuration is already in place at `~/.config/nvim`

3. **Launch Neovim**:
   ```fish
   nvim
   ```

4. **Wait for plugins to install**:
   Lazy.nvim will automatically install all plugins on first launch.

5. **Restart Neovim**:
   After all plugins are installed, restart Neovim to ensure everything loads correctly.

## File Structure

```
~/.config/nvim/
├── init.lua                      # Bootstrap file
├── lua/
│   ├── config/
│   │   ├── autocmds.lua         # Auto commands
│   │   ├── keymaps.lua          # Custom keymaps
│   │   ├── lazy.lua             # Lazy.nvim setup with rounded UI
│   │   └── options.lua          # Global options & rounded borders
│   └── plugins/
│       ├── blink.lua            # Completion engine
│       ├── bufferline.lua       # Buffer/tab line
│       ├── colorscheme.lua      # Xcodedark theme
│       ├── gitsigns.lua         # Git integration
│       ├── lualine.lua          # Status line
│       ├── mason.lua            # LSP/tool installer
│       ├── neo-tree.lua         # File explorer
│       ├── snacks.lua           # Notifications & utilities
│       ├── telescope.lua        # Fuzzy finder
│       └── which-key.lua        # Key hints
└── XCODEDARK_CONFIG.md          # This file
```

## Requirements

- Neovim 0.11.5 or later (for native `winborder` support)
- A Nerd Font (for icons)
- Git
- A terminal with true color support
- macOS (recommended for full aesthetic)

## Key Features

### Modern macOS Aesthetics
- ✅ Rounded borders everywhere
- ✅ Transparent backgrounds
- ✅ Smooth animations (via snacks.nvim)
- ✅ Consistent iconography
- ✅ Clean, minimal design

### Developer Experience
- ✅ Fast completion with blink.cmp
- ✅ LSP integration with rounded UI
- ✅ Git status at a glance
- ✅ Quick file navigation
- ✅ Helpful key hints
- ✅ Modern notification system

## Customization

### Changing Theme Options
Edit `lua/plugins/colorscheme.lua`:
```lua
require("xcodedark").setup({
  transparent = true,  -- Set to false for solid background
  styles = {
    comments = { italic = true },
    keywords = { bold = true },
    -- Customize more styles here
  },
})
```

### Adjusting Transparency
Edit `lua/config/options.lua`:
```lua
opt.pumblend = 10  -- Popup menu transparency (0-100)
opt.winblend = 10  -- Window transparency (0-100)
```

### Disabling Rounded Borders
If you prefer sharp corners, edit `lua/config/options.lua`:
```lua
opt.winborder = "single"  -- Change from "rounded" to "single"
```

## Troubleshooting

### Theme not loading
1. Ensure Neovim version is 0.11.5+: `nvim --version`
2. Check if xcodedark is installed: `:Lazy`
3. Force reinstall: `:Lazy clean` then `:Lazy install`

### Icons not showing
1. Install a Nerd Font (e.g., JetBrainsMono Nerd Font)
2. Configure your terminal to use the Nerd Font
3. Restart terminal and Neovim

### Borders not rounded
1. Verify Neovim version: `nvim --version` (needs 0.11+)
2. Check `lua/config/options.lua` has `opt.winborder = "rounded"`

### Plugins not loading
1. Run `:Lazy check` to see status
2. Run `:Lazy sync` to update all plugins
3. Check for errors: `:messages`

## Additional Resources

- [xcodedark.nvim GitHub](https://github.com/V4N1LLA-1CE/xcodedark.nvim)
- [LazyVim Documentation](https://lazyvim.org)
- [Neovim Documentation](https://neovim.io/doc/)

## Credits

- **Theme**: [xcodedark.nvim](https://github.com/V4N1LLA-1CE/xcodedark.nvim) by V4N1LLA-1CE
- **Distribution**: [LazyVim](https://lazyvim.org) by folke
- **Plugin Manager**: [lazy.nvim](https://github.com/folke/lazy.nvim) by folke

## Next Steps

After installation, you can further customize:
1. Add language-specific configurations
2. Set up custom keymaps in `lua/config/keymaps.lua`
3. Add auto commands in `lua/config/autocmds.lua`
4. Install additional LazyVim extras (`:LazyExtras`)

Enjoy your modern, xcodedark-themed Neovim setup! 🎨
