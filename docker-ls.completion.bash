if command -v docker-ls &>/dev/null; then
    source <(docker-ls autocomplete bash)
fi
