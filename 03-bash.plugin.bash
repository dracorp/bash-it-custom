# use nullglob only in script for syntax like as: man3=(*.3)
shopt -u nullglob

# extended globs
shopt -s extglob
# ?(pattern-list) 0 or 1
# +(pattern-list) 1 or more
# *(pattern-list) 0 or more
# @(pattern-list) 1
# !(pattern-list) none
# patterns in a list are separated by | characters.

# dodawaj do pliku history zamiast go nadpisywac
shopt -s histappend

# see also hstr.plugin.bash
# ignoruj duplikaty
# export HISTCONTROL=ignoredups
# ingoruj wpisy
export HISTIGNORE=' *:exit:cd *'
# format daty dla wpisow w history, domyslnie brak, man date
# export HISTTIMEFORMAT="%F %T "
export HISTTIMEFORMAT="[%F %T] "
# export HISTFILE=~/.history
# PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
export TMOUT=

export HISTCONTROL=ignoreboth

_rm4env /usr/local/bin
_add2env PATH=+/usr/local/bin

if ((BASH_VERSINFO[0] >= 4)) && ((BASH_VERSINFO[1] >= 2)); then
    shopt -s direxpand
fi

