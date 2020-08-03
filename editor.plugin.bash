exec 3>&1
exec 1>/dev/null
# if command -v nvim; then
#     export EDITOR=nvim
# elif command -v vim; then
    export EDITOR=vim
# fi
exec 1>&3
exec 3>&-
