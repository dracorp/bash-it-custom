basher-update-all() {
    if _command_exists basher ; then
        cd ~/.basher
        git pull
        basher outdated | xargs -I{} bash -c "echo Upgrading {}; basher upgrade {}"
    fi
}
