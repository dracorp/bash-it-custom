# nodejs
export NPM_PACKAGES="$HOME/.npm-packages"
if [[ ! -d "$NPM_PACKAGES" ]]; then
    mkdir -p "$NPM_PACKAGES"/{bin,lib/node_modules}
fi
_add2env PATH "$NPM_PACKAGES/bin"
_add2env NODE_PATH "$NPM_PACKAGES/lib/node_modules"
# export NODE_TLS_REJECT_UNAUTHORIZED=0
