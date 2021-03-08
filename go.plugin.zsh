if which go &>/dev/null; then
    eval $(go env | sed 's/^/export /')
    export GOBIN=$GOPATH/bin
    path+=$GOPATH/bin
fi
