_setfont() {
    local cur
    _get_comp_words_by_ref cur
    opts=$(_parse_help $1 --help)
#     if [[ $COMP_CWORD eq 1 ]]; then
#         COMPREPLY=( $(compgen -F /usr/share/kbd/consolefonts/
#     fi
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
} && complete -F _setfont setfont
