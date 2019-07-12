# overwrite from $BASH_IT/themes/base.theme.bash
function k8s_context_prompt {
    if which kubectl &>/dev/null; then
        local kube_namespace
        kube_namespace="$(command kubectl config view --minify --output 'jsonpath={..namespace}' 2>/dev/null)"
        # Set namespace to 'default' if it is not defined
        kube_namespace="${kube_namespace:-default}"
        echo -e "$(command kubectl config current-context 2>/dev/null):${kube_namespace}"
    fi
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
