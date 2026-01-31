function tv-git-log --description "Interactive git log viewer with tv"
    if not git rev-parse --git-dir >/dev/null 2>&1
        echo "Not in a git repository" >&2
        return 1
    end
    set -l commit (git log --oneline --color=always | tv | string split ' ' | head -n1)
    test -n "$commit"; and git show $commit | bat --style=full
end
