if which dircolors 1>/dev/null 2>&1; then
    test -r ~/.dir_colors && eval "$(dircolors -b ~/.dir_colors)" || eval "$(dircolors -b)"
fi

alias ls='ls -Fh --group-directories-first --color=auto --time-style="+%Y-%m-%d %H:%M:%S"'
alias ll='ls -l --color=auto' 2>/dev/null
alias l.='ls -d .* --color=auto' 2>/dev/null
# alias ls='ls --color=auto' 2>/dev/null
