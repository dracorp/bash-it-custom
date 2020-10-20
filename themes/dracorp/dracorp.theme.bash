# for non-unicode
# SCM_THEME_PROMPT_DIRTY="${bold_red} x${reset_color}"
# SCM_THEME_PROMPT_CLEAN="${green} v${reset_color}"
# for unicode
SCM_THEME_PROMPT_DIRTY="${bold_red} ✗${reset_color}"
SCM_THEME_PROMPT_CLEAN="${green} ✓${reset_color}"
# SCM_GIT_SHOW_CURRENT_USER=true
SCM_GIT_SHOW_REMOTE_INFO=${SCM_GIT_SHOW_REMOTE_INFO:=true}
SCM_THEME_PROMPT_PREFIX="| ${bold_white}Git:${normal}"
SCM_THEME_PROMPT_SUFFIX=""
# SCM_THEME_BRANCH_TRACK_PREFIX=' > '
# SCM_THEME_BRANCH_GONE_PREFIX=' < '
# SCM_THEME_CURRENT_USER_PREFFIX=' :) '
# SCM_GIT_AHEAD_CHAR="^"
# SCM_GIT_BEHIND_CHAR="v"

_git-remote-info() {
  [[ "$(_git-upstream)" == "" ]] && return || true

  local same_branch_name=false
  if ( [[ "${SCM_GIT_SHOW_REMOTE_INFO}" = "auto" ]] && [[ "$(_git-num-remotes)" -ge 2 ]] ) ||
      [[ "${SCM_GIT_SHOW_REMOTE_INFO}" = "true" ]]; then
    if [[ "${same_branch_name}" != "true" ]]; then
      remote_info="\$(_git-upstream)"
    else
      remote_info="$(_git-upstream-remote)"
    fi
  elif [[ ${same_branch_name} != "true" ]]; then
    remote_info="\$(_git-upstream-branch)"
  fi
  if [[ -n "${remote_info}" ]];then
    local branch_prefix
    if _git-upstream-branch-gone; then
      branch_prefix="${SCM_THEME_BRANCH_GONE_PREFIX}"
    else
      branch_prefix="${SCM_THEME_BRANCH_TRACK_PREFIX}"
    fi
    echo "${branch_prefix}${remote_info}"
  fi
}

prompt_command() {
    local EXIT="$?"             # This needs to be first
    local EXIT_COLOR USER_COLOR
    PS1_WORKDIR="\w"
    PS1_HOSTNAME="\H"
    PS1_USER="\u"

    if [ $EUID -ne 0 ]; then
        USER_COLOR="${green}"
    else
        USER_COLOR="${red}"
    fi
    if [ $EXIT != 0 ]; then
        EXIT_COLOR=$bold_red
    else
        EXIT_COLOR=$green
    fi
    prompt="$USER_COLOR"
    prompt+="${PS1_USER}${normal}@${bold_white}${PS1_HOSTNAME}${normal}:${PS1_WORKDIR}${white}"
    prompt+="$(__kube_ps1)"
    prompt+="$(__azure_ps1)"
    if [[ $(uname) =~ Linux|Darwin ]]; then
        prompt+=" $(scm_prompt_info)"
    fi
    prompt+=" | ${bold_white}EXIT:${EXIT_COLOR}${EXIT}${normal} "
    prompt+="\n"
    if [ $EUID -ne 0 ]; then
        prompt+='$'
    else
        prompt+='#'
    fi
    prompt+=" "

    PS1="$prompt"
    PS2='continue> '
    PS3='choose: '
    PS4='|${BASH_SOURCE} ${LINENO}${FUNCNAME[0]:+ ${FUNCNAME[0]}()}|  '
}

__kube_ps1() {
    if command -v kubectl &>/dev/null && [[ -f ~/.kube/config ]]; then
        if command -v yq &>/dev/null; then
            CURRENT_CONTEXT=$(yq read ~/.kube/config current-context)
            VIA_NAMESPACE=$(yq read ~/.kube/config 'contexts[*].context' | grep -w "$CURRENT_CONTEXT" -A1 | awk '/namespace/ {print $2}')
        else
            CURRENT_CONTEXT=$(kubectl config current-context)
            VIA_NAMESPACE=$(kubectl config view -o jsonpath="{.contexts[?(@.name==\"${CURRENT_CONTEXT}\")].context.namespace}")
        fi
        local kube_prompt="${bold_white}\u2388 K8s: ${normal}${CURRENT_CONTEXT}:${VIA_NAMESPACE}"
        if [ -n "$CURRENT_CONTEXT" ]; then
            case "$CURRENT_CONTEXT" in
            *prod*)
                echo -e " | ${red}${kube_prompt}${normal}"
                ;;
            *test|dev*)
                echo -e " | ${yellow}${kube_prompt}${normal}"
                ;;
            *)
                echo -e " | ${normal}${kube_prompt}${normal}"
                ;;
            esac
        fi
    fi
}
__azure_ps1() {
    if command -v jq &>/dev/null && [[ -f ~/.azure/azureProfile.json ]]; then
        AZURE_CURRENT_SUBSCRIPTION=$(jq -r '.subscriptions[] | select(.isDefault==true) | .name' ~/.azure/azureProfile.json)
    else
        AZURE_CURRENT_SUBSCRIPTION='Unknown!'
    fi
    if [ -z "$VIA_NAMESPACE" ]; then
        VIA_NAMESPACE="default"
    fi
    local azure_prompt="${bold_white}\u2601 Azure: ${normal}${AZURE_CURRENT_SUBSCRIPTION}"
    echo -e " | ${azure_prompt}"

}
# export PROMPT_COMMAND='PS1="${GREEN}${PS1_USER}@${PS1_HOSTNAME}${NORMAL}:$(__kube_ps1)${BLUE}${PS1_WORKDIR}${NORMAL}\$ "'
safe_append_prompt_command prompt_command
