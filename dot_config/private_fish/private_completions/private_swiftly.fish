# A function which filters options which starts with "-" from $argv.
function _swift_swiftly_preprocessor
    set -l results
    for i in (seq (count $argv))
        switch (echo $argv[$i] | string sub -l 1)
            case '-'
            case '*'
                echo $argv[$i]
        end
    end
end

function _swift_swiftly_using_command
    set -l currentCommands (_swift_swiftly_preprocessor (commandline -opc))
    set -l expectedCommands (string split " " $argv[1])
    set -l subcommands (string split " " $argv[2])
    if [ (count $currentCommands) -ge (count $expectedCommands) ]
        for i in (seq (count $expectedCommands))
            if [ $currentCommands[$i] != $expectedCommands[$i] ]
                return 1
            end
        end
        if [ (count $currentCommands) -eq (count $expectedCommands) ]
            return 0
        end
        if [ (count $subcommands) -gt 1 ]
            for i in (seq (count $subcommands))
                if [ $currentCommands[(math (count $expectedCommands) + 1)] = $subcommands[$i] ]
                    return 1
                end
            end
        end
        return 0
    end
    return 1
end

complete -c swiftly -n '_swift_swiftly_using_command "swiftly install"' -l use -s u -d 'Mark the newly installed toolchain as in-use.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly install"' -l verify -d 'Verify the toolchain\'s PGP signature before proceeding with installation.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly install"' -l no-verify -d 'Verify the toolchain\'s PGP signature before proceeding with installation.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly install"' -l post-install-file -d 'A file path to a location for a post installation script' -r -f -a '(for i in *.{}; echo $i;end)'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly install"' -l progress-file -d 'A file path where progress information will be written in JSONL format' -r -f -a '(for i in *.{}; echo $i;end)'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly install"' -l format -d 'Output format (text, json)' -r -f -k -a 'text json'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly install"' -s y -l assume-yes -d 'Disable confirmation prompts by assuming \'yes\''
complete -c swiftly -n '_swift_swiftly_using_command "swiftly install"' -l verbose -d 'Enable verbose reporting from swiftly'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly install"' -l version -d 'Show the version.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly install"' -s h -l help -d 'Show help information.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly list-available"' -l format -d 'Output format (text, json)' -r -f -k -a 'text json'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly list-available"' -l version -d 'Show the version.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly list-available"' -s h -l help -d 'Show help information.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly use"' -l print-location -s p -d 'Print the location of the in-use toolchain. This is valid only when there is no toolchain argument.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly use"' -l global-default -s g -d 'Set the global default toolchain that is used when there are no .swift-version files.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly use"' -l format -d 'Output format (text, json)' -r -f -k -a 'text json'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly use"' -s y -l assume-yes -d 'Disable confirmation prompts by assuming \'yes\''
complete -c swiftly -n '_swift_swiftly_using_command "swiftly use"' -l verbose -d 'Enable verbose reporting from swiftly'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly use"' -l version -d 'Show the version.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly use"' -s h -l help -d 'Show help information.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly uninstall"' -s y -l assume-yes -d 'Disable confirmation prompts by assuming \'yes\''
complete -c swiftly -n '_swift_swiftly_using_command "swiftly uninstall"' -l verbose -d 'Enable verbose reporting from swiftly'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly uninstall"' -l version -d 'Show the version.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly uninstall"' -s h -l help -d 'Show help information.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly list"' -l format -d 'Output format (text, json)' -r -f -k -a 'text json'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly list"' -l version -d 'Show the version.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly list"' -s h -l help -d 'Show help information.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly update"' -s y -l assume-yes -d 'Disable confirmation prompts by assuming \'yes\''
complete -c swiftly -n '_swift_swiftly_using_command "swiftly update"' -l verbose -d 'Enable verbose reporting from swiftly'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly update"' -l verify -d 'Verify the toolchain\'s PGP signature before proceeding with installation.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly update"' -l no-verify -d 'Verify the toolchain\'s PGP signature before proceeding with installation.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly update"' -l post-install-file -d 'A file path to a location for a post installation script' -r -f -a '(for i in *.{}; echo $i;end)'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly update"' -l version -d 'Show the version.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly update"' -s h -l help -d 'Show help information.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly init"' -s n -l no-modify-profile -d 'Do not attempt to modify the profile file to set environment variables (e.g. PATH) on login.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly init"' -l overwrite -s o -d 'Overwrite the existing swiftly installation found at the configured SWIFTLY_HOME, if any. If this option is unspecified and an existing installation is found, the swiftly executable will be updated, but the rest of the installation will not be modified.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly init"' -l platform -d 'Specify the current Linux platform for swiftly'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly init"' -l skip-install -d 'Skip installing the latest toolchain'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly init"' -l quiet-shell-followup -d 'Quiet shell follow up commands'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly init"' -s y -l assume-yes -d 'Disable confirmation prompts by assuming \'yes\''
complete -c swiftly -n '_swift_swiftly_using_command "swiftly init"' -l verbose -d 'Enable verbose reporting from swiftly'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly init"' -l version -d 'Show the version.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly init"' -s h -l help -d 'Show help information.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly self-update"' -s y -l assume-yes -d 'Disable confirmation prompts by assuming \'yes\''
complete -c swiftly -n '_swift_swiftly_using_command "swiftly self-update"' -l verbose -d 'Enable verbose reporting from swiftly'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly self-update"' -l version -d 'Show the version.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly self-update"' -s h -l help -d 'Show help information.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly run"' -l version -d 'Show the version.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly run"' -s h -l help -d 'Show help information.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly link"' -s y -l assume-yes -d 'Disable confirmation prompts by assuming \'yes\''
complete -c swiftly -n '_swift_swiftly_using_command "swiftly link"' -l verbose -d 'Enable verbose reporting from swiftly'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly link"' -l version -d 'Show the version.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly link"' -s h -l help -d 'Show help information.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly unlink"' -s y -l assume-yes -d 'Disable confirmation prompts by assuming \'yes\''
complete -c swiftly -n '_swift_swiftly_using_command "swiftly unlink"' -l verbose -d 'Enable verbose reporting from swiftly'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly unlink"' -l version -d 'Show the version.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly unlink"' -s h -l help -d 'Show help information.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly help"' -l version -d 'Show the version.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly" "install list-available use uninstall list update init self-update run link unlink help"' -l version -d 'Show the version.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly" "install list-available use uninstall list update init self-update run link unlink help"' -s h -l help -d 'Show help information.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly" "install list-available use uninstall list update init self-update run link unlink help"' -f -a 'install' -d 'Install a new toolchain.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly" "install list-available use uninstall list update init self-update run link unlink help"' -f -a 'list-available' -d 'List toolchains available for install.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly" "install list-available use uninstall list update init self-update run link unlink help"' -f -a 'use' -d 'Set the in-use or default toolchain. If no toolchain is provided, print the currently in-use toolchain, if any.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly" "install list-available use uninstall list update init self-update run link unlink help"' -f -a 'uninstall' -d 'Remove an installed toolchain.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly" "install list-available use uninstall list update init self-update run link unlink help"' -f -a 'list' -d 'List installed toolchains.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly" "install list-available use uninstall list update init self-update run link unlink help"' -f -a 'update' -d 'Update an installed toolchain to a newer version.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly" "install list-available use uninstall list update init self-update run link unlink help"' -f -a 'init' -d 'Perform swiftly initialization into your user account.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly" "install list-available use uninstall list update init self-update run link unlink help"' -f -a 'self-update' -d 'Update the version of swiftly itself.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly" "install list-available use uninstall list update init self-update run link unlink help"' -f -a 'run' -d 'Run a command while proxying to the selected toolchain commands.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly" "install list-available use uninstall list update init self-update run link unlink help"' -f -a 'link' -d 'Link swiftly so it resumes management of the active toolchain.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly" "install list-available use uninstall list update init self-update run link unlink help"' -f -a 'unlink' -d 'Unlinks swiftly so it no longer manages the active toolchain.'
complete -c swiftly -n '_swift_swiftly_using_command "swiftly" "install list-available use uninstall list update init self-update run link unlink help"' -f -a 'help' -d 'Show subcommand help information.'
