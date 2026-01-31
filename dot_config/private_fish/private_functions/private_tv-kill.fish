function tv-kill --description "Interactive process killer with tv"
    set -l pid (procs | tv | awk '{print $1}')
    test -n "$pid"; and kill -9 $pid
end
