# by default bash-it does not read *.sh files, only *.bash
get_sh_directory() {
    local SOURCE DIR
    SOURCE="${BASH_SOURCE[0]}"
    while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
        DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
        SOURCE="$(readlink "$SOURCE")"
        [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
    done
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    echo $DIR
}
CUSTOM_DIRECTORY=$(get_sh_directory)
if [[ -n $CUSTOM_DIRECTORY && -d $CUSTOM_DIRECTORY ]]; then
    for sh_file in $CUSTOM_DIRECTORY/*.sh; do
#         echo source $sh_file
        source $sh_file
    done
fi
