# bash completion for ipaddr                                -*- shell-script -*-

_ipaddr(){
    COMPREPLY=()
    local cur opts
    _get_comp_words_by_ref cur
    opts=$(ip link show up | awk -F: '/^[[:digit:]]/ {print $2}')
    COMPREPLY=( $( compgen -W "$opts" -- "$cur" ) )
} &&
complete -F _ipaddr ipaddr

