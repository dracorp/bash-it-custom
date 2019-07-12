if which kubectl &>/dev/null; then
    if [[ -n $(basher package-path ahmetb/kubectl-aliases) ]]; then
        . $(basher package-path ahmetb/kubectl-aliases)/.kubectl_aliases
    fi

    alias kswitch='kubectl config use-context'
    alias knamespace='kubectl config set-context `kubectl config current-context` --namespace'

    # get all services with in a cluster and the nodePorts they use (if any)
    alias ksvc="kubectl get --all-namespaces svc -o json | jq -r '.items[] | [.metadata.name,([.spec.ports[].nodePort | tostring ] | join(\"|\"))] | @csv'"
    # shortcuts for frequent kubernetes commands
    alias kpods="kubectl get po"
    alias kinspect="kubectl describe"
    function krun() { name=$1; shift; image=$1; shift; kubectl run -it --generator=run-pod/v1 --image $image $name -- $@; }
    function klogs() { kubectl logs $*;}
    function kexec(){ pod=$1; shift; kubectl exec -it $pod -- $@; }

    kpodst() {
        local jsonpath='{range .items[*]}{"\n"}{@.metadata.name}{range @.status.conditions[*]}{"\t"}{@.type}={@.status}{end}{end}'
        kubectl get po -Ao jsonpath="$jsonpath" | column -t
    }

    # https://docs.microsoft.com/en-us/azure/aks/use-pod-security-policies
    alias kubectl-admin='kubectl --namespace u537501'
    alias kubectl-nonadminuser='kubectl --as=system:serviceaccount:u537501:noadmin-user --namespace u537501'

    # kubectl create serviceaccount --namespace=u537501 noadmin-user
    # kubectl create rolebinding --namespace=u537501 aks-editor --clusterrole=edit --serviceaccount=u537501:noadmin-user
    # kubectl-nonadminuser apply -f nginx-unprivileged.yaml
    # kubectl-nonadminuser describe pod nginx-unprivileged

    alias k=kubectl
    if [[ $(type -t compopt) = "builtin" ]]; then
        complete -o default -F __start_kubectl k
    else
        complete -o default -o nospace -F __start_kubectl k
    fi

#     function kubectl() {
#         echo "+ kubectl $@" 1>&2
#         command kubectl $@
#     }
fi
