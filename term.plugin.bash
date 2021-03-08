# ctrl-s(suspend execution) i ctrl-q
if which stty >/dev/null 2>&1; then
    stty -ixon
fi

export COLORTERM=truecolor
export TERM_ITALICS=true
