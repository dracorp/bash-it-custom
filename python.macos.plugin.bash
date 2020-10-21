unset SSL_CERT_FILE REQUESTS_CA_BUNDLE VIRTUALENVWRAPPER_PYTHON PYENV_ROOT PYTHONWARNINGS

# Python@3.7
# User installation, --user
PYTHON_MAJOR_VERSION=$(python3 --version 2>&1 | awk -F'[. ]' '{ print $2"."$3}')
# shellcheck source=/Users/u537501/Library/Python/3.7/bin/
_add2env PATH "$HOME/Library/Python/$PYTHON_MAJOR_VERSION/bin"
_add2env PATH=+/usr/local/opt/python@3.7/bin

export PYTHONPATH
# shellcheck source=/Users/u537501/Library/Python/3.7/lib/
_add2env PYTHONPATH $HOME/Library/Python/$PYTHON_MAJOR_VERSION/lib/

pathmunge "$PYENV_ROOT/bin"

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

_add2env PATH ~/.local/bin
function pip() {
  if [[ "$1" == "install" ]]; then
    shift 1
    command pip3 install --user "$@"
  else
    command pip3 "$@"
  fi
}

## python@3.7
:<<'EOF'
Python has been installed as
  /usr/local/opt/python@3.7/bin/python3

Unversioned symlinks `python`, `python-config`, `pip` etc. pointing to
`python3`, `python3-config`, `pip3` etc., respectively, have been installed into
  /usr/local/opt/python@3.7/libexec/bin

You can install Python packages with
  /usr/local/opt/python@3.7/bin/pip3 install <package>
They will install into the site-package directory
  /usr/local/lib/python3.7/site-packages

See: https://docs.brew.sh/Homebrew-and-Python

python@3.7 is keg-only, which means it was not symlinked into /usr/local,
because this is an alternate version of another formula.

If you need to have python@3.7 first in your PATH run:
  echo 'export PATH="/usr/local/opt/python@3.7/bin:$PATH"' >> /Users/u537501/.bash_profile

For compilers to find python@3.7 you may need to set:
  export LDFLAGS="-L/usr/local/opt/python@3.7/lib"

For pkg-config to find python@3.7 you may need to set:
  export PKG_CONFIG_PATH="/usr/local/opt/python@3.7/lib/pkgconfig"
EOF
