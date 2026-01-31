# env.nu
#
# Installed by:
# version = "0.109.1"

# nupm configuration
$env.NUPM_HOME = ($env.HOME | path join ".local" "share" "nupm")

$env.NU_LIB_DIRS = [
    ($env.NU_LIB_DIRS? | default [])
    ($env.NUPM_HOME | path join "modules")
] | flatten | uniq

$env.PATH = (
    $env.PATH
    | split row (char esep)
    | prepend ($env.NUPM_HOME | path join "scripts")
    | uniq
)

# Oh My Posh
$env.POSH_THEME = "/Users/tuliopinheirocunha/.mytheme.omp.json"
$env.PROMPT_COMMAND = { || oh-my-posh print primary --config $env.POSH_THEME }
$env.PROMPT_COMMAND_RIGHT = { || oh-my-posh print right --config $env.POSH_THEME }
