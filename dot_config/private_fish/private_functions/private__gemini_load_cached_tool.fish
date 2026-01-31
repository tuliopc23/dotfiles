# Function to handle cached initialization with auto-update check
function _gemini_load_cached_tool -a tool_name tool_cmd cache_file
    set -l cache_path "$HOME/.config/fish/conf.d/$cache_file"
    set -l bin_path (command -s $tool_name)

    # 1. Check if tool exists
    if not test -n "$bin_path"
        return
    end

    # 2. Check if cache needs update (cache missing OR tool is newer than cache)
    if not test -f "$cache_path"; or test "$bin_path" -nt "$cache_path"
        # Generate new cache
        eval $tool_cmd > "$cache_path" 2>/dev/null
    end

    # 3. Load the cache (if it exists and is non-empty)
    if test -s "$cache_path"
        source "$cache_path"
    else
        # Fallback if generation failed (e.g. tool error)
        eval $tool_cmd | source
    end
end
