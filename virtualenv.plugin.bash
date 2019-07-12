#Load pyenv virtualenv if the virtualenv plugin is installed.
if which pyenv-virtualenv-init &>/dev/null; then
    eval "$(pyenv virtualenv-init -)"
fi
