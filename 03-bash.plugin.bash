# use nullglob only in script for syntax like as: man3=(*.3)
shopt -u nullglob

# extended globs
shopt -s extglob
# ?(pattern-list) 0 or 1
# +(pattern-list) 1 or more
# *(pattern-list) 0 or more
# @(pattern-list) 1
# !(pattern-list) none
# patterns in a list are separated by | characters.

# dodawaj do pliku history zamiast go nadpisywac
shopt -s histappend

# ignoruj duplikaty
export HISTCONTROL=ignoredups
# ingoruj wpisy
export HISTIGNORE=' *:exit:cd *'

# max rozmiar pliku historii
# export HISTFILESIZE=20000
# max ilosc pliku history zaladowana do pamieci
# export HISTSIZE=1000

# format daty dla wpisow w history, domyslnie brak, man date
export HISTTIMEFORMAT="%F %T "
