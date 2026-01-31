# TV (Television) - Fuzzy Finder Integration

A comprehensive fuzzy finder integration replacing fzf in your Fish shell environment.

## Overview

TV (television) is a modern, blazingly fast fuzzy finder with excellent shell integration. It provides smart context-aware channel selection based on your command input.

## Installation

TV is already initialized in your `config.fish`:
```fish
tv init fish | source
```

## Shell Integration

TV automatically detects what you're trying to do and opens the appropriate channel:

### Automatic Channel Selection

Press `Ctrl+T` after typing a command:

- `cd <Ctrl+T>` → Opens directories channel
- `nvim <Ctrl+T>` → Opens files channel
- `git checkout <Ctrl+T>` → Opens git branches channel
- `git log <Ctrl+T>` → Opens git log channel
- `kill <Ctrl+T>` → Opens processes channel
- `export <Ctrl+T>` → Opens environment variables channel
- `npm run <Ctrl+T>` → Opens npm scripts channel

### Command History

- `Ctrl+R` → Search command history with TV

## Custom Functions

### File Operations

**`tv-files`** (Alt+F)
- Search and open files in your editor
- Uses fd for fast file discovery
- Respects .gitignore by default

### Git Operations

**`tv-git-branch`** (Alt+B)
- Interactive git branch switcher
- Shows both local and remote branches
- Automatically checks out selected branch

**`tv-git-log`** (Alt+G)
- Browse git commit history
- Preview commits with syntax highlighting
- Opens selected commit in bat for detailed view

**`tv-git-changed`** (Alt+X)
- Browse and edit git changed files
- Shows git status in fuzzy finder
- Opens selected file in your editor

### Search Operations

**`tv-rg`** (Alt+R)
- Search file contents with ripgrep
- Prompts for search pattern interactively
- Opens file at matching line in your editor

### Process Management

**`tv-kill`** (Alt+K)
- Interactive process killer
- Uses procs for better process information
- Safely terminates selected process

### Navigation

**`tv-dir`** (Alt+J)
- Smart directory navigation with zoxide integration
- Jumps to frequently used directories
- Fuzzy match on directory names

### Environment

**`tv-env`** (Alt+E)
- Browse environment variables
- Copies selected value to clipboard
- Shows confirmation message

## Keybindings Summary

### Shell Integration (TV Native)
| Key       | Function              | Description                          |
|-----------|-----------------------|--------------------------------------|
| Ctrl+T    | Shell integration     | Context-aware channel selection      |
| Ctrl+R    | Command history       | Search command history               |

### Custom TV Functions (Alt-based to avoid conflicts)
| Key       | Function              | Description                          |
|-----------|-----------------------|--------------------------------------|
| Alt+F     | tv-files              | Search and edit files                |
| Alt+B     | tv-git-branch         | Git branch switcher                  |
| Alt+G     | tv-git-log            | Git log viewer                       |
| Alt+X     | tv-git-changed        | Browse git changed files             |
| Alt+R     | tv-rg                 | Ripgrep search (prompts for pattern) |
| Alt+K     | tv-kill               | Kill processes                       |
| Alt+J     | tv-dir                | Smart directory jump                 |
| Alt+E     | tv-env                | Environment variables                |

## TV Interface Keybindings

While in TV interface:

| Key       | Action                    |
|-----------|---------------------------|
| j/Down    | Move down                 |
| k/Up      | Move up                   |
| Ctrl+N    | Next entry                |
| Ctrl+P    | Previous entry            |
| Enter     | Confirm selection         |
| Tab       | Toggle selection (multi)  |
| Shift+Tab | Toggle selection up       |
| Ctrl+O    | Toggle preview            |
| Ctrl+T    | Toggle remote control     |
| Ctrl+H    | Toggle help               |
| Ctrl+L    | Toggle layout             |
| Ctrl+Y    | Copy entry to clipboard   |
| Ctrl+R    | Reload source             |
| Esc       | Quit                      |
| Ctrl+C    | Quit                      |

## Configuration

Configuration file: `~/.config/television/config.toml`

### Theme

The configuration uses the **oxocarbon** theme to match your terminal and nvim setup.

### Channel Triggers

Custom channel triggers are configured for optimal workflow:

- **Files**: nvim, cat, bat, cp, mv, etc.
- **Directories**: cd, ls, eza, mkdir, pwd
- **Git branches**: git checkout, git switch, git branch
- **Git log**: git log, git show
- **Git diff**: git add, git restore, git diff
- **Processes**: kill, killall, ps, procs
- **Environment**: export, unset, printenv
- **Docker images**: docker run, docker exec
- **Docker containers**: docker start, docker stop
- **NPM scripts**: npm run, yarn run, pnpm run, bun run

### History

- History size: 200 entries
- Per-channel history (not global)
- Navigate history with Ctrl+Up/Down

## Tips & Tricks

1. **Smart Case Search**: Search is case-insensitive unless you use uppercase
2. **Hidden Files**: Hidden files are shown by default
3. **Preview Panel**: Toggle with Ctrl+O, scroll with PageUp/PageDown
4. **Multi-Select**: Use Tab to select multiple items, Enter to confirm
5. **Remote Control**: Press Ctrl+T to switch channels on-the-fly

## Advantages over fzf

- **Faster**: Written in Rust, optimized for performance
- **Smart Context**: Automatic channel selection based on command
- **Better UX**: Modern UI with rounded borders and status bar
- **Integrated History**: Per-channel command history
- **Remote Control**: Quick channel switching without leaving TV
- **Built-in Preview**: Native preview support with customization
- **Multi-source**: Can search multiple sources simultaneously

## Troubleshooting

### TV not working after typing command

Make sure shell integration is properly initialized:
```fish
tv init fish | source
```

### Keybindings not working

Check if keybindings conflict with Warp terminal. The config.fish already handles Warp compatibility.

### Theme not loading

Verify oxocarbon theme is available:
```bash
tv --list-themes
```

If not available, change to `theme = "default"` in config.toml

## Resources

- TV Documentation: https://alexpasmantier.github.io/television/
- GitHub Repository: https://github.com/alexpasmantier/television
- Issue Tracker: https://github.com/alexpasmantier/television/issues
