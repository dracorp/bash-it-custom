_firefox() {
    local cur
    _get_comp_words_by_ref cur
    COMPREPLY=()
    opts=$(_parse_help $1 --help)
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
} &&
    complete -F _firefox firefox

_thunderbird() {
    local cur
    _get_comp_words_by_ref cur
    COMPREPLY=()
    opts=$(_parse_help $1 --help)
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
} &&
    complete -F _thunderbird thunderbird
