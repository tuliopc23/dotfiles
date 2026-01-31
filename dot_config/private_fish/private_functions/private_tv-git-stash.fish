function tv-git-stash --description "Interactive git stash browser with tv"
    if not git rev-parse --git-dir >/dev/null 2>&1
        echo "Not in a git repository" >&2
        return 1
    end

    set -l stash (git stash list | tv)
    if test -n "$stash"
        set -l ref (string split ':' -- $stash)[1]
        set ref (string replace ':' '' -- $ref)
        git stash pop $ref
    end
end
