unset SSL_CERT_FILE REQUESTS_CA_BUNDLE VIRTUALENVWRAPPER_PYTHON PYENV_ROOT PYTHONWARNINGS

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
if [ -r /etc/ssl/certs/CACompany.pem ]; then
    : nop
#     export SSL_CERT_FILE=/etc/ssl/certs/CACompany.pem
    # for decryption, MITM
    # it conflicts with az command
#     export REQUESTS_CA_BUNDLE=/etc/ssl/certs/CACompany.pem
fi
# export PYTHONWARNINGS="ignore"
# for decryption, MITM
# export PYTHONHTTPSVERIFY=0
alias pip=pip3
