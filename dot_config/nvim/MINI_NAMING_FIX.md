# Mini.nvim Plugin Naming Fix

## Issue
LazyVim was showing warnings about incorrect plugin naming for `mini.*` plugins:
```
Plugin `echasnovski/mini.nvim` was renamed to `nvim-mini/mini.nvim`. 
Please update your config for `LazyVim`
```

## Root Cause
1. The mini.nvim repository was renamed from `echasnovski/mini.nvim` to `nvim-mini/mini.nvim`
2. Plugins were using the old repository name
3. Individual plugin files were using `opts` instead of `config` function pattern

## Solution Applied

### 1. Updated Repository Name
Changed from `echasnovski/mini.nvim` to `nvim-mini/mini.nvim` in:
- `lua/plugins/mini-files.lua`
- `lua/plugins/mini-extras.lua`

### 2. Fixed Configuration Pattern
Changed from `opts` to `config` function pattern for proper module setup:

**Before (mini-files.lua):**
```lua
{
  "echasnovski/mini.nvim",
  opts = {
    files = { ... }
  }
}
```

**After (mini-files.lua):**
```lua
{
  "nvim-mini/mini.nvim",
  config = function()
    require("mini.files").setup({ ... })
  end
}
```

**Before (mini-extras.lua):**
```lua
-- Separate plugin specs with incorrect naming
{
  "echasnovski/mini.surround",
  opts = { ... }
}
{
  "echasnovski/mini.indentscope",
  opts = { ... }
}
{
  "echasnovski/mini.hipatterns",
  opts = { ... }
}
```

**After (mini-extras.lua):**
```lua
-- Single plugin spec with all modules
{
  "nvim-mini/mini.nvim",
  event = "VeryLazy",
  config = function()
    require("mini.surround").setup({ ... })
    require("mini.indentscope").setup({ ... })
    require("mini.hipatterns").setup({ ... })
  end
}
```

## Files Modified
1. `lua/plugins/mini-files.lua` - Updated repository name and config pattern
2. `lua/plugins/mini-extras.lua` - Consolidated all mini.* modules under single spec

## Verification
All mini.* modules load correctly:
```
✓ mini.files: OK
✓ mini.surround: OK  
✓ mini.indentscope: OK
✓ mini.hipatterns: OK
```

No warnings in `checkhealth lazy` output.

## Mini.* Modules Configured

### mini.files
- **Purpose**: macOS Finder-like file explorer (replaced neo-tree)
- **Keybindings**: 
  - `<leader>e` - Open in current file directory
  - `<leader>E` - Open in cwd
  - `<leader>fm` - Open with mini.files (directory of current file)
  - `<leader>fM` - Open with mini.files (cwd)
- **Features**: Column navigation, preview, Vim-style hjkl navigation

### mini.surround
- **Purpose**: Add/delete/change surroundings (quotes, brackets, tags)
- **Keybindings**:
  - `sa"` - Add surrounding "
  - `sd"` - Delete surrounding "
  - `sr"'` - Replace " with '
  - `sf"` - Find surrounding " (right)
  - `sF"` - Find surrounding " (left)
  - `sh` - Highlight surrounding
  - `sn` - Update n_lines

### mini.indentscope
- **Purpose**: Animated indent scope indicator
- **Features**: 
  - Vertical bar (`│`) showing current scope
  - No animation for performance
  - Integrates with border detection

### mini.hipatterns
- **Purpose**: Highlight patterns (hex colors, TODO comments)
- **Features**:
  - Hex color preview (`#rrggbb`)
  - FIXME - Red highlight
  - HACK - Orange highlight
  - TODO - Blue highlight
  - NOTE - Green highlight

## Xcodedark Integration
All mini.* plugins are themed via `xcodedark.nvim` integration:
```lua
integrations = {
  mini = true, -- Covers all mini.* plugins
  -- ... other integrations
}
```

Custom highlight groups defined in `mini-extras.lua`:
- `MiniHipatternsFixme` - `#ff0000` on `#2d2d30` (bold)
- `MiniHipatternsHack` - `#ffa500` on `#2d2d30` (bold)
- `MiniHipatternsTodo` - `#0080ff` on `#2d2d30` (bold)
- `MiniHipatternsNote` - `#00ff00` on `#2d2d30` (bold)

## LazyVim Extras Enabled
Current mini.* extras from `lazyvim.json`:
```json
{
  "extras": [
    "lazyvim.plugins.extras.editor.mini-surround",
    "lazyvim.plugins.extras.editor.mini-files",
    "lazyvim.plugins.extras.ui.mini-indentscope",
    "lazyvim.plugins.extras.coding.mini-comment",
    "lazyvim.plugins.extras.ui.mini-animate"
  ]
}
```

## Status
✅ **RESOLVED** - All mini.* plugins working correctly with no warnings
