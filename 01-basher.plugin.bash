if [[ -d ~/.basher ]]; then
    _add2env PATH $HOME/.basher/bin
#     . ~/.basher/completions/basher.bash
    eval "$(basher init -)"
#     export BASHER_SHELL=bash
#     export BASHER_ROOT=~/.basher
#     export BASHER_PREFIX=~/.basher/cellar
#     export PATH="$BASHER_ROOT/cellar/bin:$PATH"
#     . "$BASHER_ROOT/lib/include.bash"
#     . "$BASHER_ROOT/completions/basher.bash"
#     for f in $(command ls "$BASHER_ROOT/cellar/completions/bash"); do source "$BASHER_ROOT/cellar/completions/bash/$f"; done
fi
