==============================================================================
amp: 1 ⚠️

amp.nvim ~

- ✅ OK Plugin is initialized
- ✅ OK WebSocket server is running on port 60501
- ⚠️ WARNING No Amp CLI clients connected
- ✅ OK Authentication token is configured
- ✅ OK Lockfile exists at /Users/tuliopinheirocunha/.local/share/amp/ide/60501.json
- ✅ OK Amp CLI found at /Users/tuliopinheirocunha/Library/pnpm/amp
- ✅ OK Amp CLI version: 0.0.1767873688-gd9ce3f(released2026-01-08T12:06:38.173Z,3hago)
- ✅ OK Workspace folder: /Users/tuliopinheirocunha/.config/nvim

==============================================================================
avante: 1 ❌

avante.nvim ~

- ✅ OK Found required plugin: MunifTanjim/nui.nvim
- ✅ OK Found required plugin: nvim-lua/plenary.nvim
- ✅ OK Found icons plugin (nvim-web-devicons or mini.icons)
- ✅ OK Using native input provider (no additional dependencies required)
- ❌ ERROR Copilot provider is configured but neither copilot.lua nor copilot.vim is installed

TreeSitter Dependencies ~

- ✅ OK All essential TreeSitter parsers are installed
- ✅ OK TreeSitter highlighter is available

==============================================================================
blink.cmp: 1 ⚠️

System ~

- ✅ OK curl is installed
- ✅ OK git is installed
- ✅ OK Your system is supported by pre-built binaries (aarch64-apple-darwin)
- ✅ OK blink_cmp_fuzzy lib is downloaded/built

Sources ~

- ⚠️ WARNING Some providers may show up as "disabled" but are enabled dynamically (e.g. cmdline)

Default sources ~

- lsp (blink.cmp.sources.lsp)
- path (blink.cmp.sources.path)
- snippets (blink.cmp.sources.snippets)
- buffer (blink.cmp.sources.buffer)
- avante (blink-cmp-avante)
- dadbod (vim_dadbod_completion.blink)

Cmdline sources ~

- buffer (blink.cmp.sources.buffer)
- cmdline (blink.cmp.sources.cmdline)

Disabled sources ~

- lazydev (lazydev.integrations.blink)
- omni (blink.cmp.sources.complete_func)

==============================================================================
conform: 4 ⚠️

conform.nvim report ~

- Log file: /Users/tuliopinheirocunha/.local/state/nvim/conform.log
- ✅ OK fish_indent ready (fish)
- ✅ OK gofumpt ready (go)
- ✅ OK goimports ready (go)
- ⚠️ WARNING markdown-toc unavailable: Condition failed
- ⚠️ WARNING markdownlint-cli2 unavailable: Condition failed
- ✅ OK prettier ready (markdown.mdx, markdown)
- ✅ OK shfmt ready (sh)
- ⚠️ WARNING sqlfluff unavailable: Root directory not found
- ✅ OK stylua ready (lua)
- ⚠️ WARNING typstyle unavailable: Command 'typstyle' not found

==============================================================================
crates: ✅

Checking plugins ~

Checking external dependencies ~

- ✅ OK curl installed

==============================================================================
dap: ✅

dap: Adapters ~

dap.adapter: delve ~

- ✅ OK is executable: /Users/tuliopinheirocunha/.local/share/nvim/mason/bin/dlv

dap.adapter: codelldb ~

- ✅ OK is executable: /Users/tuliopinheirocunha/.local/share/nvim/mason/bin/codelldb

dap.adapter: chrome ~

- Adapter is a function. Can't validate it

dap.adapter: pwa-msedge ~

- ✅ OK is executable: js-debug-adapter

dap.adapter: debugpy ~

- Adapter is a function. Can't validate it

dap.adapter: go ~

- Adapter is a function. Can't validate it

dap.adapter: msedge ~

- Adapter is a function. Can't validate it

dap.adapter: pwa-chrome ~

- ✅ OK is executable: js-debug-adapter

dap.adapter: node ~

- Adapter is a function. Can't validate it

dap.adapter: python ~

- Adapter is a function. Can't validate it

dap.adapter: pwa-node ~

- ✅ OK is executable: js-debug-adapter

dap: Sessions ~

- ✅ OK No active sessions

==============================================================================
grug-far: ✅

Checking external dependencies ~

- ✅ OK rg: found ripgrep 15.1.0
- ✅ OK ast-grep: found ast-grep 0.40.4

==============================================================================
kulala: 3 ⚠️ 2 ❌

System: ~

- {OS} Darwin 25.3.0
- {Neovim} version 0.11.5
- {kulala.nvim} version 5.3.3

Tools: ~

- ✅ OK {cURL} found: /usr/bin/curl (version: 8.7.1)
- ❌ ERROR {gRPCurl} not found
- ❌ ERROR {websocat} not found
- ✅ OK {openssl} found: /opt/homebrew/bin/openssl (version: 3.6.0)
- ✅ OK {NPM} found: /opt/homebrew/bin/npm (version: unknown)

Formatters: ~

- ✅ OK {application/xml} formatter: xmllint --format -
- ✅ OK {application/graphql-response+json} formatter: jq .
- ✅ OK {application/lua} formatter: stylua -
- ✅ OK {application/json} formatter: jq .
- ⚠️ WARNING {application/javascript} formatter not found
- ⚠️ WARNING {text/html} formatter not found
- ⚠️ WARNING {application/graphql} formatter not found

==============================================================================
lazy: ✅

lazy.nvim ~

- {lazy.nvim} version `11.17.5`
- ✅ OK {git} `version 2.52.0`
- ✅ OK no existing packages found by other package managers
- ✅ OK packer_compiled.lua not found

luarocks ~

- ✅ OK luarocks disabled

==============================================================================
lazyvim: ✅

LazyVim ~

- ✅ OK Using Neovim >= 0.11.2
- ✅ OK `git` is installed
- ✅ OK `rg` is installed
- ✅ OK `fd` is installed
- ✅ OK `lazygit` is installed
- ✅ OK `fzf` is installed
- ✅ OK `curl` is installed

LazyVim nvim-treesitter ~

- ✅ OK `C compiler` is installed
- ✅ OK `curl` is installed
- ✅ OK `tar` is installed
- ✅ OK `tree-sitter (CLI)` is installed

==============================================================================
lspconfig: ✅

- Skipped. This healthcheck is redundant with `:checkhealth vim.lsp`.

==============================================================================
mason: 5 ⚠️

mason.nvim ~

- ✅ OK mason.nvim version v2.2.1
- ✅ OK PATH: prepend
- ✅ OK Providers:
  mason.providers.registry-api
  mason.providers.client
- ✅ OK neovim version >= 0.10.0

mason.nvim [Registries] ~

- ✅ OK Registry `github.com/mason-org/mason-registry version: 2026-01-08-rigid-metal` is installed.
- ✅ OK Registry `SynthesizedRegistrySource` is installed.

mason.nvim [Core utils] ~

- ✅ OK unzip: `UnZip 6.00 of 20 April 2009, by Info-ZIP, with modifications by Apple Inc.`
- ✅ OK wget: `GNU Wget 1.25.0, a non-interactive network retriever.`
- ✅ OK curl: `curl 8.7.1 (x86_64-apple-darwin25.0) libcurl/8.7.1 (SecureTransport) LibreSSL/3.3.6 zlib/1.2.12 nghttp2/1.68.0`
- ✅ OK gzip: `Ok`
- ✅ OK gtar: `tar (GNU tar) 1.35`
- ✅ OK bash: `GNU bash, version 5.3.9(1)-release (aarch64-apple-darwin25.1.0)`

mason.nvim [Languages] ~

- ✅ OK Ruby: `ruby 2.6.10p210 (2022-04-12 revision 67958) [universal.arm64e-darwin25]`
- ⚠️ WARNING Composer: not available
  - ADVICE:
    - spawn: composer failed with exit code - and signal -. Could not find executable "composer" in PATH.

- ⚠️ WARNING PHP: not available
  - ADVICE:
    - spawn: php failed with exit code - and signal -. Could not find executable "php" in PATH.

- ✅ OK Go: `go version go1.25.5 darwin/arm64`
- ✅ OK cargo: `cargo 1.92.0 (Homebrew)`
- ✅ OK node: `v25.2.1`
- ⚠️ WARNING javac: not available
  - ADVICE:
    - spawn: javac failed with exit code 1 and signal 0. The operation couldn’t be completed. Unable to locate a Java Runtime.
      Please visit <http://www.java.com> for information on installing Java.

- ⚠️ WARNING julia: not available
  - ADVICE:
    - spawn: julia failed with exit code - and signal -. Could not find executable "julia" in PATH.

- ⚠️ WARNING java: not available
  - ADVICE:
    - spawn: java failed with exit code 1 and signal 0. The operation couldn’t be completed. Unable to locate a Java Runtime.
      Please visit <http://www.java.com> for information on installing Java.

- ✅ OK npm: `11.6.2`
- ✅ OK luarocks: `/opt/homebrew/bin/luarocks 3.12.2`
- ✅ OK RubyGem: `3.0.3.1`
- ✅ OK python: `Python 3.14.2`
- ✅ OK pip: `pip 25.3 from /opt/homebrew/lib/python3.14/site-packages/pip (python 3.14)`
- ✅ OK python venv: `Ok`

==============================================================================
mason-lspconfig: ✅

mason-lspconfig.nvim ~

- ✅ OK Neovim v0.11
- ✅ OK mason.nvim v2

==============================================================================
mkdp: ✅

- Platform: macos-arm64
- Nvim Version: NVIM v0.11.5
  Build type: Release
  LuaJIT 2.1.1765228720
  Run "nvim -V1 -v" for more info
- Pre build: /Users/tuliopinheirocunha/.local/share/nvim/lazy/markdown-preview.nvim/app/bin/markdown-preview-macos-arm64
- Pre build version: 0.0.10
- ✅ OK Using pre build

==============================================================================
noice: ✅

noice.nvim ~

- ✅ OK _Neovim_ >= 0.9.0
- ✅ OK You're using a GUI that should work ok
- ✅ OK _vim.go.lazyredraw_ is not enabled
- ✅ OK `snacks.nvim` is installed
- ✅ OK {TreeSitter} `vim` parser is installed
- ✅ OK {TreeSitter} `regex` parser is installed
- ✅ OK {TreeSitter} `lua` parser is installed
- ✅ OK {TreeSitter} `bash` parser is installed
- ✅ OK {TreeSitter} `markdown` parser is installed
- ✅ OK {TreeSitter} `markdown_inline` parser is installed
- ✅ OK `vim.notify` is set to **Noice**
- ✅ OK `vim.lsp.buf.hover` is set to **Noice**
- ✅ OK `vim.lsp.buf.signature_help` is set to **Noice**
- ✅ OK `vim.lsp.util.convert_input_to_markdown_lines` is set to **Noice**
- ✅ OK `vim.lsp.util.stylize_markdown` is set to **Noice**

==============================================================================
nvim-treesitter: ✅

Requirements ~

- ✅ OK Neovim was compiled with tree-sitter runtime ABI version 15 (required >=13).
- ✅ OK tree-sitter-cli 0.26.3 (/Users/tuliopinheirocunha/.local/share/nvim/mason/bin/tree-sitter)
- ✅ OK tar 3.5.3 (/usr/bin/tar)
- ✅ OK curl 8.7.1 (/usr/bin/curl)
  curl 8.7.1 (x86_64-apple-darwin25.0) libcurl/8.7.1 (SecureTransport) LibreSSL/3.3.6 zlib/1.2.12 nghttp2/1.68.0
  Release-Date: 2024-03-27
  Protocols: dict file ftp ftps gopher gophers http https imap imaps ipfs ipns ldap ldaps mqtt pop3 pop3s rtsp smb smbs smtp smtps telnet tftp
  Features: alt-svc AsynchDNS GSS-API HSTS HTTP2 HTTPS-proxy IPv6 Kerberos Largefile libz MultiSSL NTLM SPNEGO SSL threadsafe UnixSockets

OS Info ~

- version: Darwin Kernel Version 25.3.0: Fri Dec 5 23:10:12 PST 2025; root:xnu-12377.80.260.0.1~42/RELEASE_ARM64_T6020
- machine: arm64
- sysname: Darwin
- release: 25.3.0

Install directory for parsers and queries ~

- /Users/tuliopinheirocunha/.local/share/nvim/site/
- ✅ OK is writable.
- ✅ OK is in runtimepath.

Installed languages H L F I J ~

- astro ✓ ✓ ✓ ✓ ✓
- bash ✓ ✓ ✓ ✓ ✓
- c ✓ ✓ ✓ ✓ ✓
- cmake ✓ . ✓ ✓ ✓
- css ✓ . ✓ ✓ ✓
- diff ✓ . ✓ . ✓
- dockerfile ✓ . . . ✓
- dtd ✓ ✓ ✓ . ✓
- ecma
- fish ✓ ✓ ✓ ✓ ✓
- git_config ✓ . ✓ . ✓
- git_rebase ✓ . . . ✓
- gitattributes ✓ ✓ . . ✓
- gitcommit ✓ . . . ✓
- gitignore ✓ . . . ✓
- go ✓ ✓ ✓ ✓ ✓
- gomod ✓ . . . ✓
- gosum ✓ . . . .
- gowork ✓ . . . ✓
- graphql ✓ . . ✓ ✓
- html ✓ ✓ ✓ ✓ ✓
- html_tags
- http ✓ . ✓ . ✓
- javascript ✓ ✓ ✓ ✓ ✓
- jsdoc ✓ . . . .
- json ✓ ✓ ✓ ✓ ✓
- json5 ✓ . . . ✓
- jsx
- kulala_http ✓ . . . ✓
- lua ✓ ✓ ✓ ✓ ✓
- luadoc ✓ . . . .
- luap ✓ . . . .
- markdown ✓ . ✓ ✓ ✓
- markdown_inline ✓ . . . ✓
- ninja ✓ . ✓ ✓ ✓
- printf ✓ . . . .
- python ✓ ✓ ✓ ✓ ✓
- query ✓ ✓ ✓ ✓ ✓
- regex ✓ . . . .
- ron ✓ ✓ ✓ ✓ ✓
- rst ✓ ✓ . . ✓
- rust ✓ ✓ ✓ ✓ ✓
- sql ✓ . ✓ ✓ ✓
- svelte ✓ ✓ ✓ ✓ ✓
- swift ✓ ✓ ✓ ✓ ✓
- toml ✓ ✓ ✓ ✓ ✓
- tsx ✓ ✓ ✓ ✓ ✓
- typescript ✓ ✓ ✓ ✓ ✓
- typst ✓ . ✓ ✓ ✓
- vim ✓ ✓ ✓ . ✓
- vimdoc ✓ . . . ✓
- vue ✓ . ✓ ✓ ✓
- xml ✓ ✓ ✓ ✓ ✓
- yaml ✓ ✓ ✓ ✓ ✓
- zig ✓ ✓ ✓ ✓ ✓

  Legend: H[ighlights], L[ocals], F[olds], I[ndents], In[J]ections ~

==============================================================================
overseer: 14 ⚠️

overseer.nvim report ~

- Log file: /Users/tuliopinheirocunha/.local/state/nvim/overseer.log
- Log level: WARN
- ⚠️ WARNING {cargo}: No Cargo.toml file found
- ⚠️ WARNING {cargo-make}: Command "cargo-make" not found
- ⚠️ WARNING {composer}: executable composer not found
- ⚠️ WARNING {deno}: No deno.{json,jsonc} file found
- ⚠️ WARNING {just}: Command "just" not found
- ⚠️ WARNING {mage}: Command "mage" not found
- ⚠️ WARNING {make}: No Makefile found
- ⚠️ WARNING {mise}: Command "mise" not found
- ⚠️ WARNING {mix}: No mix.exs file found
- ⚠️ WARNING {npm}: No package.json file found
- ⚠️ WARNING {rake}: No Rakefile found
- ⚠️ WARNING {task}: Command "task" not found
- ⚠️ WARNING {tox}: No tox.ini file found
- ⚠️ WARNING {vscode}: No .vscode/tasks.json file found

==============================================================================
render-markdown: 3 ⚠️

render-markdown.nvim [versions] ~

- ✅ OK neovim >= 0.11
- ✅ OK tree-sitter ABI: 15
- ✅ OK plugin: 8.11.0

render-markdown.nvim [configuration] ~

- ✅ OK valid

render-markdown.nvim [tree-sitter markdown] ~

- ✅ OK parser: installed
- ✅ OK ABI: 15
- ✅ OK highlights: ~/.local/share/nvim/site/queries/markdown/highlights.scm
- ✅ OK highlighter: enabled

render-markdown.nvim [tree-sitter markdown_inline] ~

- ✅ OK parser: installed
- ✅ OK ABI: 15
- ✅ OK highlights: ~/.local/share/nvim/site/queries/markdown_inline/highlights.scm

render-markdown.nvim [tree-sitter html] ~

- ✅ OK parser: installed
- ✅ OK ABI: 14

render-markdown.nvim [tree-sitter latex] ~

- ⚠️ WARNING parser: not installed
  - ADVICE:
    - disable latex support to avoid this warning
    - require('render-markdown').setup({ latex = { enabled = false } })
- ⚠️ WARNING ABI: unknown
  - ADVICE:
    - disable latex support to avoid this warning
    - require('render-markdown').setup({ latex = { enabled = false } })

render-markdown.nvim [tree-sitter yaml] ~

- ✅ OK parser: installed
- ✅ OK ABI: 14

render-markdown.nvim [icons] ~

- ✅ OK using: nvim-web-devicons

render-markdown.nvim [latex] ~

- ⚠️ WARNING none installed: { "utftex", "latex2text" }
  - ADVICE:
    - disable latex support to avoid this warning
    - require('render-markdown').setup({ latex = { enabled = false } })

render-markdown.nvim [conflicts] ~

- ✅ OK headlines: not installed
- ✅ OK markview: not installed
- ✅ OK obsidian: not installed

==============================================================================
rustaceanvim: ✅

Checking for Lua dependencies ~

- ✅ OK [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap) installed.

Checking external dependencies ~

- ✅ OK rust-analyzer: found rust-analyzer 1.92.0 (ded5c06c 2025-12-08)
- ✅ OK Cargo: found cargo 1.92.0 (Homebrew)
- ✅ OK rustc: found rustc 1.92.0 (ded5c06cf 2025-12-08) (Homebrew)
- ✅ OK debug adapter: found

Checking config ~

- ✅ OK No errors found in config.

Checking for conflicting plugins ~

- ✅ OK No conflicting plugins detected.

Checking for tree-sitter parser ~

- ✅ OK tree-sitter parser for Rust detected.

==============================================================================
snacks: 8 ⚠️ 3 ❌

Snacks ~

- ✅ OK setup called

Snacks.bigfile ~

- ✅ OK setup {enabled}

Snacks.dashboard ~

- ✅ OK setup {enabled}
- ✅ OK setup ran
- ✅ OK dashboard opened

Snacks.explorer ~

- ✅ OK setup {enabled}
- ✅ OK 'trash' `# Un-recognized argument --version at index 1`
- ✅ OK 'gio' `2.86.3`
- ✅ OK System trash command found

Snacks.image ~

- ⚠️ WARNING setup {disabled}
- ✅ OK 'ghostty' `Ghostty 1.3.0-main+891f44204`
- ✅ OK 'magick' `Version: ImageMagick 7.1.2-12 Q16-HDRI aarch64 23490 https://imagemagick.org`
- ✅ OK 'convert' `WARNING: The convert command is deprecated in IMv7, use "magick" instead of "convert" or "magick convert"`
- ✅ OK `ghostty` detected and supported
- ✅ OK `ghostty` supports unicode placeholders
- ✅ OK Inline images are available
- ✅ OK Terminal Dimensions:
  - {size}: `2386` x `1288` pixels
  - {scale}: `1.88`
  - {cell}: `15` x `33` pixels
- ✅ OK Available Treesitter languages:
  `css`, `html`, `javascript`, `markdown_inline`, `markdown`, `svelte`, `tsx`, `typst`, `vue`
- ⚠️ WARNING Missing Treesitter languages:
  `latex`, `norg`, `scss`
- ⚠️ WARNING Image rendering in docs with missing treesitter parsers won't work
- ❌ ERROR Tool not found: 'gs'
- ⚠️ WARNING `gs` is required to render PDF files
- ❌ ERROR None of the tools found: 'tectonic', 'pdflatex'
- ⚠️ WARNING `tectonic` or `pdflatex` is required to render LaTeX math expressions
- ❌ ERROR Tool not found: 'mmdc'
- ⚠️ WARNING `mmdc` is required to render Mermaid diagrams
- ✅ OK your terminal supports the kitty graphics protocol

Snacks.input ~

- ✅ OK setup {enabled}
- ✅ OK `vim.ui.input` is set to `Snacks.input`

Snacks.lazygit ~

- ✅ OK {lazygit} installed

Snacks.notifier ~

- ✅ OK setup {enabled}
- ✅ OK is ready

Snacks.picker ~

- ✅ OK setup {enabled}
- ✅ OK `vim.ui.select` is set to `Snacks.picker.select`
- ✅ OK Available Treesitter languages:
  `regex`
- ✅ OK 'git' `git version 2.50.1 (Apple Git-155)`
- ✅ OK 'rg' `ripgrep 15.1.0`
- ✅ OK `Snacks.picker.grep()` is available
- ✅ OK 'fd' `fd 10.3.0`
- ✅ OK `Snacks.picker.files()` is available
- ✅ OK `Snacks.picker.explorer()` is available
- ✅ OK `SQLite3` is available

Snacks.quickfile ~

- ✅ OK setup {enabled}

Snacks.scope ~

- ✅ OK setup {enabled}

Snacks.scroll ~

- ✅ OK setup {enabled}

Snacks.statuscolumn ~

- ⚠️ WARNING setup {disabled}

Snacks.terminal ~

- ✅ OK shell configured
  - `vim.o.shell`: /opt/homebrew/bin/fish
  - `parsed`: { "/opt/homebrew/bin/fish" }

Snacks.toggle ~

- ✅ OK {which-key} is installed

Snacks.words ~

- ⚠️ WARNING setup {disabled}

==============================================================================
venv-selector: ✅

venv-selector ~

- ✅ OK Settings are correct

==============================================================================
vim.deprecated: ✅

- ✅ OK No deprecated functions detected

==============================================================================
vim.health: ✅

Configuration ~

- ✅ OK no issues found

Runtime ~

- ✅ OK $VIMRUNTIME: /opt/homebrew/Cellar/neovim/0.11.5_1/share/nvim/runtime

Performance ~

- ✅ OK Build type: Release

Remote Plugins ~

- ✅ OK Up to date

terminal ~

- key_backspace (kbs) terminfo entry: `key_backspace=\177`
- key_dc (kdch1) terminfo entry: `key_dc=\E[3~`
- $TERM_PROGRAM="ghostty"
- $COLORTERM="truecolor"

External Tools ~

- ✅ OK ripgrep 15.1.0 (/opt/homebrew/bin/rg)

==============================================================================
vim.lsp: ✅

- LSP log level : WARN
- Log path: /Users/tuliopinheirocunha/.local/state/nvim/lsp.log
- Log size: 153 KB

vim.lsp: Active Clients ~

- No active clients

vim.lsp: Enabled Configurations ~

vim.lsp: File Watcher ~

- file watching "(workspace/didChangeWatchedFiles)" disabled on all clients

vim.lsp: Position Encodings ~

- No active clients

==============================================================================
vim.provider: 6 ⚠️

Clipboard (optional) ~

- ✅ OK Clipboard tool found: pbcopy

Node.js provider (optional) ~

- Node.js: v25.2.1

- ⚠️ WARNING Missing "neovim" npm (or yarn, pnpm) package.
  - ADVICE:
    - Run in shell: npm install -g neovim
    - Run in shell (if you use yarn): yarn global add neovim
    - Run in shell (if you use pnpm): pnpm install -g neovim
    - You may disable this provider (and warning) by adding `let g:loaded_node_provider = 0` to your init.vim

Perl provider (optional) ~

- ⚠️ WARNING "Neovim::Ext" cpan module is not installed
  - ADVICE:
    - See :help |provider-perl| for more information.
    - You can disable this provider (and warning) by adding `let g:loaded_perl_provider = 0` to your init.vim
- ⚠️ WARNING No usable perl executable found

Python 3 provider (optional) ~

- ⚠️ WARNING No Python executable found that can `import neovim`. Using the first available executable for diagnostics.
- ⚠️ WARNING Could not load Python :
  /opt/homebrew/bin/python3 does not have the "neovim" module.
  /opt/homebrew/bin/python3.13 does not have the "neovim" module.
  /opt/homebrew/bin/python3.12 does not have the "neovim" module.
  python3.11 not found in search path or not executable.
  python3.10 not found in search path or not executable.
  python3.9 not found in search path or not executable.
  python not found in search path or not executable.
  - ADVICE:
    - See :help |provider-python| for more information.
    - You can disable this provider (and warning) by adding `let g:loaded_python3_provider = 0` to your init.vim
- Executable: Not found

Python virtualenv ~

- ✅ OK no $VIRTUAL_ENV

Ruby provider (optional) ~

- Ruby: ruby 2.6.10p210 (2022-04-12 revision 67958) [universal.arm64e-darwin25]
- ⚠️ WARNING `neovim-ruby-host` not found.
  - ADVICE:
    - Run `gem install neovim` to ensure the neovim RubyGem is installed.
    - Run `gem environment` to ensure the gem bin directory is in $PATH.
    - If you are using rvm/rbenv/chruby, try "rehashing".
    - See :help |g:ruby_host_prog| for non-standard gem installations.
    - You can disable this provider (and warning) by adding `let g:loaded_ruby_provider = 0` to your init.vim

==============================================================================
vim.treesitter: ✅

Treesitter features ~

- Treesitter ABI support: min 13, max 15
- WASM parser support: false

Treesitter parsers ~

- ✅ OK Parser: astro ABI: 14, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/astro.so
- ✅ OK Parser: bash ABI: 15, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/bash.so
- ✅ OK Parser: c ABI: 15, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/c.so
- ✅ OK Parser: c (not loaded), path: /opt/homebrew/Cellar/neovim/0.11.5_1/lib/nvim/parser/c.so
- ✅ OK Parser: cmake ABI: 14, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/cmake.so
- ✅ OK Parser: css ABI: 15, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/css.so
- ✅ OK Parser: diff ABI: 15, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/diff.so
- ✅ OK Parser: dockerfile ABI: 14, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/dockerfile.so
- ✅ OK Parser: dtd ABI: 14, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/dtd.so
- ✅ OK Parser: fish ABI: 14, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/fish.so
- ✅ OK Parser: git_config ABI: 14, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/git_config.so
- ✅ OK Parser: git_rebase ABI: 14, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/git_rebase.so
- ✅ OK Parser: gitattributes ABI: 14, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/gitattributes.so
- ✅ OK Parser: gitcommit ABI: 14, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/gitcommit.so
- ✅ OK Parser: gitignore ABI: 13, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/gitignore.so
- ✅ OK Parser: go ABI: 15, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/go.so
- ✅ OK Parser: gomod ABI: 15, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/gomod.so
- ✅ OK Parser: gosum ABI: 14, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/gosum.so
- ✅ OK Parser: gowork ABI: 13, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/gowork.so
- ✅ OK Parser: graphql ABI: 13, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/graphql.so
- ✅ OK Parser: html ABI: 14, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/html.so
- ✅ OK Parser: http ABI: 14, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/http.so
- ✅ OK Parser: javascript ABI: 15, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/javascript.so
- ✅ OK Parser: jsdoc ABI: 15, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/jsdoc.so
- ✅ OK Parser: json ABI: 14, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/json.so
- ✅ OK Parser: json5 ABI: 15, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/json5.so
- ✅ OK Parser: kulala_http ABI: 15, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/kulala_http.so
- ✅ OK Parser: lua ABI: 15, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/lua.so
- ✅ OK Parser: lua (not loaded), path: /opt/homebrew/Cellar/neovim/0.11.5_1/lib/nvim/parser/lua.so
- ✅ OK Parser: luadoc ABI: 14, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/luadoc.so
- ✅ OK Parser: luap ABI: 14, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/luap.so
- ✅ OK Parser: markdown ABI: 15, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/markdown.so
- ✅ OK Parser: markdown (not loaded), path: /opt/homebrew/Cellar/neovim/0.11.5_1/lib/nvim/parser/markdown.so
- ✅ OK Parser: markdown_inline ABI: 15, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/markdown_inline.so
- ✅ OK Parser: markdown_inline (not loaded), path: /opt/homebrew/Cellar/neovim/0.11.5_1/lib/nvim/parser/markdown_inline.so
- ✅ OK Parser: ninja ABI: 13, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/ninja.so
- ✅ OK Parser: printf ABI: 14, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/printf.so
- ✅ OK Parser: python ABI: 15, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/python.so
- ✅ OK Parser: query ABI: 15, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/query.so
- ✅ OK Parser: query (not loaded), path: /opt/homebrew/Cellar/neovim/0.11.5_1/lib/nvim/parser/query.so
- ✅ OK Parser: regex ABI: 15, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/regex.so
- ✅ OK Parser: ron ABI: 14, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/ron.so
- ✅ OK Parser: rst ABI: 14, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/rst.so
- ✅ OK Parser: rust ABI: 15, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/rust.so
- ✅ OK Parser: sql ABI: 14, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/sql.so
- ✅ OK Parser: svelte ABI: 14, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/svelte.so
- ✅ OK Parser: swift ABI: 15, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/swift.so
- ✅ OK Parser: toml ABI: 14, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/toml.so
- ✅ OK Parser: tsx ABI: 14, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/tsx.so
- ✅ OK Parser: typescript ABI: 14, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/typescript.so
- ✅ OK Parser: typst ABI: 14, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/typst.so
- ✅ OK Parser: vim ABI: 15, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/vim.so
- ✅ OK Parser: vim (not loaded), path: /opt/homebrew/Cellar/neovim/0.11.5_1/lib/nvim/parser/vim.so
- ✅ OK Parser: vimdoc ABI: 15, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/vimdoc.so
- ✅ OK Parser: vimdoc (not loaded), path: /opt/homebrew/Cellar/neovim/0.11.5_1/lib/nvim/parser/vimdoc.so
- ✅ OK Parser: vue ABI: 14, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/vue.so
- ✅ OK Parser: xml ABI: 14, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/xml.so
- ✅ OK Parser: yaml ABI: 14, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/yaml.so
- ✅ OK Parser: zig ABI: 15, path: /Users/tuliopinheirocunha/.local/share/nvim/site/parser/zig.so

==============================================================================
which-key: 15 ⚠️

- ✅ OK Most of these checks are for informational purposes only.
  WARNINGS should be treated as a warning, and don't necessarily indicate a problem with your config.
  Please |DON'T| report these warnings as an issue.

Checking your config ~

- ⚠️ WARNING |mini.icons| is not installed
- ✅ OK |nvim-web-devicons| is installed

Checking for issues with your mappings ~

- ✅ OK No issues reported

checking for overlapping keymaps ~

- ⚠️ WARNING In mode `n`, <g> overlaps with <gO>, <grt>, <grr>, <gri>, <gra>, <grn>, <g<C-X>>, <gsd>, <gsdn>, <gsdl>, <gsF>, <gsFn>, <gsFl>, <gsr>, <gsrn>, <gsrl>, <gsf>, <gsfn>, <gsfl>, <gsa>, <gsh>, <gshn>, <gshl>, <g[>, <g]>, <g<C-A>>, <gh>, <g%>, <gH>, <gc>, <gcO>, <gcc>, <gco>, <gp>, <gx>, <gP>:
  - <g>: goto
  - <gO>: vim.lsp.buf.document_symbol()
  - <grt>: vim.lsp.buf.type_definition()
  - <grr>: vim.lsp.buf.references()
  - <gri>: vim.lsp.buf.implementation()
  - <gra>: vim.lsp.buf.code_action()
  - <grn>: vim.lsp.buf.rename()
  - <g<C-X>>: Decrement
  - <gsd>: Delete surrounding
  - <gsdn>: Delete next surrounding
  - <gsdl>: Delete previous surrounding
  - <gsF>: Find left surrounding
  - <gsFn>: Find next left surrounding
  - <gsFl>: Find previous left surrounding
  - <gsr>: Replace surrounding
  - <gsrn>: Replace next surrounding
  - <gsrl>: Replace previous surrounding
  - <gsf>: Find right surrounding
  - <gsfn>: Find next right surrounding
  - <gsfl>: Find previous right surrounding
  - <gsa>: Add surrounding
  - <gsh>: Highlight surrounding
  - <gshn>: Highlight next surrounding
  - <gshl>: Highlight previous surrounding
  - <g[>: Move to left "around"
  - <g]>: Move to right "around"
  - <g<C-A>>: Increment
  - <gh>: Apply hunks
  - <g%>: Cycle backwards through results
  - <gH>: Reset hunks
  - <gc>: Comment
  - <gcO>: Add Comment Above
  - <gcc>: Comment line
  - <gco>: Add Comment Below
  - <gp>: Put Text After Selection
  - <gx>: Open with system app
  - <gP>: Put Text Before Selection
- ⚠️ WARNING In mode `x`, <i> overlaps with <il>, <ii>, <in>:
  - <i>: inside
  - <il>: last
  - <ii>: indent
  - <in>: next
- ⚠️ WARNING In mode `x`, <a> overlaps with <al>, <ai>, <an>, <a%>:
  - <a>: around
  - <al>: last
  - <ai>: indent
  - <an>: next
- ⚠️ WARNING In mode `o`, <i> overlaps with <il>, <ii>, <in>:
  - <i>: inside
  - <il>: last
  - <ii>: indent
  - <in>: next
- ⚠️ WARNING In mode `o`, <a> overlaps with <al>, <ai>, <an>:
  - <a>: around
  - <al>: last
  - <ai>: indent
  - <an>: next
- ⚠️ WARNING In mode `n`, <gc> overlaps with <gcO>, <gcc>, <gco>:
  - <gc>: Comment
  - <gcO>: Add Comment Above
  - <gcc>: Comment line
  - <gco>: Add Comment Below
- ⚠️ WARNING In mode `n`, <gsh> overlaps with <gshn>, <gshl>:
  - <gsh>: Highlight surrounding
  - <gshn>: Highlight next surrounding
  - <gshl>: Highlight previous surrounding
- ⚠️ WARNING In mode `n`, <gsf> overlaps with <gsfn>, <gsfl>:
  - <gsf>: Find right surrounding
  - <gsfn>: Find next right surrounding
  - <gsfl>: Find previous right surrounding
- ⚠️ WARNING In mode `n`, <gsr> overlaps with <gsrn>, <gsrl>:
  - <gsr>: Replace surrounding
  - <gsrn>: Replace next surrounding
  - <gsrl>: Replace previous surrounding
- ⚠️ WARNING In mode `n`, <gsF> overlaps with <gsFn>, <gsFl>:
  - <gsF>: Find left surrounding
  - <gsFn>: Find next left surrounding
  - <gsFl>: Find previous left surrounding
- ⚠️ WARNING In mode `n`, <gsd> overlaps with <gsdn>, <gsdl>:
  - <gsd>: Delete surrounding
  - <gsdn>: Delete next surrounding
  - <gsdl>: Delete previous surrounding
- ✅ OK Overlapping keymaps are only reported for informational purposes.
  This doesn't necessarily mean there is a problem with your config.

Checking for duplicate mappings ~

- ⚠️ WARNING Duplicates for <<leader>f> in mode `n`:
  - file/find: `{ group = true }`
  - file/find: `{ group = true, icon = " " }`
- ⚠️ WARNING Duplicates for <<leader>s> in mode `n`:
  - search: `{ group = true }`
  - search: `{ group = true, icon = " " }`
- ⚠️ WARNING Duplicates for <<leader>x> in mode `n`:
  - diagnostics/quickfix: `{ group = true }`
  - trouble: `{ group = true, icon = " " }`
- ✅ OK Duplicate mappings are only reported for informational purposes.
  This doesn't necessarily mean there is a problem with your config.
