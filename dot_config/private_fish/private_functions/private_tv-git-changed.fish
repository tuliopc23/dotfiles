function tv-git-changed --description "Browse and edit git changed files with tv"
    if not git rev-parse --git-dir >/dev/null 2>&1
        echo "Not in a git repository" >&2
        return 1
    end
    set -l file (git status --short | tv | string replace -r '^.{3}' '')
    test -n "$file"; and $EDITOR $file
end
