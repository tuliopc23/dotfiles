# Quick Actions: Enable Recommended Extras

## 🚀 Fast Path (Recommended for You)

Open Neovim and run this single command:

```vim
:LazyExtras
```

Then use the interactive UI:
- Navigate with `j/k` or arrow keys
- Press `x` to **toggle** an extra on/off
- Press `?` for help
- Press `q` to quit

---

## ✅ Extras to Enable (Priority Order)

### 1. File Explorer (Choose ONE)
- **Option A** (Recommended for macOS feel): `editor.mini-files`
  - Finder-like column view
  - Modern, minimal
  
- **Option B** (More features): `editor.neo-tree`
  - Traditional tree view
  - Full-featured
  - Better edgy integration

### 2. UI Improvements
- **Enable**: `ui.mini-indentscope`
  - Modern animated indent guides
  - Part of mini.nvim ecosystem

### 3. Code Intelligence
- **Enable**: `editor.inc-rename`
  - Live LSP rename preview
  - See all changes before applying

- **Enable**: `editor.illuminate`
  - Highlight symbol occurrences
  - Subtle, automatic

### 4. Symbol Navigation
- **Enable**: `editor.aerial`
  - Document outline (functions, classes, etc.)
  - Integrates with edgy sidebar

---

## ❌ Extras to Disable

### Remove Legacy
- **Disable**: `ui.indent-blankline`
  - After enabling `ui.mini-indentscope`
  - Avoid conflicts

---

## 📋 Visual Checklist

```
Priority 1: File Explorer
[ ] editor.mini-files (macOS style) OR
[ ] editor.neo-tree (traditional)

Priority 2: Modern UI
[ ] ui.mini-indentscope (enable)
[ ] ui.indent-blankline (disable after above)

Priority 3: Code Tools
[ ] editor.inc-rename
[ ] editor.illuminate

Priority 4: Navigation
[ ] editor.aerial

Done!
[ ] Restart Neovim
[ ] Test with keybindings
```

---

## 🎯 Expected Results After Restart

### File Explorer
- **mini.files**: Press `<leader>fm` → See column view
- **neo-tree**: Press `<leader>e` → See tree sidebar

### Indent Guides
- Open any indented file → See animated scope indicator

### Inc-rename
- Cursor on a variable → Press `<leader>cr` → See live preview

### Illuminate
- Cursor on a symbol → Other occurrences auto-highlighted

### Aerial
- Open a code file → Run `:AerialToggle` → See symbol outline

---

## ⚡ Super Quick: One-Line Summary

**Do this:**
1. `nvim`
2. `:LazyExtras`
3. Enable: `mini-files`, `mini-indentscope`, `inc-rename`, `illuminate`, `aerial`
4. Disable: `indent-blankline`
5. Restart

**Total time**: 2 minutes

---

## 🔧 Alternative: Manual JSON Edit

If you prefer editing manually, update `lazyvim.json`:

```json
{
  "extras": [
    "lazyvim.plugins.extras.ai.avante",
    "lazyvim.plugins.extras.coding.mini-comment",
    "lazyvim.plugins.extras.coding.mini-snippets",
    "lazyvim.plugins.extras.coding.yanky",
    
    // ADD THESE:
    "lazyvim.plugins.extras.editor.mini-files",
    "lazyvim.plugins.extras.editor.aerial",
    "lazyvim.plugins.extras.editor.illuminate",
    "lazyvim.plugins.extras.editor.inc-rename",
    
    "lazyvim.plugins.extras.editor.fzf",
    "lazyvim.plugins.extras.editor.overseer",
    "lazyvim.plugins.extras.editor.refactoring",
    "lazyvim.plugins.extras.formatting.biome",
    "lazyvim.plugins.extras.lang.json",
    "lazyvim.plugins.extras.lang.markdown",
    "lazyvim.plugins.extras.lang.typescript",
    "lazyvim.plugins.extras.ui.edgy",
    
    // REMOVE THIS:
    // "lazyvim.plugins.extras.ui.indent-blankline",
    
    // ADD THIS INSTEAD:
    "lazyvim.plugins.extras.ui.mini-indentscope",
    
    "lazyvim.plugins.extras.ui.mini-animate",
    "lazyvim.plugins.extras.ui.smear-cursor",
    "lazyvim.plugins.extras.ui.treesitter-context"
  ]
}
```

---

## 📚 Learn More

See `LAZYVIM_EXTRAS_RECOMMENDATIONS.md` for:
- Detailed comparisons
- Full extra descriptions
- Advanced configuration options
- Troubleshooting tips

---

**Ready? Let's make your config even more amazing!** 🎨
