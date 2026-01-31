function tv-files --description "Search and open files with tv"
    set -l result (tv files)
    test -n "$result"; and $EDITOR $result
end
