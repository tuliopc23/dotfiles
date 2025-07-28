function sync-dotfiles --description "Sync dotfiles with GitHub repository"
    set -l git_dir "$HOME/Library/Application Support/teaBASE/dotfiles.git"
    set -l work_tree "$HOME"
    
    # Set environment variables for the bare repository
    set -x GIT_DIR "$git_dir"
    set -x GIT_WORK_TREE "$work_tree"
    
    # Check if repository exists
    if not test -d "$git_dir"
        echo "❌ Dotfiles repository not found. Please run the setup script first."
        return 1
    end
    
    echo "🔄 Syncing dotfiles..."
    
    # Add specific files (Fish shell focused)
    git add .config/fish/config.fish 2>/dev/null; or true
    git add .config/fish/fish_plugins 2>/dev/null; or true  
    git add .config/fish/fish_variables 2>/dev/null; or true
    git add .config/fish/functions/ 2>/dev/null; or true
    git add .config/fish/conf.d/ 2>/dev/null; or true
    git add .config/fish/completions/ 2>/dev/null; or true
    git add .gitconfig 2>/dev/null; or true
    git add .profile 2>/dev/null; or true
    git add .bash_profile 2>/dev/null; or true
    git add .bashrc 2>/dev/null; or true
    git add .zshrc 2>/dev/null; or true
    
    # Check if there are any changes to commit
    if git diff-index --quiet HEAD --
        echo "✅ No changes to sync"
    else
        # Commit changes
        set -l commit_count (git rev-list --count HEAD)
        git commit -m "r$commit_count - dotfiles update"
        
        # Push to GitHub
        if git push origin main
            echo "✅ Dotfiles synced successfully to GitHub!"
        else
            echo "❌ Failed to push to GitHub"
            return 1
        end
    end
    
    # Clean up environment variables
    set -e GIT_DIR
    set -e GIT_WORK_TREE
end
