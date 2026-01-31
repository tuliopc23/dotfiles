-- DuckDB plugin configuration
require("duckdb"):setup()

-- Smart Enter plugin configuration
require("smart-enter"):setup({
	open_multi = true,
})

-- Full Border plugin configuration
require("full-border"):setup({
	type = ui.Border.ROUNDED,
})

-- Toggle Pane plugin configuration
if os.getenv("NVIM") then
	require("toggle-pane"):entry("min-preview")
end

-- Git plugin configuration
th = th or {}
th.git = th.git or {}
th.git.modified = ui.Style():fg("blue")
th.git.deleted = ui.Style():fg("red"):bold()
th.git.modified_sign = "M"
th.git.deleted_sign = "D"

require("git"):setup()

-- MacTag plugin configuration
require("mactag"):setup({
	keys = {
		r = "Red",
		o = "Orange",
		y = "Yellow",
		g = "Green",
		b = "Blue",
		p = "Purple",
	},
	colors = {
		Red = "#ee7b70",
		Orange = "#f5bd5c",
		Yellow = "#fbe764",
		Green = "#91fc87",
		Blue = "#5fa3f8",
		Purple = "#cb88f8",
	},
})

-- Mime Ext plugin configuration
require("mime-ext.local"):setup({
	with_files = {
		makefile = "text/makefile",
	},
	with_exts = {
		mk = "text/makefile",
	},
	fallback_file1 = false,
})

require("sshfs"):setup()

-- ~/.config/yazi/init.lua for Linux and macOS
-- %AppData%\yazi\config\init.lua for Windows

-- Using the default configuration
require("augment-command"):setup({
	prompt = false,
	default_item_group_for_prompt = "hovered",
	smart_enter = true,
	smart_paste = false,
	smart_tab_create = false,
	smart_tab_switch = false,
	confirm_on_quit = true,
	open_file_after_creation = false,
	enter_directory_after_creation = false,
	use_default_create_behaviour = false,
	enter_archives = true,
	extract_retries = 3,
	recursively_extract_archives = true,
	preserve_file_permissions = false,
	encrypt_archives = false,
	encrypt_archive_headers = false,
	reveal_created_archive = true,
	remove_archived_files = false,
	must_have_hovered_item = true,
	skip_single_subdirectory_on_enter = true,
	skip_single_subdirectory_on_leave = true,
	smooth_scrolling = false,
	scroll_delay = 0.02,
	create_item_delay = 0.25,
	wraparound_file_navigation = true,
})

