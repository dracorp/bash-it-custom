# https://github.com/chubin/cheat.sh#tab-completion
fpath=(~/.zsh.d/ $fpath)
typeset -U fpath

export LDFLAGS CPPFLAGS PKG_CONFIG_PATH
ZSH_HIGHLIGHT_STYLES[globbing]='fg=white'

