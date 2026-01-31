-- ┌─────────────────────────┐
-- │ Plugins outside of MINI │
-- └─────────────────────────┘
--
-- This file contains installation and configuration of plugins outside of MINI.
-- They significantly improve user experience in a way not yet possible with MINI.
-- These are mostly plugins that provide programming language specific behavior.
--
-- Use this file to install and configure other such plugins.

-- Make concise helpers for installing/adding plugins in two stages
local add, later = MiniDeps.add, MiniDeps.later
local now_if_args = _G.Config.now_if_args

-- UI & Visuals ===============================================================

-- Smear Cursor: Smooth cursor animation
later(function()
	add("sphamba/smear-cursor.nvim")
	require("smear_cursor").setup({
		cursor_color = "#ff5257",
		smear_between_buffers = true,
		smear_between_neighbor_lines = true,
		scroll_buffer_space = true,
		smear_insert_mode = true,
		stiffness = 0.7,
		trailing_stiffness = 0.5,
	})
end)

-- Render Markdown: Better visualization for Markdown
later(function()
	add("MeanderingProgrammer/render-markdown.nvim")
	require("render-markdown").setup({
		file_types = { "markdown", "Avante" },
		code = {
			sign = false,
			width = "block",
			right_pad = 1,
		},
		heading = {
			sign = false,
			icons = {},
		},
	})
end)

-- Editor Enhancements ========================================================

-- Neovim Tips: Daily tips for Neovim
later(function()
	add({
		source = "saxon1964/neovim-tips",
		depends = { "MunifTanjim/nui.nvim" },
	})
	require("neovim_tips").setup()
end)

-- Inc-Rename: Visual incremental renaming
later(function()
	add("smjonas/inc-rename.nvim")
	require("inc_rename").setup()
	vim.keymap.set("n", "<leader>rn", function()
		return ":IncRename " .. vim.fn.expand("<cword>")
	end, { expr = true, desc = "Rename (Inc)" })
end)

-- Dial: Enhanced increment/decrement
later(function()
    add("monaqa/dial.nvim")
    local dial = require("dial.map")
    local augend = require("dial.augend")

    require("dial.config").augends:register_group({
        default = {
            augend.integer.alias.decimal,
            augend.integer.alias.hex,
            augend.date.alias["%Y/%m/%d"],
            augend.constant.alias.bool,
            augend.hexcolor.new({ case = "lower" }),
        },
    })

    vim.keymap.set("n", "<C-a>", function() return dial.inc_normal() end, { expr = true, desc = "Increment" })
    vim.keymap.set("n", "<C-x>", function() return dial.dec_normal() end, { expr = true, desc = "Decrement" })
    vim.keymap.set("n", "g<C-a>", function() return dial.inc_gnormal() end, { expr = true, desc = "Increment (gnormal)" })
    vim.keymap.set("n", "g<C-x>", function() return dial.dec_gnormal() end, { expr = true, desc = "Decrement (gnormal)" })
    vim.keymap.set("v", "<C-a>", function() return dial.inc_visual() end, { expr = true, desc = "Increment" })
    vim.keymap.set("v", "<C-x>", function() return dial.dec_visual() end, { expr = true, desc = "Decrement" })
    vim.keymap.set("v", "g<C-a>", function() return dial.inc_gvisual() end, { expr = true, desc = "Increment (gvisual)" })
    vim.keymap.set("v", "g<C-x>", function() return dial.dec_gvisual() end, { expr = true, desc = "Decrement (gvisual)" })
end)

-- Tree-sitter ================================================================

-- Tree-sitter is a tool for fast incremental parsing.
now_if_args(function()
	add({
		source = "nvim-treesitter/nvim-treesitter",
		hooks = {
			post_checkout = function()
				vim.cmd("TSUpdate")
			end,
		},
	})
	add({
		source = "nvim-treesitter/nvim-treesitter-textobjects",
		checkout = "main",
	})

	-- Define languages which will have parsers installed and auto enabled
	local languages = {
		"bash",
		"c",
		"cpp",
		"css",
		"go",
		"gomod",
		"gowork",
		"gosum",
		"html",
		"javascript",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"objc",
		"python",
		"query",
		"regex",
		"rust",
		"swift",
		"toml",
		"tsx",
		"typescript",
		"vim",
		"vimdoc",
		"yaml",
		"zig",
		"toml",
		"yaml",
	}

	local isnt_installed = function(lang)
		return #vim.api.nvim_get_runtime_file("parser/" .. lang .. ".*", false) == 0
	end
	local to_install = vim.tbl_filter(isnt_installed, languages)
	if #to_install > 0 then
		require("nvim-treesitter").install(to_install)
	end

	local filetypes = {}
	for _, lang in ipairs(languages) do
		for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
			table.insert(filetypes, ft)
		end
	end
	local ts_start = function(ev)
		vim.treesitter.start(ev.buf)
	end
	_G.Config.new_autocmd("FileType", filetypes, ts_start, "Start tree-sitter")
end)

-- Language Support ===========================================================

-- Mason: Portable package manager for Neovim
now_if_args(function()
	add("mason-org/mason.nvim")
	require("mason").setup()
end)

-- LSP Configuration
now_if_args(function()
	add("neovim/nvim-lspconfig")
	add("williamboman/mason-lspconfig.nvim")
	
	local util = require("lspconfig.util")
	local mason_lspconfig = require("mason-lspconfig")

	mason_lspconfig.setup({
		ensure_installed = { "lua_ls", "ts_ls", "jsonls", "html", "cssls" },
	})

	-- Configure and enable servers using the new vim.lsp.config API
	
	-- Helper to enable servers (since mason-lspconfig v2 might auto-enable, but explicit is safe)
	local function enable(name)
		vim.lsp.enable(name)
	end

	-- TypeScript / JavaScript
	if vim.fn.executable("vtsls") == 1 then
		vim.lsp.config("vtsls", {
			settings = {
				complete_function_calls = true,
				vtsls = {
					enableMoveToFileCodeAction = true,
					autoUseWorkspaceTsdk = true,
				},
			},
		})
		enable("vtsls")
	else
		enable("ts_ls")
	end

	-- JSON
	vim.lsp.config("jsonls", {
		settings = {
			json = { format = { enable = true }, validate = { enable = true } },
		},
	})
	enable("jsonls")

	-- Tailwind CSS
	vim.lsp.config("tailwindcss", {
		root_dir = util.root_pattern(".git"),
	})
	enable("tailwindcss")

	-- Default enabled servers (no custom config needed)
	enable("lua_ls")
	enable("html")
	enable("cssls")

	-- Manual LSP setups (not managed by Mason)

	-- Swift (SourceKit)
	vim.lsp.config("sourcekit", {
		filetypes = { "swift", "objc", "objcpp" },
		capabilities = {
			workspace = {
				didChangeWatchedFiles = { dynamicRegistration = true },
			},
		},
		root_dir = function(filename, _)
			return util.root_pattern("buildServer.json")(filename)
				or util.root_pattern("*.xcodeproj", "*.xcworkspace")(filename)
				or util.root_pattern("Package.swift")(filename)
				or util.find_git_ancestor(filename)
		end,
	})
	enable("sourcekit")

	-- Zig
	enable("zls")
end)

-- Go Lang (go.nvim)
later(function()
	add({
		source = "ray-x/go.nvim",
		depends = {
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
	})
	require("go").setup()
end)

-- Rust (Rustaceanvim)
later(function()
	add({
		source = "mrcjkb/rustaceanvim",
		checkout = "v5.0.0", -- Version 5^
	})
	-- rustaceanvim is configured via vim.g.rustaceanvim, not setup()
	vim.g.rustaceanvim = {
		server = {
			on_attach = function(_, bufnr)
				vim.keymap.set("n", "<leader>cR", function()
					vim.cmd.RustLsp("codeAction")
				end, { desc = "Code Action", buffer = bufnr })
			end,
		},
	}
end)

-- Rust Crates
later(function()
	add({
		source = "saecki/crates.nvim",
		depends = { "nvim-lua/plenary.nvim" },
	})
	require("crates").setup()
end)

-- Xcode Integration
later(function()
	add({
		source = "wojciech-kulik/xcodebuild.nvim",
		depends = {
			"MunifTanjim/nui.nvim",
			"nvim-telescope/telescope.nvim", -- Required for xcodebuild pickers
		},
	})
	-- Minimal Telescope setup for xcodebuild
	require("telescope").setup({
		defaults = {
			-- Match mini aesthetics
			borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		},
	})

	require("xcodebuild").setup({
		show_build_progress_bar = true,
		code_coverage = { enabled = true },
		integrations = {
			xcode_build_server = {
				enabled = true,
			},
		},
	})
	-- Xcode Keymaps
	local map = vim.keymap.set
	map("n", "<leader>Xb", "<cmd>XcodebuildBuild<cr>", { desc = "Build Project" })
	map("n", "<leader>Xr", "<cmd>XcodebuildBuildRun<cr>", { desc = "Build & Run" })
	map("n", "<leader>Xt", "<cmd>XcodebuildTest<cr>", { desc = "Run Tests" })
	map("n", "<leader>Xd", "<cmd>XcodebuildSelectDevice<cr>", { desc = "Select Device" })
	map("n", "<leader>Xp", "<cmd>XcodebuildSelectScheme<cr>", { desc = "Select Scheme" })
end)

-- Formatting =================================================================

later(function()
	add("stevearc/conform.nvim")
	require("conform").setup({
		default_format_opts = {
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "goimports", "gofumpt" },
			rust = { "rustfmt" },
			zig = { "zigfmt" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			json = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			markdown = { "prettier" },
			swift = { "swift_format" },
		},
	})
end)

-- Snippets ===================================================================

later(function()
	add("rafamadriz/friendly-snippets")
end)

-- AI & Intelligence ==========================================================

later(function()
	add({
		source = "olimorris/codecompanion.nvim",
		depends = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	})
	require("codecompanion").setup({
		strategies = {
			chat = { adapter = "anthropic" },
			inline = { adapter = "anthropic" },
			agent = { adapter = "anthropic" },
		},
		adapters = {
			anthropic = function()
				return require("codecompanion.adapters").extend("anthropic", {
					env = {
						api_key = "cmd:echo $ANTHROPIC_API_KEY",
					},
				})
			end,
		},
	})
	-- CodeCompanion Keymaps
	vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { desc = "CodeCompanion Actions" })
	vim.keymap.set({ "n", "v" }, "<leader>a", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "CodeCompanion Chat" })
	vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { desc = "Add to Chat" })
end)

