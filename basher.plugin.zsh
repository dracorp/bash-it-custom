if [[ -d ~/.basher ]]; then
    path+=$HOME/.basher/bin
    eval "$(basher init - zsh)"
fi
