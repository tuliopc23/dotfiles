# Added by Antigravity
fish_add_path /Users/tuliopinheirocunha/.antigravity/antigravity/bin
if status is-interactive
    # -----------------
    # Default editor: Neovim (uses ~/.config/nvim)
    set -gx EDITOR nvim
    set -gx VISUAL nvim
    set -gx PAGER bat
    set -gx BAT_THEME ansi
    set -gx FEX_DEFAULT_COMMAND "fex --time-type modified"
    set -gx XDG_CONFIG_HOME "$HOME/.config"
    # Path Additions
    # Prefer vite-plus shims over legacy global package bins.
    fish_add_path -p $HOME/.vite-plus/bin $HOME/.cargo/bin $HOME/.local/bin /opt/homebrew/bin $HOME/bin $HOME/.bun-/bin $HOME/.lmstudio/bin /Users/tuliopinheirocunha/.fex/bin
    # -----------------
    # Tool Initialization
    # -----------------
    # Homebrew (Static for speed)
    set -gx HOMEBREW_PREFIX /opt/homebrew
    set -gx HOMEBREW_CELLAR /opt/homebrew/Cellar
    set -gx HOMEBREW_REPOSITORY /opt/homebrew
    set -gx MANPATH /opt/homebrew/share/man $MANPATH
    set -gx INFOPATH /opt/homebrew/share/info $INFOPATH
    fish_add_path -p /opt/homebrew/bin /opt/homebrew/sbin

    # Atuin (Cached)
    _gemini_load_cached_tool atuin "atuin init fish" "00_atuin_init.fish"

    # Atuin Hex PTY proxy (fish: source the init script; avoid bash-style eval "$(...)")
    atuin hex init | source
    # Oh My Posh (Direct Load to ensure prompt definition)
    oh-my-posh init fish --config ~/.mytheme.omp.json | source

    # Vi mode + blinking cursor shapes
    fish_vi_key_bindings
    set -g fish_cursor_default block-blink
    set -g fish_cursor_insert line-blink
    set -g fish_cursor_visual block-blink
    set -g fish_cursor_replace_one underscore-blink
    # Tv (Cached)
    _gemini_load_cached_tool tv "tv init fish" "00_tv_init.fish"

    # -----------------
    # UV Configuration (Gemini Added)
    # -----------------
    # Enforce uv as the exclusive Python manager
    alias pip="uv pip"
    alias pip3="uv pip"
    alias python="uv run python"
    alias venv="uv venv"
    alias py="uv run python"

    # -----------------
    # Unified Aliases (Modern Replacements)
    # -----------------
    alias ls="eza"
    alias cat="bat"
    alias find="fd"
    alias grep="rg"
    alias ps="procs"

    # Common Aliases
    alias ll="eza -la"
    alias la="eza -A"
    alias l="eza -CF"
    alias md="mkdir -p"
    alias ..="cd .."
    alias ...="cd ../.."

    # Neovim: default nvim uses ~/.config/nvim; other configs via aliases
    alias vim="nvim"
    alias nvc="env NVIM_APPNAME=nvchad nvim"
    alias avim="env NVIM_APPNAME=avim nvim"
    alias nvchad="env NVIM_APPNAME=nvchad nvim"
    alias mini="env NVIM_APPNAME=mini nvim"

    function avante
        nvim -c 'lua vim.defer_fn(function()require("avante.api").zen_mode()end, 100)'
    end

    # Yazi Wrapper
    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end

    # Tere directory navigator
    function tere
        set --local result (command tere $argv)
        [ -n "$result" ] && cd -- "$result"
    end

    # Broot
    if test -f /Users/tuliopinheirocunha/.config/broot/launcher/fish/br
        source /Users/tuliopinheirocunha/.config/broot/launcher/fish/br
    end

    # x-cmd (binaries only - full shell integration requires bash/zsh)
    fish_add_path -p "$HOME/.x-cmd.root/bin"
    alias x="x-cmd"

    # Greeting
    function fish_greeting
        printf "󰌢  MacBook Pro: Apple Silicon\n"
        printf "󰸘  Today is %s   󰅐  %s\n" (date "+%A, %B %d, %Y") (date "+%H:%M")
        printf "󱓟  We were going live baby! Flying High!\n"
    end
end

# User Abbreviations (Restored)
if status is-interactive
    abbr -a bs brew search
    abbr -a bi brew install
    abbr -a bri brew reinstall
    abbr -a bunn brew uninstall
    abbr -a bu brew update
    abbr -a bg brew upgrade
    abbr -a bup "brew update && brew upgrade"
    abbr -a top topgrade
    abbr -a g git
    abbr -a ga git add
    abbr -a gaa git add --all
    abbr -a gc git commit -v
    abbr -a gcm git commit -m
    abbr -a gco git checkout
    abbr -a gd git diff
    abbr -a gp git push
    abbr -a gl git pull
    abbr -a gst git status
    abbr -a gb git branch
    abbr -a wpar warp-preview agent run --profile hEdIVVybmMdjW1T8ZUPfV0 --prompt
    # System & Files
    abbr -a c clear
    abbr -a ex exit
    abbr -a cx chmod +x
    abbr -a ch chmod
    abbr -a md mkdir -p

    # Ripgrep
    abbr -a r rg
    abbr -a ri rg -i
    abbr -a rf rg --files

    # Ast-grep
    abbr -a sg ast-grep
    abbr -a sgn ast-grep new
    abbr -a sgs ast-grep scan
    abbr -a sgr ast-grep run

    # Eza / Listing
    abbr -a lt eza --tree --level=2

    # Flow Editor
    abbr -a fl flow
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

# opencode
fish_add_path /Users/tuliopinheirocunha/.opencode/bin

source /Users/tuliopinheirocunha/.config/op/plugins.sh

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/tuliopinheirocunha/.lmstudio/bin
# End of LM Studio CLI section

# Entire CLI shell completion
entire completion fish | source

# Added by ToolHive UI - do not modify this block
fish_add_path -g $HOME/.toolhive/bin
# End ToolHive UI
alias codebuff="~/.config/manicode/codebuff"

# CARAPACE START
if status is-interactive
    # Keep Fish native completions as primary; use Carapace as additive context-aware coverage.
    set -gx CARAPACE_BRIDGES 'zsh,bash,inshellisense'
    # Preserve Fish muscle-memory: Tab runs Fish completion behavior.
    bind --preset \t complete
    if command -q carapace
        carapace _carapace fish | string replace -r '^complete -e .*$' '' | source
    end
end
# CARAPACE END

# Never store GitHub tokens in this file. Use: `op inject` / 1Password env / a private `conf.d` snippet.
set -gx GIT_TERMINAL_PROMPT 0

# Added by git-ai installer on Tue Mar  3 19:56:35 -03 2026
fish_add_path -g "/Users/tuliopinheirocunha/.git-ai/bin"

# cubic
fish_add_path "/Users/tuliopinheirocunha/.cubic/bin"

# Bun
set -gx BUN_INSTALL "$HOME/.bun-"
fish_add_path "$BUN_INSTALL/bin"
alias bunx="bun x"

# Added by Antigravity
fish_add_path /Users/tuliopinheirocunha/.antigravity/antigravity/bin

# Added by Antigravity
fish_add_path /Users/tuliopinheirocunha/.antigravity/antigravity/bin

# Added by Antigravity
fish_add_path /Users/tuliopinheirocunha/.antigravity/antigravity/bin

# Added by Antigravity
fish_add_path /Users/tuliopinheirocunha/.antigravity/antigravity/bin

# Added by Antigravity
fish_add_path /Users/tuliopinheirocunha/.antigravity/antigravity/bin

# pnpm
set -gx PNPM_HOME /Users/tuliopinheirocunha/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Added by Antigravity
fish_add_path /Users/tuliopinheirocunha/.antigravity/antigravity/bin

# Added by Antigravity
fish_add_path /Users/tuliopinheirocunha/.antigravity/antigravity/bin

# Added by Antigravity
fish_add_path /Users/tuliopinheirocunha/.antigravity/antigravity/bin

# Added by Antigravity
fish_add_path /Users/tuliopinheirocunha/.antigravity/antigravity/bin

# Added by Antigravity
fish_add_path /Users/tuliopinheirocunha/.antigravity/antigravity/bin

# Added by Antigravity
fish_add_path /Users/tuliopinheirocunha/.antigravity/antigravity/bin

# Zig: last — undo wrappers that turn `zig build` into `zig master build` (unknown command: master).
if status is-interactive
    abbr --erase zig 2>/dev/null
    while functions -q zig
        functions -e zig
    end
    if test -d $HOME/.local/bin
        fish_add_path -m $HOME/.local/bin
    end
end
