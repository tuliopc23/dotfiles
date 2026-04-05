function pnpm
    # Forward common dev/build scripts to Vite Plus.
    if test (count $argv) -ge 2; and test "$argv[1]" = "run"
        set -l script $argv[2]
        set -l forwarded

        # Prefer forwarding args after `--` (pnpm/npm "pass through" separator).
        set -l sep_idx (contains -i -- '--' $argv)
        if test -n "$sep_idx"
            set -l start_idx (math "$sep_idx + 1")
            if test "$start_idx" -le (count $argv)
                set forwarded $argv[$start_idx..-1]
            end
        else
            if test (count $argv) -ge 3
                set forwarded $argv[3..-1]
            end
        end

        switch $script
            case dev start
                command vp dev $forwarded
                return
            case build
                command vp build $forwarded
                return
            case preview serve
                command vp preview $forwarded
                return
        end
    end

    command pnpm $argv
end
