# Add Cargo's bin to PATH for fish shells
# Uses fish_add_path to avoid duplicates and ensure it is prepended.
# Falls back to manual PATH export if fish_add_path is unavailable.

if type -q fish_add_path
    fish_add_path --path --prepend "$HOME/.cargo/bin"
else
    set -l cargo_bin "$HOME/.cargo/bin"
    if test -d $cargo_bin
        if not contains $cargo_bin $PATH
            set -x PATH $cargo_bin $PATH
        end
    end
end

