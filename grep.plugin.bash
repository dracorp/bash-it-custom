# GNU grep
if [[ -x $(which ggrep 2>/dev/null) ]]; then
    alias egrep='\ggrep -E --color=auto'
    alias fgrep='\ggrep -F --color=auto'
    alias ggrep='\ggrep --color=auto'
    alias grep='\ggrep --color=auto'
else
    alias egrep='\grep -E --color=auto'
    alias fgrep='\grep -F --color=auto'
    alias ggrep='\grep --color=auto'
    alias grep='\grep --color=auto'
fi
# export GREP_COLOR='1;31'
export GREP_COLORS='mt=1;31'
