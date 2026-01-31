# Xcodedark Customization Guide

This guide will help you further customize your xcodedark Neovim configuration after the initial setup.

## Current Status ✅

Your configuration is ready with:
- ✅ Xcodedark theme with transparency
- ✅ All UI plugins configured with rounded borders
- ✅ Modern macOS aesthetics
- ✅ Neovim 0.11.5 (supports all features)

## Next Steps for Customization

### Step 1: Launch and Verify
```fish
nvim
```

On first launch:
1. Lazy.nvim will automatically install all plugins
2. Wait for installation to complete (watch bottom status)
3. Press `q` to close the Lazy window when done
4. Restart Neovim: `:qa` then `nvim`

### Step 2: Customize Xcodedark Colors

Edit `lua/plugins/colorscheme.lua` to adjust the xcodedark theme:

```lua
require("xcodedark").setup({
  transparent = true,  -- false for solid background
  
  -- Customize syntax highlighting styles
  styles = {
    comments = { italic = true },      -- Italic comments
    keywords = { bold = true },        -- Bold keywords (if, for, while, etc.)
    functions = {},                    -- Add { bold = true } or { italic = true }
    variables = {},                    -- Add styles for variables
    strings = {},                      -- Add styles for strings
    booleans = { bold = true },        -- Bold true/false
    types = {},                        -- Add styles for types
    constants = {},                    -- Add styles for constants
    operators = {},                    -- Add styles for + - * /
    punctuation = {},                  -- Add styles for , ; . etc.
  },
  
  terminal_colors = true,  -- Use xcodedark colors in terminal
})
```

### Step 3: Adjust Transparency Levels

Edit `lua/config/options.lua`:

```lua
-- Window transparency (0 = opaque, 100 = fully transparent)
opt.pumblend = 10   -- Popup menu (completion, etc.)
opt.winblend = 10   -- Floating windows

-- For more/less transparency:
opt.pumblend = 0    -- No transparency (solid)
opt.pumblend = 30   -- More transparent
```

### Step 4: Border Style Customization

In `lua/config/options.lua`, change border style:

```lua
-- Options for winborder:
opt.winborder = "rounded"  -- Current (soft, modern)
opt.winborder = "single"   -- Sharp corners
opt.winborder = "double"   -- Double lines
opt.winborder = "solid"    -- Solid fill
```

### Step 5: Fine-tune Individual Plugin Colors

Each plugin config file can be customized independently:

#### Bufferline Colors
Edit `lua/plugins/bufferline.lua`:
```lua
opts = {
  options = {
    separator_style = "thin",  -- or "thick", "slant", "padded_slant"
    indicator = {
      style = "underline",     -- or "icon", "none"
    },
  },
}
```

#### Lualine Sections
Edit `lua/plugins/lualine.lua` to customize sections:
```lua
-- Example: Add custom component
opts.sections.lualine_x = {
  {
    function()
      return " My Custom Text"
    end,
  },
}
```

#### Telescope Layout
Edit `lua/plugins/telescope.lua`:
```lua
layout_config = {
  width = 0.87,    -- Window width (0.0 - 1.0)
  height = 0.80,   -- Window height
  preview_width = 0.55,  -- Preview pane width
}
```

### Step 6: Xcodedark-specific Integrations

The theme automatically styles these plugins (already enabled):

| Plugin | Integration | Styled Elements |
|--------|-------------|-----------------|
| telescope | ✓ | Search UI, borders, highlights |
| bufferline | ✓ | Tabs, separators, indicators |
| gitsigns | ✓ | Git signs in gutter |
| which-key | ✓ | Popup menu |
| notify/snacks | ✓ | Notifications |
| blink.cmp | ✓ | Completion menu (optimized!) |
| neo-tree | ✓ | File explorer |
| lualine | ✓ | Status line |

### Step 7: Advanced Color Overrides

To override specific highlight groups with xcodedark colors:

Create `lua/config/autocmds.lua`:
```lua
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "xcodedark",
  callback = function()
    local colors = require("xcodedark.colors")
    
    -- Override specific highlights
    vim.api.nvim_set_hl(0, "Comment", { 
      fg = colors.comment, 
      italic = true 
    })
    
    -- Example: Make cursor line more visible
    vim.api.nvim_set_hl(0, "CursorLine", { 
      bg = colors.bg_highlight 
    })
    
    -- Example: Custom border color
    vim.api.nvim_set_hl(0, "FloatBorder", { 
      fg = colors.border,
      bg = "NONE"  -- Transparent background
    })
  end,
})
```

### Step 8: Toggle Transparency On-the-fly

Add to `lua/config/keymaps.lua`:
```lua
-- Toggle transparency
vim.keymap.set("n", "<leader>ut", function()
  local current = vim.g.xcodedark_transparent or false
  vim.g.xcodedark_transparent = not current
  vim.cmd("colorscheme xcodedark")
end, { desc = "Toggle transparency" })
```

### Step 9: Add Custom Keybindings

Edit `lua/config/keymaps.lua`:
```lua
local map = vim.keymap.set

-- Example: Quick theme toggle
map("n", "<leader>uT", function()
  if vim.g.colors_name == "xcodedark" then
    vim.cmd("colorscheme tokyonight")
  else
    vim.cmd("colorscheme xcodedark")
  end
end, { desc = "Toggle theme" })

-- Example: Quick transparency adjustment
map("n", "<leader>u+", function()
  vim.opt.winblend = math.min(vim.opt.winblend:get() + 5, 100)
  vim.opt.pumblend = math.min(vim.opt.pumblend:get() + 5, 100)
end, { desc = "Increase transparency" })

map("n", "<leader>u-", function()
  vim.opt.winblend = math.max(vim.opt.winblend:get() - 5, 0)
  vim.opt.pumblend = math.max(vim.opt.pumblend:get() - 5, 0)
end, { desc = "Decrease transparency" })
```

## Testing Your Configuration

### 1. Check Theme is Loaded
```vim
:lua print(vim.g.colors_name)
```
Should output: `xcodedark`

### 2. View Highlight Groups
```vim
:Telescope highlights
```

### 3. Test Completion Menu
- Type some code
- Trigger completion (usually `<C-Space>`)
- Should see rounded borders with xcodedark colors

### 4. Test Diagnostics
- Open a file with LSP
- Hover over something: `K`
- Should see rounded borders

### 5. Test Notifications
```vim
:lua vim.notify("Test notification", vim.log.levels.INFO)
```

## Common Customization Patterns

### Make Comments More Visible
```lua
-- In lua/plugins/colorscheme.lua
styles = {
  comments = { italic = true, bold = true },  -- Added bold
}
```

### Disable Transparency for Specific Windows
```lua
-- In lua/config/options.lua
opt.winblend = 0     -- Solid floating windows
opt.pumblend = 10    -- But keep completion menu transparent
```

### Change Border Characters
```lua
-- In lua/config/options.lua
-- Custom border characters (for more control)
local border = {
  { "╭", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╮", "FloatBorder" },
  { "│", "FloatBorder" },
  { "╯", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╰", "FloatBorder" },
  { "│", "FloatBorder" },
}

-- Then use this for specific plugins
-- Example in mason.lua:
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = border }
)
```

## Useful Commands

```vim
:Lazy                    " Open plugin manager
:Lazy sync              " Update all plugins
:Lazy clean             " Remove unused plugins
:Mason                  " Open LSP installer
:Telescope colorscheme  " Try different themes
:checkhealth            " Verify configuration
:messages               " View error messages
```

## Performance Tips

1. **Profile startup time**:
   ```fish
   nvim --startuptime startup.log
   ```

2. **Check slow plugins**:
   ```vim
   :Lazy profile
   ```

3. **Optimize for xcodedark**:
   - Transparency requires terminal compositor (might be slower)
   - Solid backgrounds are faster: set `transparent = false`

## Getting Help

- Check `:h xcodedark` after installation
- View plugin docs: `:h lazy.nvim`, `:h telescope`, etc.
- LazyVim docs: https://lazyvim.org
- Xcodedark repo: https://github.com/V4N1LLA-1CE/xcodedark.nvim

## Reverting Changes

If you want to go back to defaults:
```fish
cd ~/.config/nvim
git stash  # Save your changes
git reset --hard origin/main  # Reset to original
```

---

**Pro Tip**: After making changes, always restart Neovim completely (`:qa` then relaunch) to see the full effect!
