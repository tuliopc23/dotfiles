function tv-git-branch --description "Interactive git branch switcher with tv"
    if not git rev-parse --git-dir >/dev/null 2>&1
        echo "Not in a git repository" >&2
        return 1
    end
    set -l branch (git branch --all | string trim | tv)
    test -n "$branch"; and git checkout (string replace -r '^[* ]+' '' -- $branch | string replace 'remotes/origin/' '')
end
