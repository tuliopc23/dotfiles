
set -gx PROXYPAL_API_KEY "proxypal-local"

function topgrade --description "Run topgrade with library path fix for cargo-install-update"
    command topgrade $argv
end
