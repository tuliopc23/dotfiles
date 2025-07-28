#!/bin/bash
# Setup script for dotfiles on a new machine

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}🔧 Setting up dotfiles on new machine...${NC}"

# Check if required tools are installed
if ! command -v git &> /dev/null; then
    echo -e "${RED}❌ Git is not installed. Please install git first.${NC}"
    exit 1
fi

if ! command -v gh &> /dev/null; then
    echo -e "${RED}❌ GitHub CLI is not installed. Please install gh first.${NC}"
    exit 1
fi

# Set up environment variables
export GIT_DIR="${XDG_DATA_HOME:-$HOME/Library/Application Support}"/teaBASE/dotfiles.git
export GIT_WORK_TREE="$HOME"

# Create the directory if it doesn't exist
mkdir -p "$(dirname "$GIT_DIR")"

echo -e "${YELLOW}🔐 Checking GitHub authentication...${NC}"

# Check if authenticated with GitHub
if ! gh auth status >/dev/null 2>&1; then
    echo -e "${YELLOW}🔐 Please authenticate with GitHub...${NC}"
    gh auth login
fi

echo -e "${YELLOW}📦 Cloning dotfiles repository...${NC}"

# Get GitHub username
USER="$(gh api user --jq '.login')"

# Clone the dotfiles repository as a bare repository
if [ -d "$GIT_DIR" ]; then
    echo -e "${YELLOW}⚠️  Dotfiles directory already exists. Removing...${NC}"
    rm -rf "$GIT_DIR"
fi

gh repo clone "git@github.com:$USER/dotfiles.git" "$GIT_DIR" -- --bare

# Configure the repository
cd "$HOME"
git config user.name "$USER"
git config user.email "$(gh api user --jq '.email')"
git config commit.gpgSign false

# Create backup of existing files
echo -e "${YELLOW}💾 Creating backup of existing dotfiles (if any)...${NC}"
mkdir -p "$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

# List files that would be overwritten
git ls-tree -r --name-only HEAD | while read file; do
    if [ -f "$HOME/$file" ] && [ ! -L "$HOME/$file" ]; then
        mkdir -p "$(dirname "$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)/$file")"
        cp "$HOME/$file" "$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)/$file" 2>/dev/null || true
    fi
done

# Checkout the files
echo -e "${YELLOW}📁 Checking out dotfiles...${NC}"
git checkout --force HEAD

echo -e "${GREEN}✅ Dotfiles setup complete!${NC}"
echo -e "${GREEN}🐠 Your Fish shell configuration has been restored.${NC}"
echo -e "${YELLOW}📝 Run 'sync-dotfiles' to sync changes back to GitHub.${NC}"
echo -e "${YELLOW}🔄 You may need to restart your terminal or run 'source ~/.config/fish/config.fish' to apply changes.${NC}"

# Clean up environment variables
unset GIT_DIR
unset GIT_WORK_TREE
