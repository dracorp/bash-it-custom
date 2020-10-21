if [[ -d ~/.basher ]]; then
    _add2env PATH $HOME/.basher/bin
    eval "$(basher init - bash)"
fi
