if [[ $SHELL =~ bash ]]; then
    # local Bash completion
    if [[ -d $HOME/.bash_completion.d ]]; then
        for i in $HOME/.bash_completion.d/*; do
            . $i
        done
    fi
fi
