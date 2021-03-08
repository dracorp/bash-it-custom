if command -v docker-ls &>/dev/null; then
    source <(docker-ls autocomplete zsh)
fi
