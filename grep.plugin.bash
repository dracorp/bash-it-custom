alias egrep='\egrep --color=auto'
alias fgrep='\fgrep --color=auto'
alias ggrep='\ggrep --color=auto'
# GNU grep
if [[ -x $(which ggrep 2>/dev/null) ]]; then
    alias grep='\ggrep --color=auto'
fi
export GREP_COLOR='1;31'
