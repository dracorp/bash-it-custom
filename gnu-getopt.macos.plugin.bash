if [[ -d /usr/local/opt/gnu-getopt/etc/bash_completion.d ]]; then
    _add2env PATH=+/usr/local/opt/gnu-getopt/bin
    . /usr/local/opt/gnu-getopt/etc/bash_completion.d/getopt
fi
