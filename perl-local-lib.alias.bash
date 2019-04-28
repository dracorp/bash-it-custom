#!/usr/bin/env  bash
__perl-local-lib() {
  local local_directory="${1:-$HOME/perl5/local-lib}"
  local alias_name="${2:-pll}"
  case $1 in
    -h|--help)
      printf '%s\n' "Usage: ${FUNCNAME[0]} [directory for local::lib] [alias name]"
      return;;
  esac

  if perl -I${local_directory}/lib/perl5 -Mlocal::lib=${local_directory} &>/dev/null; then
    alias ${alias_name}="$(printf '%s\n' "eval \"\$(perl -I${local_directory}/lib/perl5 -Mlocal::lib=${local_directory})\"")"
  fi
}
