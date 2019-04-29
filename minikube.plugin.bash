alias minikube2docker='eval $(minikube docker-env)'
# generates:
# export DOCKER_TLS_VERIFY="1"
# export DOCKER_HOST="tcp://192.168.99.106:2376"
# export DOCKER_CERT_PATH="/Users/u537501/.minikube/certs"
# export DOCKER_API_VERSION="1.35"
# Run this command to configure your shell:
# eval $(minikube docker-env)

alias minikube2docker-enable='eval $(minikube docker-env)'
alias minikube2docker-disable='eval $(minikube docker-env -u)'
# generates:
# unset DOCKER_TLS_VERIFY
# unset DOCKER_HOST
# unset DOCKER_CERT_PATH
# unset DOCKER_API_VERSION
# Run this command to configure your shell:
# eval $(minikube docker-env)
