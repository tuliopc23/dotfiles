# Forge Integration for Fish

# PERSISTENT STATE (Universal Variables)
# These allow sharing active agent/conversation across terminal tabs
if not set -q FORGE_ACTIVE_AGENT
    set -U FORGE_ACTIVE_AGENT forge
end

if not set -q FORGE_CONVERSATION_ID
    set -U FORGE_CONVERSATION_ID ""
end

# ENVIRONMENT
set -gx FORGE_BIN (command -v forge)
set -gx _FORGE_DELIMITER '\s\s+'

# HELPER FUNCTIONS
function _forge_log_info
    set -l timestamp (set_color 90)"["(date '+%H:%M:%S')"]"(set_color normal)
    echo -e (set_color white)"⏺"(set_color normal) "$timestamp" (set_color white)"$argv"(set_color normal)
end

function _forge_log_success
    set -l timestamp (set_color 90)"["(date '+%H:%M:%S')"]"(set_color normal)
    echo -e (set_color yellow)"⏺"(set_color normal) "$timestamp" (set_color white)"$argv"(set_color normal)
end

function _forge_log_error
    set -l timestamp (set_color 90)"["(date '+%H:%M:%S')"]"(set_color normal)
    echo -e (set_color red)"⏺"(set_color normal) "$timestamp" (set_color red)"$argv"(set_color normal)
end

function _forge_fzf
    fzf --exact --cycle --select-1 --height 100% --no-scrollbar --ansi --color="header:bold" $argv
end

# PROMPT INTEGRATION
function _forge_prompt_info
    # Use the same command as ZSH to get the status string
    if test -z "$FORGE_BIN"
        return 0
    end

    # `forge zsh rprompt` can print noisy warnings (e.g. from `vp`) when the
    # underlying package isn't installed. Capture output and only display it
    # when the command succeeds.
    set -l out (_FORGE_CONVERSATION_ID=$FORGE_CONVERSATION_ID _FORGE_ACTIVE_AGENT=$FORGE_ACTIVE_AGENT $FORGE_BIN zsh rprompt 2>/dev/null)
    if test $status -eq 0
        echo -n $out
    end
end

# CORE ACTIONS
function _forge_action_agent
    set -l agents_output ($FORGE_BIN list agents --porcelain 2>/dev/null)
    if test -n "$agents_output"
        set -l fzf_args --prompt="Agent ❯ " --delimiter="$_FORGE_DELIMITER" --with-nth="1,2,4,5,6" --header-lines=1
        
        set -l selected_agent (echo "$agents_output" | _forge_fzf $fzf_args)
        if test -n "$selected_agent"
            set -l agent_id (echo "$selected_agent" | awk '{print $1}')
            set -U FORGE_ACTIVE_AGENT "$agent_id"
            _forge_log_success "Switched to agent "(set_color --bold)"$agent_id"
        end
    else
        _forge_log_error "No agents found"
    end
end

function _forge_action_model
    set -l models_output ($FORGE_BIN list models --porcelain 2>/dev/null)
    if test -n "$models_output"
        set -l fzf_args --delimiter="$_FORGE_DELIMITER" --prompt="Model ❯ " --with-nth="2,3,5.." --header-lines=1
        
        set -l selected (echo "$models_output" | _forge_fzf $fzf_args)
        if test -n "$selected"
            # Parse model_id and provider_id
            set -l model_id (echo "$selected" | awk -F '  +' '{print $1}' | string trim)
            set -l provider_id (echo "$selected" | awk -F '  +' '{print $4}' | string trim)
            
            # Update config via forge CLI
            $FORGE_BIN config set provider "$provider_id" >/dev/null
            $FORGE_BIN config set model "$model_id" >/dev/null
            _forge_log_success "Switched to model "(set_color --bold)"$model_id"
        end
    end
end

function _forge_action_conversation
    set -l convs_output ($FORGE_BIN conversation list --porcelain 2>/dev/null)
    if test -n "$convs_output"
        set -l preview_cmd "CLICOLOR_FORCE=1 $FORGE_BIN conversation info {1}; echo; CLICOLOR_FORCE=1 $FORGE_BIN conversation show {1}"
        set -l fzf_args --prompt="Conversation ❯ " --delimiter="$_FORGE_DELIMITER" --with-nth="2,3" --header-lines=1 --preview="$preview_cmd" --preview-window=top:75%:wrap:border-sharp
        
        set -l selected (echo "$convs_output" | _forge_fzf $fzf_args)
        if test -n "$selected"
            set -l conv_id (echo "$selected" | awk '{print $1}')
            set -U FORGE_CONVERSATION_ID "$conv_id"
            echo
            $FORGE_BIN conversation show "$conv_id"
            $FORGE_BIN conversation info "$conv_id"
            _forge_log_success "Switched to conversation "(set_color --bold)"$conv_id"
        end
    else
        _forge_log_error "No conversations found"
    end
end

function _forge_action_suggest
    set -l description $argv
    if test -z "$description"
        _forge_log_error "Please provide a command description"
        return
    end
    echo
    set -l generated_command (FORCE_COLOR=true CLICOLOR_FORCE=1 $FORGE_BIN --agent $FORGE_ACTIVE_AGENT suggest "$description")
    if test -n "$generated_command"
        commandline -r "$generated_command"
    else
        _forge_log_error "Failed to generate command"
    end
end

# Trigger dispatcher for Forge commands and file context
function _forge_dispatch
    set -l cmd (commandline -b)
    
    # Handle :command trigger
    if string match -r '^:(?<action>[a-zA-Z0-9_-]+)?(?<args> .*)?$' "$cmd" >/dev/null
        # Extract matches
        set -l matches (string match -r '^:(?<action>[a-zA-Z0-9_-]+)?(?<args> .*)?$' "$cmd")
        set -l action $matches[2]
        set -l input_text (string trim "$matches[3]")

        switch "$action"
            case agent a
                _forge_action_agent
                commandline -r ""
            case model m
                _forge_action_model
                commandline -r ""
            case conversation c
                _forge_action_conversation
                commandline -r ""
            case new n
                set -U FORGE_CONVERSATION_ID ""
                $FORGE_BIN banner
                commandline -r ""
            case suggest s
                _forge_action_suggest "$input_text"
            case commit
                echo
                $FORGE_BIN commit --max-diff 100000
                commandline -r ""
            case ""
                # Fuzzy find command list
                set -l cmd_list ($FORGE_BIN list commands --porcelain 2>/dev/null)
                set -l selected (echo "$cmd_list" | _forge_fzf --header-lines=1 --delimiter="$_FORGE_DELIMITER" --nth=1 --prompt="Command ❯ ")
                if test -n "$selected"
                    set -l cmd_name (echo "$selected" | awk '{print $1}')
                    commandline -r ":$cmd_name "
                end
            case '*'
                # Default execution
                echo
                if test -z "$FORGE_CONVERSATION_ID"
                    set -U FORGE_CONVERSATION_ID ($FORGE_BIN conversation new)
                end
                $FORGE_BIN --agent $FORGE_ACTIVE_AGENT --conversation-id $FORGE_CONVERSATION_ID -p "$cmd"
                commandline -r ""
        end
        commandline -f repaint
    else
        # Regular command execution
        commandline -f execute
    end
end

# Right prompt integration for Fish
function fish_right_prompt
    # Existing right prompt logic (from oh-my-posh if any)
    # Note: Oh-my-posh usually handles both prompts, but we can override or append.
    set -l forge_status (_forge_prompt_info)
    if test -n "$forge_status"
        echo -n -s "$forge_status "
    end
end

# KEYBINDINGS
function forge_keybindings
    # Bind Enter to dispatcher if line starts with :
    bind \r _forge_dispatch
    bind \n _forge_dispatch
    
    # Bind @ for file context selection
    bind @ _forge_context_select
end

function _forge_context_select
    set -l fd_cmd (command -v fdfind; or command -v fd; or echo "fd")
    set -l cat_cmd "cat"
    if command -q bat
        set -l cat_cmd "bat --color=always --style=numbers,changes --line-range=:500"
    end
    
    set -l preview_cmd "if [ -d {} ]; then ls -la --color=always {} 2>/dev/null || ls -la {}; else $cat_cmd {}; fi"
    set -l file_list ($fd_cmd --type f --type d --hidden --exclude .git)
    
    set -l selected (echo "$file_list" | _forge_fzf --preview="$preview_cmd" --preview-window=top:75%:wrap:border-sharp)
    if test -n "$selected"
        commandline -i "@[$selected]"
    else
        commandline -i "@"
    end
end

# INITIALIZE
if status is-interactive
    forge_keybindings
end
