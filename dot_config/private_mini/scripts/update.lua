-- Update Script for MiniMax with Custom Patching
local uv = vim.loop

local function log(msg)
  print(">> " .. msg)
end

local function exec(cmd)
  log("Running: " .. cmd)
  vim.fn.system(cmd)
end

local config_dir = vim.fn.stdpath('config')
local minimax_dir = config_dir .. '/MiniMax'
local plugin_file = config_dir .. '/plugin/40_plugins.lua'
local mini_file = config_dir .. '/plugin/30_mini.lua'

-- 1. Safety Backup of Plugins
log("Backing up Plugins...")
exec("cp " .. plugin_file .. " " .. plugin_file .. ".bak")

-- 2. Update MiniMax (The Destructive Part)
log("Updating MiniMax repo...")
exec("git -C " .. minimax_dir .. " pull")

log("Resetting config from MiniMax template...")
-- We use NVIM_APPNAME=mini to target the current setup
exec("NVIM_APPNAME=mini nvim --headless -l " .. minimax_dir .. "/setup.lua")

-- 3. Restore Plugins
log("Restoring your custom plugins...")
exec("mv " .. plugin_file .. ".bak " .. plugin_file)

-- 4. Patch '30_mini.lua' (Theme & Dashboard)
log("Patching mini.nvim configuration...")
local mini_lines = vim.fn.readfile(mini_file)
local new_lines = {}

for _, line in ipairs(mini_lines) do
  -- Patch Theme
  if line:match("colorscheme miniwinter") then
    line = line:gsub("miniwinter", "xcode-doom")
    log("  - Patched Theme: xcode-doom")
  end

  -- Patch Dashboard (Replace default setup with our user_dashboard)
  if line:match("require%('mini.starter'%)%.setup%(%)") then
    line = "now(function() require('user_dashboard').setup() end)"
    log("  - Patched Dashboard: user_dashboard")
  end

  table.insert(new_lines, line)
end

vim.fn.writefile(new_lines, mini_file)

log("Update Complete! Your custom plugins, theme, and dashboard are preserved.")
