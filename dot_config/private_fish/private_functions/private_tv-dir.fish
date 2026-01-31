function tv-dir --description "Smart directory navigation with tv and zoxide"
    set -l dir (zoxide query -l | tv)
    test -n "$dir"; and cd $dir
end
