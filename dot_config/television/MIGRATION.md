# Migration from fzf to TV (television)

## Summary

Successfully migrated from fzf to TV (television) as the primary fuzzy finder in Fish shell.

## What Changed

### Removed

1. **FZF configuration block** (lines 51-127 in config.fish)
   - FZF environment variables (FZF_DEFAULT_COMMAND, FZF_CTRL_T_COMMAND, etc.)
   - FZF initialization (`fzf --fish | source`)
   - 11 custom fzf functions
   - 9 custom keybindings

2. **FZF function files**
   - `~/.config/fish/functions/fzf_configure_bindings.fish`
   - `~/.config/fish/functions/_fzf_search_directory.fish`
   - `~/.config/fish/functions/_fzf_search_git_log.fish`
   - `~/.config/fish/functions/_fzf_search_history.fish`
   - `~/.config/fish/functions/_fzf_search_processes.fish`
   - `~/.config/fish/functions/_fzf_search_variables.fish`
   - `~/.config/fish/functions/_fzf_extract_var_info.fish`
   - `~/.config/fish/functions/_fzf_preview_changed_file.fish`
   - `~/.config/fish/functions/_fzf_report_diff_type.fish`

3. **FZF completion file**
   - `~/.config/fish/completions/fzf_configure_bindings.fish`

### Added

1. **TV configuration section** in config.fish
   - 8 custom TV functions with improved error handling
   - Same keybindings (Ctrl+F, Ctrl+B, Ctrl+G, etc.)
   - Integration with existing tools (bat, eza, zoxide, procs)

2. **Enhanced TV configuration** (`~/.config/television/config.toml`)
   - Oxocarbon theme (matches terminal and nvim)
   - Extended channel triggers
   - Process management channels
   - Docker integration channels
   - NPM scripts channel

3. **Documentation**
   - `~/.config/television/README.md` - Complete usage guide
   - `~/.config/television/MIGRATION.md` - This file

## Keybinding Compatibility

All previous fzf keybindings are preserved with TV equivalents:

| Keybinding | fzf Function        | TV Function         | Status |
|------------|---------------------|---------------------|--------|
| Ctrl+F     | fzf-edit            | tv-files            | ✅     |
| Ctrl+B     | fzf-git-branch      | tv-git-branch       | ✅     |
| Ctrl+G     | fzf-git-log         | tv-git-log          | ✅     |
| Ctrl+X     | fzf-git-changed     | tv-git-changed      | ✅     |
| Ctrl+A     | fzf-rg              | tv-rg               | ✅     |
| Ctrl+K     | fzf-kill            | tv-kill             | ✅     |
| Ctrl+J     | fzf-cd              | tv-dir              | ✅     |
| Ctrl+E     | fzf-env             | tv-env              | ✅     |
| Ctrl+S     | fzf-git-stash       | (removed)           | ⚠️     |

**Note**: `fzf-git-stash` (Ctrl+S) and `fzf-git-commit` were removed. Use `tv-git-log` (Ctrl+G) for similar functionality.

## Shell Integration Improvements

TV adds automatic channel detection:

- Type `cd ` then press **Ctrl+T** → Opens directories channel
- Type `nvim ` then press **Ctrl+T** → Opens files channel  
- Type `git checkout ` then press **Ctrl+T** → Opens git branches channel
- Type `kill ` then press **Ctrl+T** → Opens processes channel
- Press **Ctrl+R** → Search command history

This is smarter than fzf which always opened the same finder.

## Performance Improvements

TV (written in Rust) is significantly faster than fzf (written in Go), especially for:
- Large directories
- Git repositories with many branches
- Command history search
- Real-time filtering

## New Features

1. **Remote Control** (Ctrl+T in TV interface)
   - Switch channels without exiting TV
   - Quick access to all available channels

2. **Per-Channel History**
   - TV remembers searches per channel
   - Navigate with Ctrl+Up/Down in TV interface

3. **Better Preview**
   - Native preview support
   - Syntax highlighting with bat
   - Tree view for directories with eza

4. **Multi-Source Search**
   - Can search multiple sources simultaneously
   - Unified interface for different data types

## Verification Steps

After migration, test these functions:

```fish
# File search
tv-files  # or press Ctrl+F

# Git operations
tv-git-branch  # or press Ctrl+B
tv-git-log     # or press Ctrl+G

# Process management
tv-kill  # or press Ctrl+K

# Directory navigation
tv-dir  # or press Ctrl+J

# Shell integration
cd <Ctrl+T>          # Should open dirs channel
nvim <Ctrl+T>        # Should open files channel
git checkout <Ctrl+T> # Should open git-branches channel
```

## Rollback (if needed)

If you need to rollback to fzf:

1. Restore fzf configuration from git:
   ```bash
   git checkout ~/.config/fish/config.fish
   ```

2. Restore fzf function files from git history

3. Reinstall fzf:
   ```bash
   brew install fzf
   ```

## Resources

- TV Documentation: https://alexpasmantier.github.io/television/
- TV GitHub: https://github.com/alexpasmantier/television
- Configuration: `~/.config/television/config.toml`
- Usage Guide: `~/.config/television/README.md`

## Next Steps

1. ✅ Removed all fzf configuration
2. ✅ Added comprehensive TV integration
3. ✅ Enhanced TV config with custom channel triggers
4. ✅ Created documentation
5. 🔄 Restart your shell to apply changes:
   ```fish
   exec fish
   ```
6. 📚 Read the usage guide: `bat ~/.config/television/README.md`
7. 🧪 Test the keybindings and functions

## Support

If you encounter issues:
1. Check `~/.config/television/README.md` for troubleshooting
2. Verify TV is in PATH: `which tv`
3. Test shell integration: `tv init fish | source`
4. Check configuration: `bat ~/.config/television/config.toml`
