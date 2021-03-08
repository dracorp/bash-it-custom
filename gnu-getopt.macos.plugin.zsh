if [[ -d /usr/local/opt/gnu-getopt/etc/bash_completion.d ]]; then
    path=(/usr/local/opt/gnu-getopt/bin $path)
    . /usr/local/opt/gnu-getopt/etc/bash_completion.d/getopt
fi
