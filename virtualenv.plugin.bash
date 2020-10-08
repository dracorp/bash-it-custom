export PYENV_ROOT="$HOME/.pyenv"
#Load pyenv virtualenv if the virtualenv plugin is installed.
if which pyenv-virtualenv-init &>/dev/null; then
    if which pyenv &>/dev/null; then
        eval "$(pyenv init - bash)"
        eval "$(pyenv virtualenv-init -)"
    fi
fi
