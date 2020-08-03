unset SSL_CERT_FILE REQUESTS_CA_BUNDLE VIRTUALENVWRAPPER_PYTHON PYENV_ROOT PYTHONWARNINGS

# _add2env PATH=+/usr/local/bin
# User installation, --user
PYTHON_MAJOR_VERSION=$(python --version | awk -F'[. ]' '{ print $2"."$3}')
_add2env PATH $HOME/Library/Python/$PYTHON_MAJOR_VERSION/bin

export PYTHONPATH
_add2env PYTHONPATH $HOME/Library/Python/$PYTHON_MAJOR_VERSION/lib/
# export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3

export PYENV_ROOT="$HOME/.pyenv"
pathmunge "$PYENV_ROOT/bin"

if which pyenv &>/dev/null; then
    eval "$(pyenv init - bash)"
    eval "$(pyenv virtualenv-init -)"
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
