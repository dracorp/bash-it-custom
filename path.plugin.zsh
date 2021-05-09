path=(/usr/local/bin $path)
if [[ -n $command[gls] ]]; then
    alias ls='gls --color=tty'
fi
path+=$HOME/bin
path+=$HOME/opt/macos
# _add2env ./bin
# _add2env .
