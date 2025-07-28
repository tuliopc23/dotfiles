#!/usr/bin/fish

# Fish Shell Dotfiles Setup Script
# This script sets up Fish shell configuration and plugins

set -l RED '\033[0;31m'
set -l GREEN '\033[0;32m'
set -l YELLOW '\033[1;33m'
set -l BLUE '\033[0;34m'
set -l NC '\033[0m' # No Color

# Configuration
set -l DOTFILES_DIR "$HOME/.dotfiles"
set -l FISH_CONFIG_DIR "$HOME/.config/fish"
set -l BACKUP_DIR "$HOME/.fish-backup-"(date +%Y%m%d_%H%M%S)

# Function to print colored output
function print_status
    echo -e "$BLUE[INFO]$NC $argv"
end

function print_success
    echo -e "$GREEN[SUCCESS]$NC $argv"
end

function print_warning
    echo -e "$YELLOW[WARNING]$NC $argv"
end

function print_error
    echo -e "$RED[ERROR]$NC $argv"
end

# Check if command exists
function command_exists
    command -v $argv[1] >/dev/null 2>&1
end

# Install Fisher (Fish plugin manager)
function install_fisher
    print_status "Installing Fisher plugin manager..."
    
    if not functions -q fisher
        curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
        fisher install jorgebucaran/fisher
        print_success "Fisher installed successfully"
    else
        print_status "Fisher is already installed"
    end
end

# Install common Fish plugins
function install_fish_plugins
    print_status "Installing Fish plugins..."
    
    set -l plugins \
        "jorgebucaran/autopair.fish" \
        "PatrickF1/fzf.fish" \
        "jhillyerd/plugin-git" \
        "franciscolourenco/done" \
        "jorgebucaran/hydro"
    
    for plugin in $plugins
        print_status "Installing $plugin..."
        fisher install $plugin
    end
    
    print_success "Fish plugins installed"
end

# Setup Fish configuration
function setup_fish_config
    print_status "Setting up Fish configuration..."
    
    # Create Fish config directory if it doesn't exist
    mkdir -p $FISH_CONFIG_DIR
    mkdir -p $FISH_CONFIG_DIR/functions
    mkdir -p $FISH_CONFIG_DIR/conf.d
    
    # Backup existing config if it exists
    if test -f $FISH_CONFIG_DIR/config.fish
        print_status "Backing up existing Fish config..."
        mkdir -p $BACKUP_DIR
        cp $FISH_CONFIG_DIR/config.fish $BACKUP_DIR/
    end
    
    # Create or update config.fish
    if test -f $DOTFILES_DIR/fish/config.fish
        ln -sf $DOTFILES_DIR/fish/config.fish $FISH_CONFIG_DIR/config.fish
        print_success "Linked Fish config from dotfiles"
    else
        # Create a basic config if none exists in dotfiles
        create_basic_fish_config
    end
    
    # Link other Fish configuration files
    if test -d $DOTFILES_DIR/fish/functions
        for func_file in $DOTFILES_DIR/fish/functions/*.fish
            set -l func_name (basename $func_file)
            ln -sf $func_file $FISH_CONFIG_DIR/functions/$func_name
            print_success "Linked function: $func_name"
        end
    end
    
    if test -d $DOTFILES_DIR/fish/conf.d
        for conf_file in $DOTFILES_DIR/fish/conf.d/*.fish
            set -l conf_name (basename $conf_file)
            ln -sf $conf_file $FISH_CONFIG_DIR/conf.d/$conf_name
            print_success "Linked config: $conf_name"
        end
    end
end

# Create a basic Fish configuration if none exists
function create_basic_fish_config
    print_status "Creating basic Fish configuration..."
    
    cat > $FISH_CONFIG_DIR/config.fish << 'EOF'
# Fish Shell Configuration

# Remove greeting
set fish_greeting

# Set default editor
set -gx EDITOR nvim

# Add common paths
fish_add_path /usr/local/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/bin

# Homebrew setup (macOS)
if test -d /opt/homebrew
    eval (/opt/homebrew/bin/brew shellenv)
end

# Node.js version manager setup
if test -d $HOME/.nvm
    set -gx NVM_DIR $HOME/.nvm
end

# Rust cargo setup
if test -d $HOME/.cargo
    fish_add_path $HOME/.cargo/bin
end

# Go setup
if test -d $HOME/go
    set -gx GOPATH $HOME/go
    fish_add_path $GOPATH/bin
end

# Python setup
if command -v python3 >/dev/null
    alias python python3
    alias pip pip3
end

# Git aliases
alias g git
alias ga 'git add'
alias gc 'git commit'
alias gp 'git push'
alias gs 'git status'
alias gl 'git log --oneline'

# Common aliases
alias ll 'ls -la'
alias la 'ls -la'
alias l 'ls -l'
alias .. 'cd ..'
alias ... 'cd ../..'
alias grep 'grep --color=auto'

# Modern CLI tools aliases (if available)
if command -v exa >/dev/null
    alias ls exa
    alias ll 'exa -la'
end

if command -v bat >/dev/null
    alias cat bat
end

if command -v fd >/dev/null
    alias find fd
end

# Custom functions
function mkcd
    mkdir -p $argv[1]; and cd $argv[1]
end

function extract
    switch $argv[1]
        case '*.tar.bz2'
            tar xjf $argv[1]
        case '*.tar.gz'
            tar xzf $argv[1]
        case '*.bz2'
            bunzip2 $argv[1]
        case '*.rar'
            unrar x $argv[1]
        case '*.gz'
            gunzip $argv[1]
        case '*.tar'
            tar xf $argv[1]
        case '*.tbz2'
            tar xjf $argv[1]
        case '*.tgz'
            tar xzf $argv[1]
        case '*.zip'
            unzip $argv[1]
        case '*.Z'
            uncompress $argv[1]
        case '*.7z'
            7z x $argv[1]
        case '*'
            echo "Unknown archive format: $argv[1]"
    end
end

# Load local configuration if it exists
if test -f $HOME/.config/fish/local.fish
    source $HOME/.config/fish/local.fish
end
EOF
    
    print_success "Basic Fish configuration created"
end

# Setup Fish shell as default
function setup_default_shell
    if command_exists fish
        print_status "Setting Fish as default shell..."
        
        set -l fish_path (which fish)
        
        # Add fish to /etc/shells if not already there
        if not grep -q $fish_path /etc/shells
            echo $fish_path | sudo tee -a /etc/shells
        end
        
        # Change default shell to fish
        if test "$SHELL" != "$fish_path"
            chsh -s $fish_path
            print_success "Default shell changed to Fish"
            print_warning "Please restart your terminal to start using Fish"
        else
            print_success "Fish is already the default shell"
        end
    else
        print_error "Fish shell is not installed"
    end
end

# Main execution
function main
    print_status "Starting Fish dotfiles setup..."
    
    install_fisher
    setup_fish_config
    install_fish_plugins
    setup_default_shell
    
    print_success "Fish dotfiles setup completed!"
    if test -d $BACKUP_DIR
        print_status "Backup of original files saved to: $BACKUP_DIR"
    end
    print_status "Please restart your terminal or run 'exec fish' to start using your new configuration"
end

# Run main function
main $argv
