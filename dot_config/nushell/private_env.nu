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

# Oh My Posh (theme at ~/.mytheme.omp.json or set omp_theme to your path)
let omp_theme = ($env.HOME | path join ".mytheme.omp.json")
if ($omp_theme | path exists) {
    $env.POSH_THEME = $omp_theme
    # --shell nu so the shell segment shows "nu" instead of "shell"
    $env.PROMPT_COMMAND = { || oh-my-posh print primary --config $env.POSH_THEME --shell nu }
    $env.PROMPT_COMMAND_RIGHT = { || oh-my-posh print right --config $env.POSH_THEME --shell nu }
}
