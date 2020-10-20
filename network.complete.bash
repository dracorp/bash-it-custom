# bash completion for network devices
_netdev(){
    _init_completion || return
    local cur netdev
    COMPREPLY=()
    cur=${COMP_WORDS[COMP_CWORD]}

    netdev=$(ip link show | egrep '^[0-9]+:'| awk -F: '{print $2}' | sed 's/^\s\+//')
    COMPREPLY=( $( compgen -W "$netdev" -- "$cur" ) )
    COMPREPLY+=( $( compgen -W '$( _parse_usage "$1" --help )' -- "$cur" ) )
} &&
complete -F _netdev dhcpcd

_ip.pl(){
    _init_completion || return
    local netdev
    netdev=$(ip link show | egrep '^[0-9]+:'| awk -F: '{print $2}' | sed 's/^\s\+//')
    if [[ $COMP_CWORD -eq 1 ]]; then
        COMPREPLY=( $( compgen -W "$netdev" -- "$cur" ) )
    fi

} &&
complete -F _ip.pl ip.pl
