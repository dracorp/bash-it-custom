# export PYTHONHTTPSVERIFY=0

## User installation, --user
# _add2env PATH $HOME/Library/Python/2.7/bin
_add2env PATH $HOME/Library/Python/3.7/bin

export PYTHONPATH
_add2env PYTHONPATH /Users/u537501/Library/Python/3.7/lib/
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3

export PYENV_ROOT="$HOME/.pyenv"
pathmunge "$PYENV_ROOT/bin"

if which pyenv &>/dev/null; then
    eval "$(pyenv init - bash)"
fi
