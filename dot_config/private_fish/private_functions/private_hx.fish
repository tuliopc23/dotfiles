function hx --description 'Helix editor - opens current directory when no arguments (use Space+f for file picker)'
    if test (count $argv) -eq 0
        # Open helix with current directory as working directory
        # User can press Space+f to open file picker immediately
        command hx .
    else
        # Pass through arguments normally
        command hx $argv
    end
end
