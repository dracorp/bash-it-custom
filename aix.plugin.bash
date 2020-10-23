if [[ $(uname -s) == AIX ]]; then
    PATH=/opt/freeware/bin:$PATH
    function grep() {
        ggrep "$@"
    }
    function tput() {
        LIBPATH=/opt/freeware/bin/tput "$@"
    }
fi
