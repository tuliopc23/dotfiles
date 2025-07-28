#!/bin/bash

# Quick dotfiles installer - one-liner script
# Usage: curl -fsSL https://raw.githubusercontent.com/tuliopc23/dotfiles/main/quick-install.sh | bash
# Or: wget -qO- https://raw.githubusercontent.com/tuliopc23/dotfiles/main/quick-install.sh | bash

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_status() { echo -e "${BLUE}[INFO]${NC} $1"; }
print_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
print_warning() { echo -e "${YELLOW}[WARNING]${NC} $1"; }
print_error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Configuration
DOTFILES_REPO="https://github.com/tuliopc23/dotfiles.git"
INSTALL_SCRIPT_URL="https://raw.githubusercontent.com/tuliopc23/dotfiles/main/install-dotfiles.sh"
FISH_SCRIPT_URL="https://raw.githubusercontent.com/tuliopc23/dotfiles/main/setup-fish-config.fish"

print_status "🚀 Quick Dotfiles Installer"
print_status "=============================="

# Check if git is available
if ! command -v git >/dev/null 2>&1; then
    print_status "Installing Git..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        if ! command -v brew >/dev/null 2>&1; then
            print_status "Installing Homebrew first..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
        brew install git
    elif command -v apt-get >/dev/null 2>&1; then
        sudo apt-get update && sudo apt-get install -y git curl
    elif command -v yum >/dev/null 2>&1; then
        sudo yum install -y git curl
    elif command -v pacman >/dev/null 2>&1; then
        sudo pacman -S --noconfirm git curl
    else
        print_error "Unable to install Git automatically. Please install it manually and run this script again."
        exit 1
    fi
fi

# Create temporary directory
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

print_status "Downloading installation scripts..."

# Download the main installation script
if curl -fsSL "$INSTALL_SCRIPT_URL" -o install-dotfiles.sh; then
    chmod +x install-dotfiles.sh
    print_status "Running main installation script..."
    ./install-dotfiles.sh
else
    print_warning "Could not download installation script, falling back to basic setup..."
    
    # Fallback: Clone repository and run basic setup
    git clone "$DOTFILES_REPO" dotfiles
    cd dotfiles
    
    if [[ -f "install.sh" ]]; then
        chmod +x install.sh
        ./install.sh
    else
        print_warning "No install script found in repository"
        print_status "Repository cloned to $HOME/.dotfiles"
        
        # Basic symlink setup
        DOTFILES_DIR="$HOME/.dotfiles"
        if [[ -d "$TEMP_DIR/dotfiles" ]]; then
            cp -r "$TEMP_DIR/dotfiles" "$DOTFILES_DIR"
        fi
        
        # Create basic symlinks
        [[ -f "$DOTFILES_DIR/git/gitconfig" ]] && ln -sf "$DOTFILES_DIR/git/gitconfig" "$HOME/.gitconfig"
        [[ -f "$DOTFILES_DIR/fish/config.fish" ]] && { mkdir -p "$HOME/.config/fish"; ln -sf "$DOTFILES_DIR/fish/config.fish" "$HOME/.config/fish/config.fish"; }
        [[ -f "$DOTFILES_DIR/vim/vimrc" ]] && ln -sf "$DOTFILES_DIR/vim/vimrc" "$HOME/.vimrc"
        [[ -f "$DOTFILES_DIR/tmux/tmux.conf" ]] && ln -sf "$DOTFILES_DIR/tmux/tmux.conf" "$HOME/.tmux.conf"
    fi
fi

# Setup Fish shell if available
if command -v fish >/dev/null 2>&1; then
    print_status "Setting up Fish shell configuration..."
    if curl -fsSL "$FISH_SCRIPT_URL" -o setup-fish.fish; then
        chmod +x setup-fish.fish
        fish setup-fish.fish
    fi
fi

# Cleanup
cd "$HOME"
rm -rf "$TEMP_DIR"

print_success "✅ Dotfiles installation completed!"
print_status ""
print_status "Next steps:"
print_status "1. Restart your terminal or run 'exec \$SHELL'"
print_status "2. If using Fish shell, run 'exec fish'"
print_status "3. Customize your configuration in ~/.dotfiles/"
print_status ""
print_warning "Don't forget to:"
print_warning "• Update your Git configuration with your details"
print_warning "• Review and customize your shell aliases and functions"
print_warning "• Install additional tools specific to your workflow"
