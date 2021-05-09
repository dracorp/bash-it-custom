# https://github.com/chubin/cheat.sh#tab-completion
fpath=(~/.zsh.d/ $fpath)
typeset -U fpath

export LDFLAGS CPPFLAGS PKG_CONFIG_PATH
# zsh-users/zsh-syntax-highlighting
[[ -n $ZSH_HIGHLIGHT_STYLES ]] && ZSH_HIGHLIGHT_STYLES[globbing]='fg=white'
# for ohmyzsh
DISABLE_LS_COLORS=false
# [[ -r ~/.iterm2_shell_integration.zsh ]] && source ~/.iterm2_shell_integration.zsh
