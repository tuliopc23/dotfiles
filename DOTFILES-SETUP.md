# Dotfiles Setup Scripts

This collection of scripts helps you download and install your dotfiles configuration on a new machine.

## Quick Installation (One-liner)

For fastest setup on a new machine, run one of these commands:

```bash
# Using curl
curl -fsSL https://raw.githubusercontent.com/tuliopc23/dotfiles/main/quick-install.sh | bash

# Using wget
wget -qO- https://raw.githubusercontent.com/tuliopc23/dotfiles/main/quick-install.sh | bash
```

## Manual Installation

If you prefer to download and review the scripts first:

### 1. Download the scripts

```bash
# Main installation script
curl -fsSL https://raw.githubusercontent.com/tuliopc23/dotfiles/main/install-dotfiles.sh -o install-dotfiles.sh

# Fish shell specific setup
curl -fsSL https://raw.githubusercontent.com/tuliopc23/dotfiles/main/setup-fish-config.fish -o setup-fish-config.fish

# Make them executable
chmod +x install-dotfiles.sh setup-fish-config.fish
```

### 2. Run the installation

```bash
# Run main installation script
./install-dotfiles.sh

# If you're using Fish shell, also run:
fish setup-fish-config.fish
```

## What These Scripts Do

### `install-dotfiles.sh`
- Installs prerequisites (Git, Fish shell, development tools)
- Backs up existing dotfiles to a timestamped backup directory
- Clones your dotfiles repository from GitHub
- Creates symbolic links to your configuration files
- Sets Fish as the default shell (if installed)
- Installs common development tools (neovim, tmux, fzf, ripgrep, bat, etc.)

### `setup-fish-config.fish`
- Installs Fisher (Fish plugin manager)
- Sets up Fish shell configuration
- Installs useful Fish plugins:
  - `autopair.fish` - Auto-close parentheses, brackets, quotes
  - `fzf.fish` - Fuzzy finder integration
  - `plugin-git` - Git abbreviations and functions
  - `done` - Notifications when long commands finish
  - `hydro` - Modern prompt theme
- Creates a comprehensive Fish configuration if none exists

### `quick-install.sh`
- One-liner installer that downloads and runs the other scripts
- Handles prerequisites automatically
- Provides fallback installation methods

## Directory Structure

The scripts expect your dotfiles repository to have this structure:

```
dotfiles/
├── install.sh              # Optional: custom install script
├── fish/
│   ├── config.fish         # Main Fish configuration
│   ├── functions/          # Custom Fish functions
│   └── conf.d/            # Additional Fish configuration
├── git/
│   └── gitconfig          # Git configuration
├── vim/
│   └── vimrc              # Vim configuration
├── tmux/
│   └── tmux.conf          # Tmux configuration
└── ...
```

## Customization

### Before Publishing
1. Create your dotfiles repository at `https://github.com/tuliopc23/dotfiles`
2. Add your configuration files in the expected structure
3. Upload these scripts to your repository
4. Test the installation on a fresh system

### Repository URL
The scripts are configured to use:
- Repository: `https://github.com/tuliopc23/dotfiles.git`
- Raw file URLs: `https://raw.githubusercontent.com/tuliopc23/dotfiles/main/...`

### Adding Custom Tools
Edit the `install_additional_tools()` function in `install-dotfiles.sh` to add tools specific to your workflow.

## Platform Support

- **macOS**: Full support with Homebrew
- **Linux**: Support for apt-get (Ubuntu/Debian), yum (CentOS/RHEL), and pacman (Arch)
- **Fish Shell**: Specialized setup with plugin management

## Safety Features

- **Automatic Backups**: All existing dotfiles are backed up before installation
- **Non-destructive**: Won't overwrite files without backing them up first
- **Rollback**: Backup directories are timestamped for easy restoration
- **Prerequisites Check**: Verifies and installs required tools

## Usage Examples

### Fresh macOS Setup
```bash
curl -fsSL https://raw.githubusercontent.com/tuliopc23/dotfiles/main/quick-install.sh | bash
exec fish
```

### Linux Server Setup
```bash
# Download and review first
wget https://raw.githubusercontent.com/tuliopc23/dotfiles/main/install-dotfiles.sh
chmod +x install-dotfiles.sh
./install-dotfiles.sh
```

### Fish Shell Only
```bash
curl -fsSL https://raw.githubusercontent.com/tuliopc23/dotfiles/main/setup-fish-config.fish | fish
```

## Troubleshooting

- **Permission Errors**: Some steps require sudo access for system-wide changes
- **Network Issues**: Scripts require internet access to download tools and repositories
- **Missing Tools**: Scripts will attempt to install prerequisites automatically
- **Fish Shell**: Restart your terminal after installation to use Fish as default shell

## Post-Installation

After running the scripts:

1. **Restart your terminal** or run `exec fish`
2. **Update Git configuration** with your personal details:
   ```bash
   git config --global user.name "Your Name"
   git config --global user.email "your.email@example.com"
   ```
3. **Review and customize** your configuration files in `~/.dotfiles/`
4. **Install additional tools** specific to your projects and workflow

## Backup Location

Original dotfiles are backed up to:
```
~/.dotfiles-backup-YYYYMMDD_HHMMSS/
~/.fish-backup-YYYYMMDD_HHMMSS/      # Fish-specific backups
```
