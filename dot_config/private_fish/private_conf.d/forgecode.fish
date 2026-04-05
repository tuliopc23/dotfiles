# ForgeCode Fish integration (manual, isolated)

if command -q forge
    # ':' prompt helper, similar to Forge's zsh flow.
    # Keep no-arg behavior as a silent no-op so existing `|| :` patterns keep working.
    function : --description 'Send a prompt to ForgeCode'
        if test (count $argv) -eq 0
            return 0
        end

        set -l prompt (string join ' ' -- $argv)
        forge -p "$prompt"
    end

    # Convenience alias-style abbreviation
    abbr -a fg forge
end
