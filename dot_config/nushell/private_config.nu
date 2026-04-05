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

# Default Neovim app name (use ~/.config/mini)
$env.NVIM_APPNAME = "mini"

# -----------------
# Completions & suggestions (awesome-nu: carapace-bin + Fish, reedline menus)
# Install: brew install carapace-bin  (optional: brew install fish for Fish completions)
# Tab = completion menu. → or Ctrl+→ = complete from history (suggestion).
# Uses Fish for git/nu when Fish is installed; Carapace for everything else. No conflict.
# -----------------
let carapace_completer = {|spans: list<string>|
  try {
    let result = (carapace $spans.0 nushell ...$spans | from json)
    if ($result | default [] | any {|x| ($x.display? | default "") | str starts-with "ERR" }) { null } else { $result }
  } catch { null }
}
# Fish completer (Nushell cookbook): use when Fish is installed for commands where Fish is nicer (git, nu).
let fish_completer = {|spans: list<string>|
  try {
    let cmd = ($spans | str replace --all "'" "\\'" | str join " ")
    fish --command $"complete '--do-complete=($cmd)'"
    | from tsv --flexible --noheaders --no-infer
    | rename value description
    | update value {|row|
      let v = $row.value
      let need_quote = ["'", '[', ']', '(', ')', ' ', (char tab), '"'] | any {|c| $c in $v }
      if $need_quote and ($v | path exists) {
        let p = if ($v | str starts-with '~') { $v | path expand --no-symlink } else { $v }
        $'"($p | str replace --all '"' '\\"')"'
      } else { $v }
    }
  } catch { null }
}
# One external completer: alias expansion, then Fish for git/nu (if fish available), else Carapace.
let external_completer = {|spans|
  let expanded = (scope aliases | where name == $spans.0 | get -o 0 | get -o expansion)
  let spans = if $expanded != null { $spans | skip 1 | prepend ($expanded | split row ' ' | take 1) } else { $spans }
  let cmd = $spans.0
  # Use Fish for git and nu (Fish’s git/commit/branch completions are strong); Carapace for the rest.
  let result = match $cmd {
    git => { do $fish_completer $spans }
    nu => { do $fish_completer $spans }
    _ => { do $carapace_completer $spans }
  }
  if $result != null { $result } else { do $carapace_completer $spans }
}
$env.config.completions = ($env.config.completions | default {} | merge {
  algorithm: "fuzzy"
  case_sensitive: false
  external: {
    enable: true
    max_results: 100
    completer: $external_completer
  }
})
# Completion menu: show more options, nicer layout
$env.config.menus = ($env.config.menus | default [] | each {|m|
  if $m.name == "completion_menu" {
    $m | merge { type: ($m.type | default {} | merge { columns: 4 col_padding: 2 }) }
  } else { $m }
})

# Path additions (Nu-way)
$env.PATH = ($env.PATH | split row (char esep) | prepend [
    $"($env.HOME)/.vite-plus/bin"
    $"($env.HOME)/.atuin/bin"
    $"($env.HOME)/.cargo/bin"
    $"($env.HOME)/.local/bin"
    "/opt/homebrew/bin"
    $"($env.HOME)/bin"
    $"($env.HOME)/.bun-/bin"
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
# Generate these files once with:
#   zoxide init nushell | save -f ~/.zoxide.nu
#   atuin init nu | save -f ~/.local/share/atuin/init.nu
#   oh-my-posh init nu --config ~/.mytheme.omp.json --print | save -f ~/.oh-my-posh.nu

# Keep Atuin init in sync automatically (interactive shells only)
if $nu.is-interactive and ((which atuin | default [] | length) > 0) {
  try { atuin init nu | save -f ~/.local/share/atuin/init.nu } catch {}
}

# Source tool configurations (evaluated at parse-time)
source ~/.zoxide.nu
source ~/.local/share/atuin/init.nu
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

# Broot (optional; run `broot --install` to get nushell launcher, then uncomment below)
# use '/Users/tuliopinheirocunha/.config/broot/launcher/nushell/br' *

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
def --wrapped bunx [...args] {
  ^bun x ...$args
}

# nupm - disabled due to incompatibility with nu 0.110+
# use ~/.local/share/nupm/modules/nupm
try { source '/Users/tuliopinheirocunha/.amasia/nushell/config.nu' } catch {}

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

# -----------------
# Suggested plugins & features (from awesome-nu: github.com/nushell/awesome-nu)
# Uncomment or install as needed.
# -----------------
# Syntax highlighting in REPL (nu_plugin_highlight):
#   cargo install nu_plugin_highlight --locked
#   plugin add ~/.cargo/bin/nu_plugin_highlight
# Structured skim for Nu data (nu_plugin_skim) – alternative to raw `sk` in keybinds:
#   cargo install nu_plugin_skim --locked
#   plugin add ~/.cargo/bin/nu_plugin_skim
# Core plugins (if installed with nu): gstat (git status), query (json/xml/sql), formats (eml/ics/ini), polars (dataframes)
#   plugin add (path dirname $nu.current-exe | path join "nu_plugin_gstat")
# Direnv: unclutter .env per directory – add to env.nu: mkdir ~/.config/direnv; direnv hook nu | save -f ~/.config/direnv/nu.hook; see direnv docs
# Optional custom completions (clone nu_scripts and source): git, cargo, npm
#   use ~/nu_scripts/custom-completions/git/git-completions.nu
# bru: Nushell wrapper for Homebrew – https://github.com/selfagency/bru

# CARAPACE START
if $nu.is-interactive {
  # `source` is resolved at parse time; `try` does not help if init.nu is missing. Regenerate with:
  #   mkdir -p ~/.cache/carapace; carapace _carapace nushell | save -f ~/.cache/carapace/init.nu
  source ~/.cache/carapace/init.nu
  $env.config.completions = (
    $env.config.completions | default {} | merge {
    partial: false
    quick: false
    algorithm: "fuzzy"
  })

  # Enforce fish-like Tab behavior in Nu: open/use completion menu instead of partial word insertion.
  let _tab_completion_fish_like = {
    name: "tab_completion_fish_like"
    modifier: "none"
    keycode: "tab"
    mode: ["emacs" "vi_normal" "vi_insert"]
    event: { send: "menu" name: "completion_menu" }
  }
  $env.config.keybindings = (
    $env.config.keybindings
    | default []
    | where name != "tab_completion_fish_like"
    | append $_tab_completion_fish_like
  )
}
# CARAPACE END


# Prevent disk bloat by enforcing Bun for global packages
def --wrapped npm [...rest] {
    if ("-g" in $rest) or ("--global" in $rest) {
        print "🚫 Blocked: Global npm installs are disabled to prevent disk bloat."
        print "👉 Please use: bun add -g <package>"
    } else {
        ^npm ...$rest
    }
}

def --wrapped pnpm [...rest] {
    if ("-g" in $rest) or ("--global" in $rest) {
        print "🚫 Blocked: Global pnpm installs are disabled to prevent disk bloat."
        print "👉 Please use: bun add -g <package>"
    } else {
        ^pnpm ...$rest
    }
}
