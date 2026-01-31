# Cache git availability quickly using fish built-ins (avoids spawning git).
# This runs at first prompt with negligible cost.
set -g __git_available -1

function __git_cache_availability --on-event fish_prompt --description 'Cache git availability'
    if test $__git_available -eq -1
        if type -q git
            set -g __git_available 1
        else
            set -g __git_available 0
        end
        # Remove this event handler after first run
        functions -e __git_cache_availability
    end
end

function git_available --description 'Return success if git is available (cached)'
    if test $__git_available -eq 1
        return 0
    end
    return 1
end
