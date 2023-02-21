_uname=$(uname)
if [[ $_uname = Linux ]]; then
    if [[ -r /usr/libexec/mc/mc-wrapper.sh ]]; then
        alias mc='. /usr/libexec/mc/mc-wrapper.sh'
    elif [[ -r /usr/lib/mc/mc-wrapper.sh ]]; then
        alias mc='. /usr/lib/mc/mc-wrapper.sh'
    fi
elif [[ $_uname = Darwin ]]; then
    if [[ -r /usr/local/opt/midnight-commander/libexec/mc/mc-wrapper.sh ]]; then
        alias mc='. /usr/local/opt/midnight-commander/libexec/mc/mc-wrapper.sh'
    fi
elif [[ $_uname == AIX ]]; then
    if [[ -r /opt/freeware/libexec/mc/mc-wrapper.sh ]]; then
        alias mc='. /opt/freeware/libexec/mc/mc-wrapper.sh'
    fi
fi

export VIEWER
if hash bat &>/dev/null; then
    VIEWER=bat
fi
