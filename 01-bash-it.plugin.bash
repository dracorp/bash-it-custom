# overwrite the function
function k8s_context_prompt {
    local kube_namespace
    kube_namespace="$(kubectl config view --minify --output 'jsonpath={..namespace}' 2>/dev/null)"
    # Set namespace to 'default' if it is not defined
    kube_namespace="${kube_namespace:-default}"
    echo -e "$(kubectl config current-context):${kube_namespace}"
}

# Helper function loading various enable-able files
function _load_bash_it_files() {

  subdirectory="$1"

  if [ ! -d "${BASH_IT}/${subdirectory}/enabled" ]
  then
    continue
  fi
  FILES="${BASH_IT}/${subdirectory}/enabled/*.bash"
  for config_file in $FILES
  do
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
