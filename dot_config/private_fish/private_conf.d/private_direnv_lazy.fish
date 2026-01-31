# Lazy-load direnv on first directory change if a .envrc exists in the path.
# This avoids 37ms startup cost by only loading direnv when actually needed.
set -g __DIRENV_LOADED 0

function __direnv_lazy_on_pwd --on-variable PWD --description 'Lazy-load direnv when needed'
    # Only run until we load direnv once
    if test $__DIRENV_LOADED -eq 1
        functions -e __direnv_lazy_on_pwd
        return
    end

    # Search upwards for a .envrc to avoid loading direnv unnecessarily
    set -l path "$PWD"
    while true
        if test -f "$path/.envrc"
            if type -q direnv
                # Load direnv hook once
                direnv hook fish | source
                set -g __DIRENV_LOADED 1

                # Apply env for current dir (ignore errors if not allowed yet)
                direnv export fish 2>/dev/null | source 2>/dev/null

                # Remove this watcher to avoid further overhead
                functions -e __direnv_lazy_on_pwd
            end
            break
        end
        set -l parent (path dirname "$path")
        if test "$parent" = "$path"
            break
        end
        set path "$parent"
    end
end

# Also check on first prompt if we start directly in a directory with .envrc
function __direnv_lazy_on_prompt --on-event fish_prompt
    if test $__DIRENV_LOADED -eq 0
        set -l path "$PWD"
        while true
            if test -f "$path/.envrc"
                if type -q direnv
                    direnv hook fish | source
                    set -g __DIRENV_LOADED 1
                    direnv export fish 2>/dev/null | source 2>/dev/null
                end
                break
            end
            set -l parent (path dirname "$path")
            if test "$parent" = "$path"
                break
            end
            set path "$parent"
        end
    end
    functions -e __direnv_lazy_on_prompt
end
