export GIT_CEILING_DIRECTORIES="$HOME"
function gi() {
    curl -skL "https://www.gitignore.io/api/$*"
}
