# My Dotfiles

Personal development environment configuration files and setup scripts.

## Quick Setup

### One-liner installation (recommended)
```bash
curl -fsSL https://raw.githubusercontent.com/tuliopc23/dotfiles/main/quick-install.sh | bash
```

### Manual installation
```bash
git clone https://github.com/tuliopc23/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install-dotfiles.sh
```

## What's Included

- **Fish Shell Configuration** - Modern shell with plugins and custom functions
- **Git Configuration** - Aliases, settings, and helpful functions  
- **Development Tools** - Neovim, tmux, fzf, ripgrep, bat, and more
- **Automated Setup Scripts** - Zero-config installation on new machines

## Installation Scripts

- `install-dotfiles.sh` - Main installation script with full system setup
- `setup-fish-config.fish` - Fish shell specific configuration and plugins
- `quick-install.sh` - One-liner installer for easy sharing
- `DOTFILES-SETUP.md` - Detailed documentation

## Features

✅ **Automatic backups** of existing configuration files  
✅ **Cross-platform support** (macOS and Linux)  
✅ **Fish shell** with modern plugins and theme  
✅ **Development tools** installation and setup  
✅ **Git configuration** with useful aliases  
✅ **Safe installation** with rollback capability  

## Requirements

- Git
- Curl or wget
- Internet connection

The installation scripts will automatically install other prerequisites like Homebrew (macOS), Fish shell, and development tools.

## Directory Structure

```
~/.dotfiles/
├── install-dotfiles.sh     # Main installation script
├── setup-fish-config.fish  # Fish shell setup
├── quick-install.sh        # One-liner installer
├── fish/                   # Fish shell configuration
├── git/                    # Git configuration
├── vim/                    # Vim/Neovim configuration
├── tmux/                   # Tmux configuration
└── ...
```

## Customization

Feel free to fork this repository and customize it for your own needs. The scripts are designed to be modular and easy to modify.

## Backup & Safety

All installation scripts create timestamped backups of existing configuration files before making changes. Backups are stored in:
- `~/.dotfiles-backup-YYYYMMDD_HHMMSS/`
- `~/.fish-backup-YYYYMMDD_HHMMSS/`

## Support

For detailed setup instructions and troubleshooting, see [DOTFILES-SETUP.md](DOTFILES-SETUP.md).

---

**Note**: These dotfiles are personalized for my development workflow. You may want to review and modify the configurations before using them.
