# Yazi Configuration - Xcode Theme

This configuration provides an Xcode-inspired dark theme for Yazi file manager with enhanced features and integrations.

## Theme Colors

The theme uses Xcode's signature color palette:

- **Primary Blue** (`#42BFFA`) - Directories, links, mode indicators
- **Green** (`#6BD089`) - Selected files, success indicators
- **Purple** (`#D782F0`) - Executables, special modes
- **Red/Pink** (`#FC6A5D`) - Warnings, cut operations
- **Yellow** (`#FDD835`) - Archives, warnings
- **Cyan** (`#87CEEB`) - Special files
- **Dark Background** (`#1E1E1E`) - Matches Xcode's editor background
- **Gray Borders** (`#3C3C3C`) - Subtle UI elements

## Features Configured

### Visual Enhancements
- File type-based color coding
- Icon support for common file types and directories
- Swift/Objective-C file type highlighting
- Enhanced preview pane (ratio: 1:3:4)
- File size display in linemode

### Integrations
- **Neovim** - Default text editor (blocking mode)
- **macOS Finder** - Quick reveal integration (`open -R`)
- **MPV** - Media file playback
- **Archive extraction** - Built-in support for common formats

### File Previews
- Code syntax highlighting
- JSON formatting
- Image preview support
- PDF preview
- Video thumbnails
- Directory tree preview

## Key Bindings

Default Yazi keybindings are used. Notable ones:

- `j/k` - Navigate up/down
- `h/l` - Go to parent/enter directory
- `space` - Select file
- `y` - Copy
- `x` - Cut
- `p` - Paste
- `d` - Delete
- `r` - Rename
- `f` - Filter
- `/` - Search
- `z` - Toggle hidden files
- `t` - Create tab
- `q` - Quit

## Shell Integration

Your Fish shell already has the Yazi wrapper configured at lines 315-316 of `~/.config/fish/config.fish`. 

This wrapper ensures you stay in the directory you navigate to when exiting Yazi.

## Dependencies (Optional)

For enhanced functionality, install these optional dependencies:

```fish
# Image preview
brew install ffmpegthumbnailer ueberzug

# Media info
brew install ffmpeg mediainfo

# Archive support
brew install p7zip jq

# File search
brew install fd ripgrep fzf

# PDF preview
brew install poppler

# Advanced image formats
brew install imagemagick

# Fonts (for icons)
brew install --cask font-symbols-only-nerd-font
```

## Usage

Simply run `yazi` in your terminal. The configuration will be automatically loaded.

## Customization

### Changing Colors

Edit `~/.config/yazi/theme.toml` and modify the hex color values. Key colors to customize:

- `#42BFFA` - Primary accent (blue)
- `#6BD089` - Success/selection (green)
- `#FC6A5D` - Danger/warning (red)
- `#D782F0` - Secondary accent (purple)

### Adjusting Layout

Edit `~/.config/yazi/yazi.toml`:

```toml
[mgr]
ratio = [ 1, 3, 4 ]  # Adjust panel width ratios
```

### Adding File Type Rules

Add custom file type colors in `theme.toml`:

```toml
[filetype]
rules = [
    { name = "*.custom", fg = "#FF00FF" },
    # ... more rules
]
```

## Documentation

- [Official Yazi Docs](https://yazi-rs.github.io/docs/configuration/overview)
- [Theme Configuration](https://yazi-rs.github.io/docs/configuration/theme)
- [Flavors (Advanced Theming)](https://yazi-rs.github.io/docs/flavors/overview)

## Troubleshooting

### Colors not showing correctly

Ensure your terminal supports 24-bit true color:
```fish
echo $COLORTERM  # Should output "truecolor"
```

### Icons not displaying

Install a Nerd Font and configure your terminal to use it:
```fish
brew install --cask font-hack-nerd-font
```

### Preview not working

Check if required preview tools are installed:
```fish
which ffmpegthumbnailer  # For images
which pdftoppm          # For PDFs
which mediainfo         # For videos
```

## Credits

- Xcode color palette by Apple Inc.
- Yazi file manager by [@sxyazi](https://github.com/sxyazi)
