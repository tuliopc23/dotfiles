# =============================================================================
# Zoxide Configuration - Smart Directory Navigation
# =============================================================================

if status is-interactive
    # Initialize zoxide with Fish shell integration
    # Use --hook none for Warp terminal compatibility
    if command -q zoxide
        if set -q TERM_PROGRAM; and test "$TERM_PROGRAM" = "WarpTerminal"
            zoxide init --hook none fish | source
        else if set -q WARP_TTY
            # Alternative Warp detection method
            zoxide init --hook none fish | source
        else
            _gemini_load_cached_tool zoxide "zoxide init fish" "00_zoxide_init.fish"
        end
    end

    # Enhanced aliases for better workflow
    abbr -a cd 'z'         # Replace cd with zoxide
    abbr -a cdi 'zi'       # Interactive directory selection
    abbr -a zz 'z -'       # Jump to previous directory

    # Custom functions for enhanced navigation
    function zf --description "Find and jump to directory with tv integration"
        set -l result (zoxide query --list | tv)
        and z $result
    end

    function zr --description "Remove directory from zoxide database"
        zoxide remove $argv
    end

    function zq --description "Query zoxide database"
        zoxide query $argv
    end
end
