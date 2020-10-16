# overwrite from $BASH_IT/themes/base.theme.bash
k8s_context_prompt() {
    if which kubectl &>/dev/null; then
        local kube_namespace=''
        kube_namespace="$(command kubectl config view --minify --output 'jsonpath={..namespace}' 2>/dev/null)"
        if [[ $? -eq 0 ]]; then
            if [ -z "$kube_namespace" ]; then
                kube_namespace='default'
            fi
            echo -e "$(command kubectl config current-context 2>/dev/null):${kube_namespace}"
        fi
    fi
}

azure_context_prompt() {
    if type jq > /dev/null && [[ -f ~/.azure/azureProfile.json ]]; then
        AZURE_CURRENT_SUBSCRIPTION=$(jq -r '.subscriptions[] | select(.isDefault==true) | .name' ~/.azure/azureProfile.json)
    else
        AZURE_CURRENT_SUBSCRIPTION=''
    fi
    echo "$AZURE_CURRENT_SUBSCRIPTION"
}

# \u2601
AZURE_CONTEXT_THEME_CHAR=${POWERLINE_AZURE_CONTEXT_CHAR:="☁ "}
AZURE_CONTEXT_THEME_PROMPT_COLOR=${POWERLINE_AZURE_CONTEXT_COLOR:=30}
HOST_THEME_PROMPT_COLOR=${POWERLINE_HOST_COLOR:=10}

__powerline_azure_context_prompt() {
    local azure_context=''
    if _command_exists jq; then
        azure_context=$(azure_context_prompt)
    fi
    if [[ -n "$azure_context" ]]; then
        echo "${AZURE_CONTEXT_THEME_CHAR}${azure_context}|${AZURE_CONTEXT_THEME_PROMPT_COLOR}"
    fi
#         local azure_prompt="${bold_white}\u2601 Azure: ${normal}${AZURE_CURRENT_SUBSCRIPTION}"
#         echo -e "${azure_prompt}"
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
