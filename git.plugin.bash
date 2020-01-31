export GIT_CEILING_DIRECTORIES="$HOME"
function gi() {
    curl -skL "https://www.gitignore.io/api/$*"
}
if [[ -d /usr/local/opt/git-gui/bin ]]; then
    _add2env PATH "/usr/local/opt/git-gui/bin"
fi
