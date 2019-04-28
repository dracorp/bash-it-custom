# For sudo-ing aliases
# https://wiki.archlinux.org/index.php/Sudo#Passing_aliases
alias sudo='sudo '

# Debian
if which apt-cache &>/dev/null; then
	alias apt-sf='apt-cache search'
	alias apt-sn='apt-cache search --names-only'
fi
# (( UID )) && alias apt-sn='sudo ~/bin/skrypty-linki/apt-sn.sh'

# Others
alias halt='sudo halt'
alias reboot='sudo reboot'
alias ssu='sudo su -'
alias glinks='links -g'

alias locate-u='locate -d ~/.locate/home.db'
alias updatedb-u='updatedb -U /home/dracorp -o ~/.locate/home.db -l 0'

# wine
alias dude='env WINEPREFIX=~/.wine.dude wine /home/dracorp/.wine.dude/drive_c/Program\ Files/Dude/dude.exe'

# 2screen
alias slrn-screen='2screen slrn -s "Sesja slrn"'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# LS_OPTIONS='-F --color=auto'
# alias l='ls $LS_OPTIONS -l'
# alias ll='ls $LS_OPTIONS -l'
# alias ls='ls $LS_OPTIONS'

alias pman='LANG=pl_PL.UTF-8 man'
alias eman='LANG=en_GB man'
#alias man='LANG=C man'

# todo
alias todo='todo -G'

#devtodo
if [[ -x /usr/bin/todo ]]; then
	alias tda='tda -G'
	alias tdd='tdd -G'
	alias tde='tde -G'
	alias tdr='tdr -G'
	alias todo='todo -G'
fi

[[ -r /var/log/mail/mail.log ]] && alias maillog='tail -f /var/log/mail/mail.log'


if which winetricks &>/dev/null; then
	alias winetricks='GNOME_DESKTOP_SESSION_ID=1 winetricks'
fi

alias wget='wget --content-disposition'

if which ipcalc &>/dev/null; then
	alias ipcalc='ipcalc -n'
fi

[ -x /usr/bin/dcfldd ] && alias dd=dcfldd

alias h='fc -l' #history
alias j='jobs'
if type -p thefuck &>/dev/null; then
    eval $(thefuck --alias)
fi
alias lt='ls -lt | head -25'
alias cat='cat -v'
