#---  FUNCTION  ----------------------------------------------------------------
#        NAME: _add2env
# DESCRIPTION: Adds new value to env variable. The first parameter must be set,
#              rest is optional. If they are omitted then it'll be used PATH
#              as variable and : as separator.
#              It works with Bash and Ksh as well. But it does not work with Zsh yet.
#    SYNOPSIS: _add2env options
#       USAGE: _add2env value
#              _add2env variable value
#              _add2env variable value separator
#              _add2env variable=value
#     RETURNS: 0 if success, 1 otherwise
#-------------------------------------------------------------------------------
unset _add2env
function _add2env { #{{{
    if  [ $# -lt 1 ] || [ $# -gt 3 ]; then
        printf '%s\n' 'Wrong number of arguments, must be 1, 2 or 3: [value], [variable value], [variable value separator]' >&2
        return 1
    fi

    : ${DEBUG_DEVEL=0}
    typeset value variable separator
    typeset modification=post

    # Checking number of arguments
    if [ $# -eq 1 ]; then
        value=${1}
        variable=PATH
        separator=:
    elif [ $# -eq 2 ]; then
        variable=$1
        value=$2
        separator=:
    else
        variable=$1
        value=$2
        separator=$3
    fi

    if [ $# -eq 1 ]; then
        # checking type of modification
        if [[ $value =~ \+= ]]; then
        # pre-append to variable
        # _add2env VARIABLE=+value
            modification=post
            variable=${value%+=*}
            value=${value#*+=}
            separator=${2:-:}
        elif [[ $value =~ =\+ ]]; then
        # append to variable
        # _add2env VARIABLE+=value
            modification=pre
            variable=${value%=+*}
            value=${value#*=+}
            separator=${2:-:}
        elif [[ $value =~ = ]]; then
        # _add2env VARIABLE=value
            modification=assign
            variable=${value%=*}
            value=${value#*=}
            separator=${2:-:}
        fi
    fi

    # evaluate tylde
    if [[ $value =~ '~' ]]; then
        value=$(eval echo "$value")
    fi

    if (( DEBUG_DEVEL )); then
        echo "modification: $modification, variable: $variable, separator $separator, value: $value" >&2
    fi

    typeset valueOfVariable=$(eval echo "$(printf "$%s" "$variable")")
    if [ -z "$valueOfVariable" ]; then
        # simple assign
        if (( DEBUG_DEVEL )); then
            echo eval "$variable=$value" >&2
        fi
        eval "$variable=$value"
        # shellcheck disable=SC2163
        export "$variable"
        if (( DEBUG_DEVEL )); then
            echo export "$variable"
        fi
    else
        if [[ "$modification" = assign ]]; then
            if (( DEBUG_DEVEL )); then
                echo eval "$variable=$value"
            fi
            eval "$variable=$value"
        else
            case "$valueOfVariable" in ${value}${separator}* | *${separator}${value}${separator}* | *${separator}${value} | $value )
                    : echo already set
                    ;;
                *)
                    case $modification in
                        post)
                            if (( DEBUG_DEVEL )); then
                                echo eval "$variable=${valueOfVariable}${separator}${value}"
                            fi
                            eval "$variable=${valueOfVariable}${separator}${value}"
                            ;;
                        pre)
                            if (( DEBUG_DEVEL )); then
                                echo eval "$variable=${value}${separator}${valueOfVariable}"
                            fi
                            eval "$variable=${value}${separator}${valueOfVariable}"
                            ;;
                    esac
                    # shellcheck disable=SC2163
                    export "$variable"
                    if (( DEBUG_DEVEL )); then
                        echo export "$variable"
                    fi
                    ;;
            esac
        fi
    fi

    return 0
} #}}}

#-------------------------------------------------------------------------------
#  DESCRIPTION: Removes value from env variable. The first parameter must be set,
#              rest is optional. If they are omitted then it'll be used PATH
#              as variable and : as separator.
#              It works with Bash and Ksh as well. But it does not work with Zsh yet.
#     SYNOPSIS: _rm4env values
#        USAGE: _rm4env value
#               _rm4env variable value
#               _rm4env variable variable separator
#               _rm4env variable=value
# REQUIREMENTS: perl
#      RETURNS: 0 if success, 1 otherwise
#-------------------------------------------------------------------------------
unset _rm4env
function _rm4env { #{{{
    if  [ $# -lt 1 ] || [ $# -gt 3 ]; then
        printf '%s\n' 'Wrong number of arguments, must be 1, 2 or 3: [value], [variable value], [variable value separator]' >&2
        return 1
    fi

    : ${DEBUG_DEVEL=0}
    typeset value variable separator
    typeset modification=remove

    if [ $# -eq 1 ]; then
        value=${1}
        variable=PATH
        separator=:
    elif [ $# -eq 2 ]; then
        variable=$1
        value=$2
        separator=:
    else
        variable=$1
        value=$2
        separator=$3
    fi

    # _rm4env VARIABLE=value
    if [[ $# -eq 1 && $value =~ = ]]; then
        modification=assign
        variable=${value%=*}
        value=${value#*=}
        separator=${2:-:}
    fi

    if (( DEBUG_DEVEL )); then
        echo "modification: $modification, variable: $variable, separator $separator, value: $value" >&2
    fi

    if [[ "$modification" == assign ]]; then
        if (( DEBUG_DEVEL )); then
            echo eval "$variable=$value" >&2
        fi
        eval "$variable=$value"
        # shellcheck disable=SC2163
        export "$variable"
        if (( DEBUG_DEVEL )); then
            echo export "$variable"
        fi
    else
        typeset valueOfVariable=$(eval echo "$(printf "$%s" "$variable")")
        case $valueOfVariable in
            ${value}${separator}*|*${separator}${value}${separator}*|*${separator}${value}|$value)
                typeset newValue=$(echo "${valueOfVariable}" | perl -p -e "s#${separator}${value}|^${value}${separator}?##g")
                if (( DEBUG_DEVEL )); then
                    echo eval "$variable=$newValue" >&2
                fi
                eval "$variable=$newValue"
                # shellcheck disable=SC2163
                export "$variable"
                if (( DEBUG_DEVEL )); then
                    echo export "$variable"
                fi
                ;;
        esac
    fi
} #}}}
