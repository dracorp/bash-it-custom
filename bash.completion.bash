if [[ -d /usr/local/etc/bash_completion.d/ ]]; then
    for completion in /usr/local/etc/bash_completion.d/*; do
#         echo $completion
        . $completion
#         complete -p git
#         if [[ -r "$completion" ]]; then
    #             if [[ "$completion" =~ completion.bash$ ]]; then
    #                 continue
    #             fi
#         fi
    done
fi
