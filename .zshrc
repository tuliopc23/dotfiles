# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# Add cargo binaries to PATH
export PATH="$HOME/.cargo/bin:$PATH"


# Aliases to make eza the default command for listing files
alias ls='eza'
alias ll='eza -l'
alias la='eza -a'
alias lla='eza -la'
alias lt='eza --tree'

# Added by Windsurf
export PATH="/Users/tuliopinheirocunha/.codeium/windsurf/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"

source /Users/tuliopinheirocunha/.config/broot/launcher/bash/br

. "$HOME/.langflow/uv/env"

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"

. "$HOME/.npm-global/lib/node_modules/@getgrit/cli/node_modules/bin/env"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/tuliopinheirocunha/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
export PATH=$PATH:$HOME/.maestro/bin
