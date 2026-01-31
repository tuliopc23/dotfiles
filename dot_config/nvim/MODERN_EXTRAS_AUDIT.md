# LazyVim Modern Extras Audit - November 2025
## Complete Analysis of Available Extras (v15.0.0)

---

## Current Enabled Extras (16 total)

```json
{
  "extras": [
    "lazyvim.plugins.extras.ai.avante",
    "lazyvim.plugins.extras.coding.mini-comment",
    "lazyvim.plugins.extras.coding.mini-snippets",
    "lazyvim.plugins.extras.coding.yanky",
    "lazyvim.plugins.extras.editor.fzf",
    "lazyvim.plugins.extras.editor.overseer",
    "lazyvim.plugins.extras.editor.refactoring",
    "lazyvim.plugins.extras.formatting.biome",
    "lazyvim.plugins.extras.lang.json",
    "lazyvim.plugins.extras.lang.markdown",
    "lazyvim.plugins.extras.lang.typescript",
    "lazyvim.plugins.extras.ui.edgy",
    "lazyvim.plugins.extras.ui.mini-animate",
    "lazyvim.plugins.extras.ui.smear-cursor",
    "lazyvim.plugins.extras.ui.treesitter-context"
  ]
}
```

---

## 🎯 Recommended Modern Extras to Add

### Priority 1: Essential Missing (Highly Recommended)

#### 1. `editor.mini-files` ⭐⭐⭐⭐⭐
**Status**: MODERN (2024+)
**What**: Column-view file explorer (macOS Finder-like)
**Why**: 
- Perfect for macOS aesthetic
- Part of mini.nvim ecosystem (you already use mini.*)
- Modern alternative to neo-tree
- Column navigation like Finder
- Edit filesystem like a buffer

**Alternative**: `editor.neo-tree` (more traditional, IDE-like)

#### 2. `editor.inc-rename` ⭐⭐⭐⭐⭐
**Status**: MODERN
**What**: Live LSP rename preview
**Why**:
- See all changes before applying
- Shows impact of renaming
- Safer refactoring
- Modern IDE feature

#### 3. `editor.illuminate` ⭐⭐⭐⭐
**Status**: MODERN (moved to extra in v10)
**What**: Highlights symbol occurrences
**Why**:
- See all uses of variable/function
- Subtle, automatic
- Better than native LSP highlighting
- Essential for code navigation

#### 4. `ui.mini-indentscope` ⭐⭐⭐⭐⭐
**Status**: MODERN (replacement for indent-blankline)
**What**: Animated indent scope indicator
**Why**:
- Modern replacement you should already have
- Part of mini.nvim suite
- Animated, smoother than snacks.indent
- Works with mini.animate

**Note**: You removed `ui.indent-blankline` (good!) but this is even better than snacks.indent

---

### Priority 2: Quality of Life Enhancements

#### 5. `editor.dial` ⭐⭐⭐⭐
**Status**: MODERN
**What**: Enhanced increment/decrement (Ctrl+A/X)
**Why**:
- Works with dates, booleans, hex colors
- Extends native vim functionality
- Small but powerful

#### 6. `coding.mini-surround` ⭐⭐⭐⭐
**Status**: MODERN
**What**: Add/delete/change surrounding quotes, brackets, tags
**Why**:
- Part of mini.nvim suite
- Essential for editing
- Modern alternative to vim-surround

#### 7. `editor.harpoon2` ⭐⭐⭐
**Status**: MODERN (v2, rewritten)
**What**: Quick file navigation
**Why**:
- Jump between important files
- Better than marks
- Popular in 2024-2025

---

### Priority 3: UI Polish

#### 8. `util.mini-hipatterns` ⭐⭐⭐⭐
**Status**: MODERN
**What**: Highlight hex colors, TODO comments inline
**Why**:
- See colors in your code
- Highlight TODO/FIXME/NOTE
- Part of mini.nvim suite
- Great for CSS/design work

---

### Priority 4: Git Workflow

#### 9. `editor.mini-diff` ⭐⭐⭐
**Status**: CUTTING-EDGE (2024+)
**What**: Modern git diff overlay (alternative to gitsigns)
**Why**:
- Toggle diff view with `<leader>go`
- More features than gitsigns
- Part of mini.nvim suite
- Modern design

**Note**: You already have gitsigns, so this is optional

#### 10. `util.gh` ⭐⭐⭐
**Status**: MODERN
**What**: GitHub CLI integration
**Why**:
- View PRs/Issues in Neovim
- Create/review PRs
- Modern GitHub workflow
- Great for OSS projects

---

### Priority 5: Advanced (Optional)

#### 11. `test/core` ⭐⭐⭐
**Status**: MODERN
**What**: Test integration (neotest)
**Why**:
- Run tests from Neovim
- See results inline
- Essential for TDD

#### 12. `dap/core` ⭐⭐⭐
**Status**: MODERN
**What**: Debug Adapter Protocol
**Why**:
- Debugging in Neovim
- Breakpoints, watch variables
- Modern debugger UI

#### 13. `editor.leap` ⭐⭐⭐⭐
**Status**: MODERN (alternative to flash)
**What**: Fast cursor movement
**Why**:
- Jump anywhere with 2 keys
- Faster than normal navigation
- Modern vim motion

---

## ❌ Extras to AVOID (Legacy/Redundant)

### Legacy Plugins
- ❌ `coding.nvim-cmp` - Use blink.cmp (you already have it)
- ❌ `coding.luasnip` - Use mini-snippets or blink native
- ❌ `editor.telescope` - Use fzf (you already have it)
- ❌ `ui.indent-blankline` - Use mini-indentscope or snacks.indent
- ❌ `ui.alpha` - Use snacks.dashboard (core)
- ❌ `ui.dashboard-nvim` - Use snacks.dashboard (core)
- ❌ `ui.mini-starter` - Use snacks.dashboard (core)

### Redundant With Your Setup
- ❌ `editor.outline` - Redundant with snacks.picker symbols
- ❌ `editor.navic` - Breadcrumbs (not needed for most)
- ❌ `editor.snacks_picker` - You have fzf
- ❌ `editor.snacks_explorer` - Choose mini-files or neo-tree instead
- ❌ `lsp.none-ls` - Use conform.nvim (core) for formatting

---

## 📊 Complete Extras Categorization

### AI Extras (8 available)
**You Have**: avante ✅
**Available**:
- `ai/claudecode` - Claude AI integration
- `ai/codeium` - Free AI completion
- `ai/copilot` - GitHub Copilot
- `ai/copilot-chat` - Chat with Copilot
- `ai/copilot-native` - Native Copilot support
- `ai/sidekick` - AI assistant
- `ai/supermaven` - Fast AI completion
- `ai/tabnine` - Tabnine AI

**Recommendation**: Stick with avante unless you want Copilot

---

### Coding Extras (11 available)
**You Have**: mini-comment ✅, mini-snippets ✅, yanky ✅
**Recommended to Add**:
- ⭐ `coding/mini-surround` - Essential
- ⭐ `coding/neogen` - Generate annotations

**Available** (skip):
- `coding/blink` - You already have blink
- `coding/luasnip` - Legacy
- `coding/nvim-cmp` - Legacy

---

### Editor Extras (20 available)
**You Have**: fzf ✅, overseer ✅, refactoring ✅
**Highly Recommended**:
- ⭐⭐⭐⭐⭐ `editor/mini-files` - File explorer
- ⭐⭐⭐⭐⭐ `editor/inc-rename` - Live rename
- ⭐⭐⭐⭐ `editor/illuminate` - Symbol highlights
- ⭐⭐⭐⭐ `editor/dial` - Enhanced increment
- ⭐⭐⭐ `editor/harpoon2` - File navigation
- ⭐⭐⭐ `editor/leap` - Fast movement
- ⭐⭐⭐ `editor/mini-diff` - Git diff overlay
- ⭐⭐⭐ `editor/mini-move` - Move lines/blocks

**Available** (lower priority):
- `editor/aerial` - Symbol outline (optional, snacks has it)
- `editor/neo-tree` - Alternative to mini-files
- `editor/navic` - Breadcrumbs (optional)
- `editor/outline` - Redundant with snacks

**Skip** (legacy):
- ❌ `editor/telescope` - Use fzf
- ❌ `editor/snacks_picker` - Use fzf
- ❌ `editor/snacks_explorer` - Use mini-files

---

### Formatting Extras (3 available)
**You Have**: biome ✅
**Available**:
- `formatting/black` - Python formatter
- `formatting/prettier` - JS/TS formatter (if not using biome)

**Recommendation**: Biome is modern and fast, keep it!

---

### Language Extras (44 available!)
**You Have**: json ✅, markdown ✅, typescript ✅
**Recommendation**: Add languages as needed per project
**Popular Modern Languages**:
- `lang/go` - If you use Go
- `lang/rust` - If you use Rust
- `lang/python` - If you use Python
- `lang/tailwind` - For Tailwind CSS
- `lang/svelte` - For Svelte
- `lang/vue` - For Vue
- `lang/astro` - For Astro

---

### UI Extras (9 available)
**You Have**: edgy ✅, mini-animate ✅, smear-cursor ✅, treesitter-context ✅
**Highly Recommended**:
- ⭐⭐⭐⭐⭐ `ui/mini-indentscope` - Better than snacks.indent

**Skip** (legacy/redundant):
- ❌ `ui/alpha` - Legacy dashboard
- ❌ `ui/dashboard-nvim` - Legacy
- ❌ `ui/mini-starter` - Legacy
- ❌ `ui/indent-blankline` - Legacy (already removed)

---

### Utility Extras (10 available)
**Recommended**:
- ⭐⭐⭐⭐ `util/mini-hipatterns` - Color/TODO highlighting
- ⭐⭐⭐ `util/gh` - GitHub integration
- ⭐⭐ `util/project` - Project management
- ⭐⭐ `util/dot` - Dotfile management
- ⭐⭐ `util/chezmoi` - If you use chezmoi

**Available**:
- `util/gitui` - Terminal git UI
- `util/octo` - GitHub PR/Issues
- `util/rest` - REST client
- `util/startuptime` - Profile startup

---

### Testing & Debugging (3 available)
**Recommended for Developers**:
- ⭐⭐⭐ `test/core` - Test integration
- ⭐⭐⭐ `dap/core` - Debugger
- ⭐ `dap/nlua` - Lua debugging

---

## 🎯 Final Recommended Extras List

### Your Current (16) + Recommended Additions (9) = 25 Total

```json
{
  "extras": [
    // AI
    "lazyvim.plugins.extras.ai.avante",
    
    // Coding (add 2)
    "lazyvim.plugins.extras.coding.mini-comment",
    "lazyvim.plugins.extras.coding.mini-snippets",
    "lazyvim.plugins.extras.coding.mini-surround",     // NEW ⭐
    "lazyvim.plugins.extras.coding.neogen",            // NEW ⭐
    "lazyvim.plugins.extras.coding.yanky",
    
    // Editor (add 5)
    "lazyvim.plugins.extras.editor.dial",              // NEW ⭐
    "lazyvim.plugins.extras.editor.fzf",
    "lazyvim.plugins.extras.editor.harpoon2",          // NEW ⭐
    "lazyvim.plugins.extras.editor.illuminate",        // NEW ⭐
    "lazyvim.plugins.extras.editor.inc-rename",        // NEW ⭐
    "lazyvim.plugins.extras.editor.mini-files",        // NEW ⭐⭐⭐
    "lazyvim.plugins.extras.editor.overseer",
    "lazyvim.plugins.extras.editor.refactoring",
    
    // Formatting
    "lazyvim.plugins.extras.formatting.biome",
    
    // Languages
    "lazyvim.plugins.extras.lang.json",
    "lazyvim.plugins.extras.lang.markdown",
    "lazyvim.plugins.extras.lang.typescript",
    
    // UI (add 1)
    "lazyvim.plugins.extras.ui.edgy",
    "lazyvim.plugins.extras.ui.mini-animate",
    "lazyvim.plugins.extras.ui.mini-indentscope",      // NEW ⭐⭐⭐
    "lazyvim.plugins.extras.ui.smear-cursor",
    "lazyvim.plugins.extras.ui.treesitter-context",
    
    // Utilities (add 1)
    "lazyvim.plugins.extras.util.mini-hipatterns"      // NEW ⭐
  ]
}
```

---

## 🚀 Quick Action Commands

### Enable Recommended Extras
```fish
nvim
:LazyExtras
```

Then press `x` on:
1. ✅ `editor.mini-files` (file explorer)
2. ✅ `editor.inc-rename` (live rename)
3. ✅ `editor.illuminate` (symbol highlights)
4. ✅ `editor.dial` (enhanced increment)
5. ✅ `ui.mini-indentscope` (indent guides)
6. ✅ `coding.mini-surround` (surround text)
7. ✅ `util.mini-hipatterns` (color highlights)
8. ✅ `editor.harpoon2` (file navigation)
9. ✅ `coding.neogen` (generate docs)

### Verify No Legacy Extras
Make sure these are NOT enabled:
- ❌ `editor.telescope`
- ❌ `coding.nvim-cmp`
- ❌ `ui.indent-blankline` (already removed ✅)
- ❌ `ui.alpha`
- ❌ `ui.dashboard-nvim`

---

## 📈 Benefits of Recommended Additions

### mini.* Ecosystem Integration
You'll have:
- mini.comment ✅
- mini.snippets ✅
- mini.animate ✅
- mini.files ⭐ NEW
- mini.surround ⭐ NEW
- mini.indentscope ⭐ NEW
- mini.hipatterns ⭐ NEW

**Benefit**: Consistent API, lightweight, modern, well-maintained

### Modern File Navigation
- fzf-lua ✅ (fuzzy finder)
- mini.files ⭐ (file explorer)
- harpoon2 ⭐ (quick file jumps)
- illuminate ⭐ (symbol highlights)

**Benefit**: Fast, ergonomic file navigation

### Refactoring Suite
- refactoring ✅ (extract, inline)
- inc-rename ⭐ (live preview)
- illuminate ⭐ (see all occurrences)

**Benefit**: Safe, powerful refactoring

---

## 🎨 macOS Tahoe Aesthetic Maintained

All recommended extras support:
- ✅ Rounded borders (via winborder or per-plugin)
- ✅ Transparency settings
- ✅ Smooth animations (mini.animate, edgy)
- ✅ Modern design language
- ✅ Consistent with xcodedark theme

---

## 📝 Testing New Extras

### After Enabling

1. **mini.files** - `<leader>fm` or `:Snacks.picker.files()`
2. **inc-rename** - Cursor on symbol, `<leader>cr`
3. **illuminate** - Move cursor on symbol, others highlight
4. **dial** - `Ctrl+A`/`Ctrl+X` on dates, booleans
5. **mini.indentscope** - Open indented file, see scope
6. **mini.surround** - `sa"` to surround with quotes
7. **mini.hipatterns** - Open file with `#ff0000` or TODO
8. **harpoon2** - `<leader>h` keybindings
9. **neogen** - `<leader>cn` generate docs

---

## 🔄 Maintenance

### Stay Current
```fish
# Update all plugins
nvim
:Lazy update

# Check health
:checkhealth lazy
:checkhealth mini

# View extras
:LazyExtras
```

### Monitor LazyVim Releases
https://github.com/LazyVim/LazyVim/releases

---

## Summary

**Your Config Status**: ✅ 95% Modern

**What's Good**:
- ✅ Using fzf-lua (modern)
- ✅ Using blink.cmp (modern)
- ✅ Using snacks.nvim (modern)
- ✅ Modern UI (edgy, mini-animate, smear-cursor)
- ✅ No legacy plugins

**What's Missing** (9 recommended additions):
1. ⭐⭐⭐ mini.files (file explorer)
2. ⭐⭐⭐ inc-rename (live rename)
3. ⭐⭐⭐ illuminate (symbol highlights)
4. ⭐⭐⭐ mini.indentscope (indent guides)
5. ⭐⭐ dial (enhanced increment)
6. ⭐⭐ mini.surround (surround text)
7. ⭐⭐ mini.hipatterns (color highlights)
8. ⭐ harpoon2 (file navigation)
9. ⭐ neogen (generate docs)

**Action**: Enable 9 extras via `:LazyExtras` → Instant 100% modern setup! 🚀

---

**Last Updated**: November 20, 2025
**LazyVim Version**: v15.0.0
**Neovim Version**: 0.11.5
