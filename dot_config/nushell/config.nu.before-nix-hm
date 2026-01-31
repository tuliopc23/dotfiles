# config.nu

# Unified Environment Variables
$env.config.edit_mode = 'vi'
$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = ""
$env.config.show_banner = false
$env.config.cursor_shape = {
    vi_insert: "blink_line"
    vi_normal: "blink_block"
    emacs: "blink_block"
}

$env.EDITOR = "nvim"
$env.VISUAL = "nvim"
$env.PAGER = "bat"
$env.BAT_THEME = "ansi"
$env.FEX_DEFAULT_COMMAND = "fex --time-type modified"

# Path additions (Nu-way)
$env.PATH = ($env.PATH | split row (char esep) | prepend [
    $"($env.HOME)/.cargo/bin"
    $"($env.HOME)/.local/bin"
    "/opt/homebrew/bin"
    $"($env.HOME)/bin"
    $"($env.HOME)/.bun/bin"
    $"($env.HOME)/.lmstudio/bin"
    "/Users/tuliopinheirocunha/.fex/bin"
    $"($env.HOME)/.opencode/bin"
    $"($env.HOME)/.x-cmd.root/bin"
] | uniq)


# -----------------
# Unified Aliases (Modern Replacements)
# -----------------
# alias ls = eza  # Removed to restore Nu's structured ls
alias cat = bat
# alias find = fd # Removed to restore Nu's structured 'find' command
alias grep = rg
# alias ps = procs # Removed to restore Nu's structured ps

# Common Aliases
# alias ll = eza -la # Removed to restore Nu's structured ls
# alias la = eza -A  # Removed to restore Nu's structured ls
# alias l = eza -CF  # Removed to restore Nu's structured ls
alias md = mkdir
alias .. = cd ..
alias ... = cd ../..

# Neovim Aliases
alias vim = nvim
alias avim = NVIM_APPNAME=avim nvim
alias nvchad = NVIM_APPNAME=nvchad nvim
alias kickvim = NVIM_APPNAME=kickvim nvim
alias minivim = NVIM_APPNAME=minivim nvim

# Emacs
alias em = emacsclient -c -a ""
alias spmacs = env SPACEMACSDIR=$"($env.HOME)/.config/spacemacs" command emacs -nw --init-directory $"($env.HOME)/.config/spacemacs"
alias doomt = /opt/homebrew/bin/emacs -nw --init-directory $"($env.HOME)/.emacs.d"
alias doomg = /Applications/Emacs.app/Contents/MacOS/Emacs --init-directory $"($env.HOME)/.emacs.d"


# -----------------
# Tool Initialization
# -----------------
# NOTE: In modern Nushell, `source` is evaluated at parse-time (before commands run).
# Generate these files once with:
#   zoxide init nushell | save -f ~/.zoxide.nu
#   atuin init nu | save -f ~/.local/share/atuin/init.nu
#   oh-my-posh init nu --config ~/.mytheme.omp.json | save -f ~/.oh-my-posh.nu

# Zoxide
source ~/.zoxide.nu

# Atuin
source ~/.local/share/atuin/init.nu

# Oh My Posh
source ~/.oh-my-posh.nu

# Yazi Wrapper
def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}

# Tere directory navigator
def --wrapped --env tere [...args] {
	let result = (^tere ...$args)
	if $result != "" {
		cd $result
	}
}

# Broot
use '/Users/tuliopinheirocunha/.config/broot/launcher/nushell/br' *

# x-cmd (binary only - full shell integration requires bash/zsh)
alias x = x-cmd
# User Abbreviations (Restored)
alias bi = brew install
alias bri = brew reinstall
alias bunn = brew uninstall
alias bu = brew update
alias bg = brew upgrade
alias g = git
alias ga = git add
alias gaa = git add --all
alias gc = git commit -v
alias gcm = git commit -m
alias gco = git checkout
alias gd = git diff
alias gp = git push
alias gl = git pull
alias gst = git status
alias gb = git branch

# nupm - disabled due to incompatibility with nu 0.110+
# use ~/.local/share/nupm/modules/nupm
source '/Users/tuliopinheirocunha/.amasia/nushell/config.nu'

# -----------------
# Skim Keybinds
# -----------------
$env.config.keybindings = ($env.config.keybindings | default [] | append [
    {
        name: fuzzy_file
        modifier: control
        keycode: char_t
        mode: [emacs, vi_normal, vi_insert]
        event: {
            send: executehostcommand
            cmd: "commandline edit --insert (ls **/* | where type == file | get name | sk | str trim)"
        }
    }
    {
        name: fuzzy_history
        modifier: control
        keycode: char_r
        mode: [emacs, vi_normal, vi_insert]
        event: {
            send: executehostcommand
            cmd: "commandline edit --replace (history | get command | reverse | uniq | sk | str trim)"
        }
    }
    {
        name: fuzzy_directory
        modifier: alt
        keycode: char_c
        mode: [emacs, vi_normal, vi_insert]
        event: {
            send: executehostcommand
            cmd: "cd (ls **/* | where type == dir | get name | sk | str trim)"
        }
    }
    {
        name: fuzzy_process
        modifier: alt
        keycode: char_p
        mode: [emacs, vi_normal, vi_insert]
        event: {
            send: executehostcommand
            cmd: "ps | sk --format { get name } --preview {} | get pid | kill $in"
        }
    }
])
