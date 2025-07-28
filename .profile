# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/profile.pre.bash" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/profile.pre.bash"
. "$HOME/.cargo/env"


# Added by Toolbox App
export PATH="$PATH:/Users/tuliopinheirocunha/Library/Application Support/JetBrains/Toolbox/scripts"

. "$HOME/.langflow/uv/env"

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/profile.post.bash" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/profile.post.bash"

. "$HOME/.npm-global/lib/node_modules/@getgrit/cli/node_modules/bin/env"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/tuliopinheirocunha/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
