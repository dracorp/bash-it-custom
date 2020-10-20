# bash completion for bacman                                -*- shell-script -*-

_bacman(){
    COMPREPLY=()
    local cur opts
    _get_comp_words_by_ref cur
    local opts=$(pacman -Qq)
    COMPREPLY=( $( compgen -W "$opts" -- "$cur" ) )
} &&
complete -F _bacman bacman

