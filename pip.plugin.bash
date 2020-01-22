_add2env PATH ~/.local/bin
function pip() {
  if [[ "$1" == "install" ]]; then
    shift 1
    command pip3 install --user "$@"
  else
    command pip3 "$@"
  fi
}
