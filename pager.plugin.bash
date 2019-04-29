# vim as pager
PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
    vim -R \
    -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\" \
    -c 'set nonumber' \
    -c 'set nofoldenable'"
# PAGER=less
PAGER=vimpager
export PAGER

