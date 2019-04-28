# overwrite the function
function k8s_context_prompt {
    local kube_namespace
    kube_namespace="$(kubectl config view --minify --output 'jsonpath={..namespace}' 2>/dev/null)"
    # Set namespace to 'default' if it is not defined
    kube_namespace="${kube_namespace:-default}"
    echo -e "$(kubectl config current-context):${kube_namespace}"
}

# unalias some default aliases
if alias q &>/dev/null; then
  unalias q
fi
if alias cls &>/dev/null; then
  unalias cls
fi
if alias k &>/dev/null; then
    unalias k
fi
