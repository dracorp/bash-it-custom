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

export TMOUT=
# _rm4env /usr/local/bin
# _add2env PATH=+/usr/local/bin

if ((BASH_VERSINFO[0] >= 4)) && ((BASH_VERSINFO[1] >= 2)); then
    shopt -s direxpand
fi

