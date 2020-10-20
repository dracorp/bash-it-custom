# Bash auto-completion script written for repacman

_repacman() {
    local cur prev packages opts
    _get_comp_words_by_ref cur prev
    COMPREPLY=()
    packages=$(pacman -Qq)
    opts=$(_parse_help $1 -h)
    if [[ $COMP_CWORD -eq 1 ]]; then
        COMPREPLY=( $( compgen -W "$opts" -- "$cur" ) )
        COMPREPLY+=( $( compgen -W "$packages" -- "$cur" ) )
    else
        if [[ "$prev" = '-h' ]]; then
            return
        fi
        COMPREPLY=( $( compgen -W "$packages" -- "$cur" ) )
    fi
} &&
complete -F _repacman repacman
