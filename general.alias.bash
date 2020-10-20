# For sudo-ing aliases
# https://wiki.archlinux.org/index.php/Sudo#Passing_aliases
alias sudo='sudo '
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias curl='\curl -k'

alias pman='LANG=pl_PL.UTF-8 man'
alias eman='LANG=en_GB man'

# access to history via c-p or arrows
# alias __A=`echo "\020"` # ^p up
# alias __B=`echo "\016"` # ^n down
# alias __C=`echo "\006"` # ^f forward character
# alias __D=`echo "\002"` # ^b back character
# alias __H=`echo "\001"` # ^a start of line
# alias __Y=`echo "\005"` # ^e end of line


alias h='fc -l' #history
alias j='jobs'
alias wget='wget --content-disposition'

if which ipcalc &>/dev/null; then
    alias ipcalc='ipcalc -n'
fi

[ -x /usr/bin/dcfldd ] && alias dd=dcfldd

#--show-nonprinting'
alias cat='cat -v'
