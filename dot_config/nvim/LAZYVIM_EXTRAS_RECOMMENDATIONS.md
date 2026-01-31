# LazyVim Extras Analysis & Recommendations
## macOS Tahoe-Style Modern Configuration

Based on your current configuration and the modern macOS aesthetic you're targeting, here's a comprehensive analysis of LazyVim extras.

---

## Current Extras Enabled ✅

From your `lazyvim.json`:

### UI Extras (Already Enabled) ✅
1. **`ui.edgy`** ✅ - MODERN, RECOMMENDED
   - Window layout management with animations
   - Perfect for macOS-style sidebars
   - Works great with mini.animate

2. **`ui.mini-animate`** ✅ - MODERN, RECOMMENDED
   - Smooth cursor/scroll/window animations
   - Essential for macOS aesthetic
   - Toggle with `<leader>ua`

3. **`ui.smear-cursor`** ✅ - CUTTING-EDGE (2024+)
   - Cursor trail animation
   - Very modern, inspired by gaming UIs
   - Excellent choice for visual polish

4. **`ui.indent-blankline`** ✅ - LEGACY
   - Consider replacing with `ui.mini-indentscope`

5. **`ui.treesitter-context`** ✅ - MODERN
   - Sticky context header
   - Good for long files

### Editor Extras (Already Enabled) ✅
6. **`editor.fzf`** ✅ - MODERN (alternative to Telescope)
   - Native fzf integration
   - Fast fuzzy finding

7. **`editor.overseer`** ✅ - MODERN
   - Task runner integration

8. **`editor.refactoring`** ✅ - MODERN
   - Advanced refactoring tools

### Coding Extras (Already Enabled) ✅
9. **`coding.mini-comment`** ✅ - MODERN
10. **`coding.mini-snippets`** ✅ - MODERN
11. **`coding.yanky`** ✅ - MODERN

### Language Extras (Already Enabled) ✅
12. **`lang.json`** ✅
13. **`lang.markdown`** ✅
14. **`lang.typescript`** ✅

### Formatting Extras (Already Enabled) ✅
15. **`formatting.biome`** ✅ - MODERN (Rust-based formatter)

### AI Extras (Already Enabled) ✅
16. **`ai.avante`** ✅ - CUTTING-EDGE

---

## Recommended Additions for macOS Tahoe Aesthetic

### Priority 1: Essential Missing Pieces

#### 1. **File Explorer** (CHOOSE ONE)
You currently have NO file explorer enabled. Recommendations in order:

**a) `editor.neo-tree` (RECOMMENDED FOR BEGINNERS)**
- Most popular, traditional tree view
- Edgy integration already configured
- Best for IDE-like experience
- ⚡ **INSTALL THIS FIRST**

```lua
-- Already integrated with edgy.nvim!
-- Keybindings: <leader>e, <leader>fe
```

**b) `editor.mini-files` (MODERN, MINIMALIST)**
- Column-based navigation (like macOS Finder)
- Part of mini.nvim ecosystem (consistency)
- Edit filesystem like a buffer
- Best for macOS-native feel
- ⚡ **RECOMMENDED FOR MACOS AESTHETIC**

```lua
-- Keybindings: <leader>fm, <leader>fM
-- Column view similar to macOS Finder
```

**c) Oil.nvim (NOT AN EXTRA, MANUAL SETUP)**
- Edit filesystem like a text buffer
- Vim-vinegar style
- Requires manual configuration

**d) Yazi.nvim (NOT AN EXTRA, MANUAL SETUP)**
- Terminal file manager integration
- Very fast, written in Rust
- Requires yazi to be installed on system

**My Recommendation**: Start with `editor.neo-tree` for familiarity, then try `editor.mini-files` for the macOS column-view experience.

#### 2. **`ui.mini-indentscope`** (REPLACE indent-blankline)
- Modern animated indent guides
- More polished than indent-blankline
- Part of mini.nvim ecosystem
- ⚡ **HIGHLY RECOMMENDED**

**Action**: Disable `ui.indent-blankline`, enable `ui.mini-indentscope`

---

### Priority 2: Enhanced UI Elements

#### 3. **`editor.aerial`** (SYMBOLS OUTLINE)
- Document outline sidebar
- Shows functions, classes, etc.
- Integrates with edgy.nvim
- Essential for large files
- ⚡ **RECOMMENDED**

#### 4. **`ui.dashboard-nvim`** (IF YOU WANT CUSTOM DASHBOARD)
- Alternative to snacks.dashboard
- More customizable
- Beautiful startup screen
- ⚙️ **OPTIONAL** (snacks.dashboard is already modern)

---

### Priority 3: Additional Productivity

#### 5. **`editor.illuminate`**
- Highlights symbol under cursor
- Shows all occurrences in file
- Subtle, non-intrusive
- ⚡ **RECOMMENDED**

#### 6. **`editor.dial`**
- Enhanced increment/decrement (Ctrl+A/X)
- Works with dates, hex, booleans
- ⚙️ **NICE TO HAVE**

#### 7. **`editor.inc-rename`**
- Live LSP rename preview
- Shows all changes before applying
- ⚡ **HIGHLY RECOMMENDED**

#### 8. **`editor.mini-diff`** (ALTERNATIVE TO GITSIGNS)
- Modern git diff overlay
- Toggle with `<leader>go`
- Part of mini.nvim suite
- ⚙️ **OPTIONAL** (gitsigns is fine, but this is newer)

---

### Priority 4: Terminal & Task Management

#### 9. **`editor.toggleterm`**
- Floating/persistent terminals
- Multiple terminal support
- ⚙️ **OPTIONAL** (snacks.terminal is already good)

---

### Priority 5: Code Navigation

#### 10. **`editor.navic`** (IF REMOVED IN YOUR VERSION)
- Shows code context in winbar
- Breadcrumb navigation
- ⚙️ **OPTIONAL**

#### 11. **`editor.trouble`** (v3)
- Modern diagnostics panel
- Better than quickfix
- Probably already in core LazyVim
- ⚡ **VERIFY IT'S ENABLED**

---

## Extras to AVOID or SKIP

### ❌ **ui.noice** (DEPRECATED)
- **Status**: Replaced by snacks.nvim
- You correctly DON'T have this

### ❌ **coding.nvim-cmp** (LEGACY)
- **Status**: You're using blink.cmp (modern)
- Don't enable this

### ❌ **ui.alpha-nvim** (OLDER)
- **Status**: Use snacks.dashboard instead
- Alpha is older generation

### ❌ **editor.symbols-outline** (DEPRECATED)
- **Status**: Use aerial instead
- Symbols-outline is no longer maintained

---

## Suggested Action Plan

### Step 1: Essential Additions (Do Now)
```vim
:LazyExtras
```

Then enable these in order:
1. `editor.neo-tree` OR `editor.mini-files` (choose one)
2. `ui.mini-indentscope` (then disable ui.indent-blankline)
3. `editor.inc-rename`
4. `editor.illuminate`

### Step 2: Enhanced UI (Do Soon)
5. `editor.aerial`

### Step 3: Remove Legacy
- Disable `ui.indent-blankline` after enabling `ui.mini-indentscope`

---

## Complete Recommended Extras List

Here's what your `lazyvim.json` extras should look like for a modern macOS Tahoe-style config:

```json
{
  "extras": [
    // AI
    "lazyvim.plugins.extras.ai.avante",
    
    // Coding
    "lazyvim.plugins.extras.coding.mini-comment",
    "lazyvim.plugins.extras.coding.mini-snippets",
    "lazyvim.plugins.extras.coding.yanky",
    
    // Editor - File & Navigation
    "lazyvim.plugins.extras.editor.neo-tree",          // OR mini-files (choose one)
    "lazyvim.plugins.extras.editor.aerial",            // NEW: Symbol outline
    "lazyvim.plugins.extras.editor.fzf",
    "lazyvim.plugins.extras.editor.illuminate",        // NEW: Highlight occurrences
    "lazyvim.plugins.extras.editor.inc-rename",        // NEW: Live rename
    "lazyvim.plugins.extras.editor.overseer",
    "lazyvim.plugins.extras.editor.refactoring",
    
    // Formatting
    "lazyvim.plugins.extras.formatting.biome",
    
    // Languages
    "lazyvim.plugins.extras.lang.json",
    "lazyvim.plugins.extras.lang.markdown",
    "lazyvim.plugins.extras.lang.typescript",
    
    // UI - Modern macOS Aesthetic
    "lazyvim.plugins.extras.ui.edgy",
    "lazyvim.plugins.extras.ui.mini-animate",
    "lazyvim.plugins.extras.ui.mini-indentscope",      // NEW: Replace indent-blankline
    "lazyvim.plugins.extras.ui.smear-cursor",
    "lazyvim.plugins.extras.ui.treesitter-context"
  ]
}
```

---

## File Explorer: Detailed Comparison

| Feature | neo-tree | mini.files | oil.nvim | yazi.nvim |
|---------|----------|------------|----------|-----------|
| **Style** | Traditional tree | Column view | Buffer edit | Terminal TUI |
| **macOS Feel** | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐ |
| **LazyVim Integration** | ✅ Built-in | ✅ Built-in | ❌ Manual | ❌ Manual |
| **Edgy Support** | ✅ Yes | ⚠️ Limited | ❌ No | ❌ No |
| **Learning Curve** | Easy | Medium | Medium | Easy |
| **Speed** | Fast | Fast | Fast | Very Fast |
| **Best For** | IDE-like | macOS users | Vim purists | Terminal fans |

**My Recommendation**: 
- **For you**: `editor.mini-files` - Best macOS column-view experience
- **Alternative**: `editor.neo-tree` - More features, traditional tree

---

## How to Enable/Disable Extras

### Method 1: Interactive (Recommended)
```vim
:LazyExtras
```
- Use `x` to enable/disable
- Changes saved to `lazyvim.json`
- Restart Neovim after changes

### Method 2: Manual Edit
Edit `~/.config/nvim/lazyvim.json` and add/remove extras from the `extras` array.

### Method 3: Lua Config (Alternative)
In `lua/config/lazy.lua`, add imports before `{ import = "plugins" }`:

```lua
spec = {
  { "LazyVim/LazyVim", import = "lazyvim.plugins" },
  { import = "lazyvim.plugins.extras.editor.neo-tree" },
  { import = "lazyvim.plugins.extras.ui.mini-indentscope" },
  { import = "plugins" },
},
```

---

## macOS-Specific Configuration Tips

### 1. Ensure Smooth Animations
Your `ui.mini-animate` extra is already configured, but verify in options:

```lua
-- Should already be set by snacks.nvim
vim.opt.laststatus = 3  -- Global statusline
vim.opt.splitkeep = "screen"  -- Stable splits for animations
```

### 2. Native Rounded Borders
Already configured in your `options.lua`:
```lua
vim.opt.winborder = "rounded"  -- Neovim 0.11+ feature
```

### 3. Transparency
Already configured in `xcodedark`:
```lua
transparent = true
```

---

## Testing Your New Configuration

After enabling new extras:

1. **Restart Neovim completely**
   ```fish
   nvim
   ```

2. **Test file explorer**
   - Neo-tree: `<leader>e` or `<leader>fe`
   - Mini.files: `<leader>fm` or `<leader>fM`

3. **Test aerial (symbol outline)**
   ```vim
   :AerialToggle
   ```

4. **Test inc-rename**
   - Place cursor on a symbol
   - Press `<leader>cr` (code rename)
   - Type new name and see live preview

5. **Test mini-indentscope**
   - Open a file with indentation
   - Move cursor - should see animated scope indicator

---

## Summary: Your Modern Stack

| Category | Plugin | Status |
|----------|--------|--------|
| **Completion** | blink.cmp | ✅ Modern |
| **Notifications** | snacks.notifier | ✅ Modern |
| **Animations** | mini.animate + smear-cursor | ✅ Cutting-edge |
| **Window Mgmt** | edgy.nvim | ✅ Modern |
| **File Explorer** | MISSING | ⚠️ **ADD NOW** |
| **Indent Guide** | indent-blankline | ⚠️ **REPLACE** |
| **Symbols** | MISSING | ⚠️ **ADD aerial** |
| **Rename** | Built-in LSP | ⚠️ **ADD inc-rename** |
| **Highlight** | MISSING | ⚠️ **ADD illuminate** |

---

## Next Steps

1. ✅ Run `:LazyExtras`
2. ✅ Enable `editor.neo-tree` OR `editor.mini-files`
3. ✅ Enable `ui.mini-indentscope`
4. ✅ Enable `editor.inc-rename`
5. ✅ Enable `editor.illuminate`
6. ✅ Enable `editor.aerial`
7. ✅ Disable `ui.indent-blankline`
8. ✅ Restart Neovim
9. ✅ Test all new features

---

**Your configuration is already 90% modern!** Just need to add the file explorer and a few polish items. 🎨
