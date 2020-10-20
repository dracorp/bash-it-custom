if which go &>/dev/null; then
    eval $(go env | sed 's/^/export /')
    export GOBIN=$GOPATH/bin
    _add2env PATH $GOPATH/bin
fi
