# git theming
# SCM_THEME_PROMPT_DIRTY="${bold_red} x${reset_color}"
# SCM_THEME_PROMPT_CLEAN="${green} v${reset_color}"
# SCM_THEME_PROMPT_PREFIX=" |"
# SCM_THEME_PROMPT_SUFFIX="| "
# SCM_THEME_BRANCH_TRACK_PREFIX=' > '
# SCM_THEME_BRANCH_GONE_PREFIX=' < '
# SCM_THEME_CURRENT_USER_PREFFIX=' :) '
# SCM_GIT_AHEAD_CHAR="^"
# SCM_GIT_BEHIND_CHAR="v"

function _git-remote-info {
  [[ "$(_git-upstream)" == "" ]] && return || true

  local same_branch_name=false
#   [[ "$(_git-branch)" == "$(_git-upstream-branch)" ]] && local same_branch_name=true
  if ([[ "${SCM_GIT_SHOW_REMOTE_INFO}" = "auto" ]] && [[ "$(_git-num-remotes)" -ge 2 ]]) ||
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

function prompt_command() {
    local EXIT="$?"             # This needs to be first
    local PS1_WORKDIR="\w"
    local PS1_HOSTNAME="\H"
    local PS1_USER="\u"


    if [ $EUID -ne 0 ]; then
        prompt="${green}"
    else
        prompt="${orange}"
    fi
    if [ $EXIT != 0 ]; then
        prompt_color=$bold_red
    else
        prompt_color=$green
    fi
    prompt+="${PS1_USER}${normal}@${bold_white}${PS1_HOSTNAME}${normal}:${PS1_WORKDIR}${white}"
    prompt+=" $(__kube_ps1)"
    if [[ $(uname) == @(Linux|Darwin) ]]; then
        prompt+=" $(scm_prompt_info)"
    fi
    # exit code
    prompt+="\n${prompt_color}${EXIT}${normal} "
    # type of user
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
    if which kubectl &>/dev/null; then
        CONTEXT=$(kubectl config current-context)
        NAMESPACE=$(kubectl config view -o jsonpath="{.contexts[?(@.name==\"${CONTEXT}\")].context.namespace}")
        if [ -z "$NAMESPACE" ]; then
            NAMESPACE="default"
        fi
        if [ -n "$CONTEXT" ]; then
            case "$CONTEXT" in
            *prod*)
                echo "${red}⎈ ${CONTEXT}:${NAMESPACE}${normal}"
                ;;
            *test*)
                echo "${yellow}⎈ ${CONTEXT}:${NAMESPACE}${normal}"
                ;;
            *)
                echo "${normal}⎈ ${CONTEXT}:${NAMESPACE}${normal}"
                ;;
            esac
        fi
    fi
}

# export PROMPT_COMMAND='PS1="${GREEN}${PS1_USER}@${PS1_HOSTNAME}${NORMAL}:$(__kube_ps1)${BLUE}${PS1_WORKDIR}${NORMAL}\$ "'
safe_append_prompt_command prompt_command
