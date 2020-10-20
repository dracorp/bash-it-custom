# bash completion - commons functions                       -*- shell-script -*-

# Parse GNU style help output of the given command.
# @param $1  command; if "-", read from stdin and ignore rest of args
# @param $2  command options (default: --help)
#
_parse_help1(){
    local cmd=$( quote "$1" )
    local opts="`$1 ${2:--h} 2>&1 | tr ' ,|' '\n\n\n' | sed -ne 's/^\s*\(-\{1,2\}[-a-zA-Z0-9?]\{1,\}\).*/\1/p' | sort -u`"
    printf '%s\n' "$opts"
}

# vi: ft=sh

