# git theming
SCM_THEME_PROMPT_DIRTY="${bold_red} ✗${reset_color}"
SCM_THEME_PROMPT_CLEAN="${green} ✓${reset_color}"
SCM_THEME_PROMPT_PREFIX=" ("
SCM_THEME_PROMPT_SUFFIX=")"
# SCM_GIT_SHOW_CURRENT_USER=true
SCM_GIT_SHOW_REMOTE_INFO=${SCM_GIT_SHOW_REMOTE_INFO:=true}

function _git-remote-info {
  [[ "$(_git-upstream)" == "" ]] && return

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
    local EXIT_COLOR USER_COLOR

    if [ "$(whoami)" = root ]; then no_color=$red; else no_color=$white; fi

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
    prompt+="\u${white}@\H${normal}:\w ${white}"
    prompt+="$(scm_prompt_info)"
    prompt+=" | ${white_bold}EXIT: ${EXIT_COLOR}${EXIT}${normal}\n"
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

safe_append_prompt_command prompt_command
