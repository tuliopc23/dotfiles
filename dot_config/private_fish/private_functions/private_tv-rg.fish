function tv-rg --description "Search file contents with ripgrep and tv"
    # If no arguments, prompt for pattern
    if test (count $argv) -eq 0
        read -l -P "Search pattern: " pattern
        if test -z "$pattern"
            return 1
        end
        set argv $pattern
    end
    
    set -l match (rg --line-number --no-heading --color=always --smart-case $argv | tv)
    if test -n "$match"
        set -l file (echo $match | cut -d: -f1)
        set -l line (echo $match | cut -d: -f2)
        test -n "$file"; and $EDITOR +$line $file
    end
end
