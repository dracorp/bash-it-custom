# Settings for powerline themes
AZURE_CONTEXT_THEME_CHAR=${POWERLINE_AZURE_CONTEXT_CHAR:="☁ "}
AZURE_CONTEXT_THEME_PROMPT_COLOR=${POWERLINE_AZURE_CONTEXT_COLOR:=30}
# HOST_THEME_PROMPT_COLOR=${POWERLINE_HOST_COLOR:=10}
HOST_THEME_PROMPT_COLOR=30
POWERLINE_COMPACT=1
if [[ $EUID -eq 0 ]]; then
    PROMPT_CHAR='#'
else
    PROMPT_CHAR='$'
fi

# overwrite from $BASH_IT/themes/base.theme.bash
k8s_context_prompt() {
    if _command_exists kubectl; then
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
    local AZURE_CURRENT_SUBSCRIPTION=''
    if _command_exists jq && [[ -f ~/.azure/azureProfile.json ]]; then
        AZURE_CURRENT_SUBSCRIPTION=$(command jq -r '.subscriptions[]? | select(.isDefault==true) | .name' ~/.azure/azureProfile.json)
    fi
    echo "$AZURE_CURRENT_SUBSCRIPTION"
}

__powerline_k8s_prompt() {
    __powerline_k8s_context_prompt "$@"
}

__powerline_azure_context_prompt() {
    local azure_context=''
    azure_context=$(azure_context_prompt)
    if [[ -n "$azure_context" ]]; then
        echo "${AZURE_CONTEXT_THEME_CHAR}${azure_context}|${AZURE_CONTEXT_THEME_PROMPT_COLOR}"
    fi
#         local azure_prompt="${bold_white}\u2601 Azure: ${normal}${AZURE_CURRENT_SUBSCRIPTION}"
#         echo -e "${azure_prompt}"
}

__powerline_azure_prompt() {
    __powerline_azure_context_prompt "$@"
}

# Helper function loading various enable-able files
_load_bash_it_files() {

#     subdirectory="$1"

#     if [ ! -d "${BASH_IT}/enabled" ]; then
#         continue
#     fi
    FILES="${BASH_IT}/enabled/*.bash ${BASH_IT}/custom/*.bash"
    for config_file in $FILES; do
        echo ${config_file}

        if [ -e "${config_file}" ]; then
            time source $config_file
        fi
    done
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
if alias nu &>/dev/null; then
    unalias nu
fi
