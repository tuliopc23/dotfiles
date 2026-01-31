function fish_user_key_bindings
    # Skip custom key bindings in Warp to avoid conflicts
    if test "$TERM_PROGRAM" = "WarpTerminal"
        return
    end

    fish_default_key_bindings -M insert
    fish_vi_key_bindings --no-erase insert

    # ==========================================================================
    # VI MODE TAB COMPLETION - Accept Full Autosuggestion
    # ==========================================================================
    # In vi insert mode, make Tab accept the full autosuggestion (gray text)
    # This restores the behavior where tab completes the entire word/command
    # instead of just showing the completion dropdown menu

    bind -M insert tab "commandline -f accept-autosuggestion"

    # Shift+Tab opens the interactive completion pager
    # Use this when you need to browse through multiple completion options
    bind -M insert shift-tab "commandline -f complete-and-search"

    # ==========================================================================
    # Optional: VI COMMAND MODE Customizations
    # ==========================================================================
    # Uncomment the lines below if you want custom keybindings in command mode

    # bind -M default tab "commandline -f complete"
    # bind -M default shift-tab "commandline -f complete-and-search"
end
