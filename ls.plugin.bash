if which dircolors 1>/dev/null 2>&1; then
    test -r ~/.dir_colors && eval "$(dircolors -b ~/.dir_colors)" || eval "$(dircolors -b)"
    alias ls='ls -Fh --group-directories-first --color=auto --time-style="+%Y-%m-%d %H:%M:%S"'
fi
