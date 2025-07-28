#!/bin/bash

# Dotfiles Installation Script
# This script downloads and sets up dotfiles on a new machine

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
DOTFILES_REPO="https://github.com/tuliopc23/dotfiles.git"
DOTFILES_DIR="$HOME/.dotfiles"
BACKUP_DIR="$HOME/.dotfiles-backup-$(date +%Y%m%d_%H%M%S)"

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install prerequisites
install_prerequisites() {
    print_status "Installing prerequisites..."
    
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        if ! command_exists brew; then
            print_status "Installing Homebrew..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
        
        if ! command_exists git; then
            print_status "Installing Git..."
            brew install git
        fi
        
        if ! command_exists fish; then
            print_status "Installing Fish shell..."
            brew install fish
        fi
        
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux
        if command_exists apt-get; then
            # Debian/Ubuntu
            sudo apt-get update
            sudo apt-get install -y git curl fish
        elif command_exists yum; then
            # CentOS/RHEL
            sudo yum install -y git curl fish
        elif command_exists pacman; then
            # Arch Linux
            sudo pacman -S --noconfirm git curl fish
        fi
    fi
}

# Backup existing dotfiles
backup_existing() {
    print_status "Backing up existing dotfiles to $BACKUP_DIR..."
    mkdir -p "$BACKUP_DIR"
    
    # List of common dotfiles to backup
    local files=(
        ".bashrc"
        ".zshrc"
        ".vimrc"
        ".gitconfig"
        ".tmux.conf"
        ".config/fish"
        ".config/nvim"
        ".config/git"
    )
    
    for file in "${files[@]}"; do
        if [[ -e "$HOME/$file" ]]; then
            print_status "Backing up $file"
            cp -r "$HOME/$file" "$BACKUP_DIR/"
        fi
    done
}

# Clone or update dotfiles repository
setup_dotfiles_repo() {
    if [[ -d "$DOTFILES_DIR" ]]; then
        print_status "Updating existing dotfiles repository..."
        cd "$DOTFILES_DIR"
        git pull origin main
    else
        print_status "Cloning dotfiles repository..."
        git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
        cd "$DOTFILES_DIR"
    fi
}

# Create symlinks
create_symlinks() {
    print_status "Creating symlinks..."
    
    # Make the install script executable
    if [[ -f "$DOTFILES_DIR/install.sh" ]]; then
        chmod +x "$DOTFILES_DIR/install.sh"
        "$DOTFILES_DIR/install.sh"
    else
        # Manual symlink creation if no install script exists
        local config_files=(
            "fish/config.fish:.config/fish/config.fish"
            "git/gitconfig:.gitconfig"
            "vim/vimrc:.vimrc"
            "tmux/tmux.conf:.tmux.conf"
        )
        
        for mapping in "${config_files[@]}"; do
            local source="${mapping%%:*}"
            local target="${mapping##*:}"
            
            if [[ -f "$DOTFILES_DIR/$source" ]]; then
                mkdir -p "$(dirname "$HOME/$target")"
                ln -sf "$DOTFILES_DIR/$source" "$HOME/$target"
                print_success "Linked $source -> $target"
            fi
        done
    fi
}

# Set Fish as default shell
setup_fish_shell() {
    if command_exists fish; then
        print_status "Setting Fish as default shell..."
        
        # Add fish to /etc/shells if not already there
        if ! grep -q "$(which fish)" /etc/shells; then
            echo "$(which fish)" | sudo tee -a /etc/shells
        fi
        
        # Change default shell to fish
        if [[ "$SHELL" != "$(which fish)" ]]; then
            chsh -s "$(which fish)"
            print_success "Default shell changed to Fish"
            print_warning "Please restart your terminal or run 'exec fish' to start using Fish"
        fi
    fi
}

# Install additional tools
install_additional_tools() {
    print_status "Installing additional development tools..."
    
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS specific tools
        local tools=(
            "neovim"
            "tmux"
            "fzf"
            "ripgrep"
            "bat"
            "exa"
            "fd"
            "jq"
        )
        
        for tool in "${tools[@]}"; do
            if ! command_exists "$tool"; then
                print_status "Installing $tool..."
                brew install "$tool"
            fi
        done
        
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux specific tools
        if command_exists apt-get; then
            sudo apt-get install -y neovim tmux fzf ripgrep bat fd-find jq
        fi
    fi
}

# Main execution
main() {
    print_status "Starting dotfiles installation..."
    
    # Check if DOTFILES_REPO is set
    if [[ "$DOTFILES_REPO" == "https://github.com/yourusername/dotfiles.git" ]]; then
        print_error "Please update DOTFILES_REPO variable with your actual repository URL"
        exit 1
    fi
    
    install_prerequisites
    backup_existing
    setup_dotfiles_repo
    create_symlinks
    setup_fish_shell
    install_additional_tools
    
    print_success "Dotfiles installation completed!"
    print_status "Backup of original files saved to: $BACKUP_DIR"
    print_status "Please restart your terminal or run 'exec fish' to start using your new configuration"
}

# Run main function
main "$@"
