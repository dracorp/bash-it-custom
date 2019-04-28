aur-add-remote-origin() {
    local remoteGitUrl
    if [ ! -d .git ]; then
        echo "You aren't inside the root of Git repository." >&2
        return 1
    fi
    remoteGitUrl=`git remote -v 2>/dev/null`
    if [[ $? == 128 ]]; then
        echo "Missing git repository. I make them in the current directory"
        git init
        echo "Done"
    fi
    remoteGitUrl=`echo $remoteGitUrl | awk '/origin/ {if (NR == 1) print $2}'`
    if [ -n "$remoteGitUrl" ]; then
        echo "Package has already defined remote url for git repository: '$remoteGitUrl'"
        return
    fi

    local packageName baseRemoteUrl
    packageName=`basename $PWD`
    baseRemoteUrl='ssh://aur@aur.archlinux.org'
    remoteGitUrl="${baseRemoteUrl}/${packageName}.git"
    echo "Adding remote url '$remoteGitUrl' as origin"
    git remote add origin $remoteGitUrl
}
