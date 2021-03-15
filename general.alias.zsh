# For sudo-ing aliases
# https://wiki.archlinux.org/index.php/Sudo#Passing_aliases
alias sudo='sudo '

# Others
# alias halt='sudo halt'
# alias reboot='sudo reboot'
alias ssu='sudo su -'

alias locate-u='locate -d ~/.locate/home.db'
alias updatedb-u='updatedb -U /home/dracorp -o ~/.locate/home.db -l 0'

# 2screen
# alias slrn-screen='2screen slrn -s "Sesja slrn"'

alias pman='LANG=pl_PL.UTF-8 man'
alias eman='LANG=en_GB man'


#devtodo
# if [[ -x /usr/bin/todo ]]; then
#     alias tda='tda -G'
#     alias tdd='tdd -G'
#     alias tde='tde -G'
#     alias tdr='tdr -G'
#     alias todo='todo -G'
# fi

# if which winetricks &>/dev/null; then
#     alias winetricks='GNOME_DESKTOP_SESSION_ID=1 winetricks'
# fi

if which ipcalc &>/dev/null; then
    alias ipcalc='ipcalc -n'
fi

if which dcfldd &>/dev/null; then
    alias dd=dcfldd
fi

#--show-nonprinting'
alias cat='cat -v'
