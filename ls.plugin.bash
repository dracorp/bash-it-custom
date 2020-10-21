if which dircolors 1>/dev/null 2>&1; then
    test -r ~/.dir_colors && eval "$(dircolors -b ~/.dir_colors)" || eval "$(dircolors -b)"
fi

    alias ls='ls -Fh --group-directories-first --color=auto --time-style="+%Y-%m-%d %H:%M:%S"'
    alias ll='ls -lFh --group-directories-first --color=auto --time-style="+%Y-%m-%d %H:%M:%S"'
    alias l.='ls -d .* --group-directories-first --color=auto'

alias lt='ls -lt | head -25'

# https://nfsec.pl/1line/6154
# TODO:
# _rm4env LS_COLORS 'ex=01;31' :
# _add2env LS_COLORS 'ex=00:su=00:sg=00:ca=00' :
# export LC_COLLATE=C
# export LANG=C

. "$HOME/.local/share/lscolors.sh"
