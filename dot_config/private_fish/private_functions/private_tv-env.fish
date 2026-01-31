function tv-env --description "Browse and copy environment variables with tv"
    set -l var (env | sort | tv | cut -d= -f2)
    test -n "$var"; and echo $var | pbcopy; and echo "Copied to clipboard: $var"
end
