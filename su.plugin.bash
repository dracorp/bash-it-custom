if [ -n "$BASH_VERSION" ] && [ "${BASH_VERSINFO[0]}" -eq 4 ]; then
    unset command_not_found_handle
    command_not_found_handle() {
        printf "bash: %s: command not found\n" "$1"
        case $1 in
            su-*)
                _user=$( echo "$1" | sed 's/^su-//' )
                if id "$_user" 1>/dev/null 2>&1; then
                    INFO "I'm trying command su-${_user} which refers to ssh ${_user}@$(hostname)..."
                    LIBPATH= ssh "${_user}@$(hostname)"
                    return 0
                else
                    ERROR "The account for user $_user does not exist"
                    return 127
                fi
                ;;
        esac
    }
fi
