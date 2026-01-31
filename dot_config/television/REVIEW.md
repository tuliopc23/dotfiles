# TV Integration Review & Fixes

## FileContext: VISIBLE
All files reviewed from actual config locations.

## Issues Found

### 🔴 CRITICAL - Functions Not Loading
**Status**: Functions defined in `config.fish` are not accessible
**Cause**: Functions defined inside `if status is-interactive` blocks in config.fish don't persist properly in Fish shell
**Impact**: All custom TV keybindings (Ctrl+F, Ctrl+B, etc.) will fail

### 🟡 MEDIUM - Keybinding Conflicts

1. **Ctrl+E Conflict**
   - TV custom function: `tv-env` 
   - Fish preset: `bind` command
   - Custom unstage binding: `echo; unstage; commandline -f repaint;`
   - **Risk**: Ctrl+E won't trigger `tv-env`

2. **Ctrl+R Conflict (Potential)**
   - TV shell integration: Command history search
   - Atuin: Also uses Ctrl+R for history search
   - **Risk**: Both will compete for Ctrl+R

3. **Ctrl+B, Ctrl+F Conflicts (Potential)**
   - TV custom functions use these
   - Fish presets: `backward-char` and `forward-char`
   - **Risk**: May override TV functions

### 🟢 LOW - TV-RG Usage Issue
**Status**: `tv-rg` requires pattern argument but keybinding doesn't prompt
**Impact**: Pressing Ctrl+A will show error instead of prompting for pattern

## Required Fixes

### Fix 1: Move Functions to Separate Files (CRITICAL)

Fish functions should be in `~/.config/fish/functions/` directory, not inline in config.fish.

**Files to create**:
- `~/.config/fish/functions/tv-files.fish`
- `~/.config/fish/functions/tv-git-branch.fish`
- `~/.config/fish/functions/tv-git-log.fish`
- `~/.config/fish/functions/tv-git-changed.fish`
- `~/.config/fish/functions/tv-rg.fish`
- `~/.config/fish/functions/tv-kill.fish`
- `~/.config/fish/functions/tv-dir.fish`
- `~/.config/fish/functions/tv-env.fish`

### Fix 2: Resolve Keybinding Conflicts

**Approach**: Use alternative keybindings that don't conflict

**Recommended changes**:
- Keep Ctrl+T and Ctrl+R for TV shell integration (priority)
- Move custom functions to Alt-based keybindings or F-keys
- Preserve commonly expected behaviors (Ctrl+B/F for navigation)

### Fix 3: Improve tv-rg Function

Make `tv-rg` prompt for pattern if not provided, or change keybinding to not call it directly.

### Fix 4: Verify Dependencies

Ensure all required tools are installed:
- tv (television) ✅
- bat ✅ (already in config)
- eza ✅ (already aliased)
- procs (for tv-kill)
- rg (ripgrep, for tv-rg)
- zoxide ✅ (already initialized)

## Recommended Keybinding Scheme

### Shell Integration (TV Native)
- **Ctrl+T**: Smart autocomplete (context-aware channel)
- **Ctrl+R**: Command history search

### Custom TV Functions (Non-conflicting)
- **Alt+F**: `tv-files` - File search
- **Alt+B**: `tv-git-branch` - Git branch switcher
- **Alt+G**: `tv-git-log` - Git log viewer
- **Alt+X**: `tv-git-changed` - Git changed files
- **Alt+R**: `tv-rg-prompt` - Ripgrep search (with prompt)
- **Alt+K**: `tv-kill` - Process killer
- **Alt+J**: `tv-dir` - Directory navigation
- **Alt+E**: `tv-env` - Environment variables

This avoids all Ctrl conflicts while maintaining muscle memory proximity.

## Implementation Priority

1. ✅ **HIGH**: Create function files (fixes critical issue)
2. ✅ **HIGH**: Update keybindings to non-conflicting keys
3. ✅ **MEDIUM**: Fix tv-rg to prompt for pattern
4. ✅ **LOW**: Verify all dependencies installed

## Testing Checklist

After fixes:
- [ ] Source config: `exec fish`
- [ ] Verify functions exist: `type tv-files`
- [ ] Test shell integration: type `cd ` then Ctrl+T
- [ ] Test command history: Ctrl+R
- [ ] Test custom functions: Alt+F, Alt+B, etc.
- [ ] Verify no keybinding conflicts: `bind | grep -E '(\\cf|\\cb)'`

## Confidence: HIGH
All issues identified from actual config files and Fish shell behavior documentation.
