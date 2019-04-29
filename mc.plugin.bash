if [[ $(uname) = Linux ]]; then
    alias mc='. /usr/lib/mc/mc-wrapper.sh'
elif [[ $(uname) = Darwin ]]; then
    alias mc='. /usr/local/opt/midnight-commander/libexec/mc/mc-wrapper.sh'
fi
