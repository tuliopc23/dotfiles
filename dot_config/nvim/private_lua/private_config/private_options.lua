-- Shell Configuration
vim.opt.shell = "/opt/homebrew/bin/fish"

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.laststatus = 3
vim.opt.splitkeep = "screen"

-- --- Theme Configuration ---
-- Context-aware transparency: transparent in terminal, opaque in GUI clients
if vim.g.neovide or vim.g.gui_vimr or vim.g.goneovim then
  vim.g.xcode_doom_transparent = false
else
  vim.g.xcode_doom_transparent = true
end

-- --- GUI Font (The "Xcode" Look) ---
-- This only affects Neovim GUIs like Neovide.
-- For terminal Neovim, please set "SF Mono Medium" in your terminal emulator (Alacritty/Kitty/iTerm).
vim.opt.guifont = "SF Mono Nerd Font Medium:h12" -- Medium weight, size 12
vim.opt.linespace = 2                   -- Add vertical breathing room (Xcode style)

-- --- Neovide Specific (macOS Tahoe/Liquid Glass) ---
if vim.g.neovide then
  vim.g.neovide_window_opacity = 0.95
  vim.g.neovide_window_blurred = true
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_theme = "dark"
  vim.g.neovide_refresh_rate = 120
  vim.g.neovide_confirm_quit = true
  vim.g.neovide_input_macos_option_key_is_meta = "both"
end
