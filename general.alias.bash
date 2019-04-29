alias rm='rm -i'
alias curl='\curl -k'

# access to history via c-p or arrows
# alias __A=`echo "\020"` # ^p up
# alias __B=`echo "\016"` # ^n down
# alias __C=`echo "\006"` # ^f forward character
# alias __D=`echo "\002"` # ^b back character
# alias __H=`echo "\001"` # ^a start of line
# alias __Y=`echo "\005"` # ^e end of line

#alias cklido='/lido_apps/lido/lido_admin/SYSCheck/check_lido_processes.ksh'
# alias ct='cleartool $*'
# alias mt='multitool $*'

# don't use vi or ex
alias ex='vim'
alias vi='vim'

alias l='ls -F'
alias ls='ls -F'
alias ll='ls -l'
alias la='ls -la'
alias lla='ls -la'

alias h='fc -l' #history
alias j='jobs'

if which less 1>/dev/null 2>&1; then
    alias perldoc='PAGER="less" perldoc'
else
    alias perldoc='PAGER="" perldoc'
fi

# replace cat with vimcat
alias vcat='$HOME/bin/vimcat'

alias lt='ls -lt | head -25'
#--show-nonprinting'
alias cat='cat -v'
