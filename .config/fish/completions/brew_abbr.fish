# Custom completions for brew abbreviations
# Complete bi (brew install) with available packages
complete -f -c bi -w 'brew install'

# Complete bs (brew search) with search functionality  
complete -f -c bs -w 'brew search'

# Complete bunn (brew uninstall) with installed packages
complete -f -c bunn -w 'brew uninstall'

# Complete bri (brew reinstall) with installed packages
complete -f -c bri -w 'brew reinstall'
