# bash completion for h2xs                                  -*- shell-script -*-

_h2xs(){
    local cur opts
    COMPREPLY=()
    _get_comp_words_by_ref cur
    opts=$(_parse_help1 $1 -h)
    COMPREPLY=( $( compgen -W "$opts" -- "$cur" ) )
} &&
complete -F _h2xs h2xs

# vi: syntax=sh
