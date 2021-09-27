# brew --prefix formula
# brew --cellar formula
if type brew &>/dev/null; then
    _add2env PATH "/usr/local/sbin"
    export HOMEBREW_NO_INSTALL_CLEANUP=1
    export HOMEBREW_NO_AUTO_UPDATE=1
    export HOMEBREW_NO_ANALYTICS=1
    export HOMEBREW_LOGS=$HOME/log
    # export HOMEBREW_CURL_VERBOSE=1
    # export HOMEBREW_VERBOSE=1
    # HOMEBREW_CACHE=~/Library/Caches/Homebrew

    # Aliases
    alias br='brew'
    alias brl='brew list -1'
    alias brlp='brew list --pinned'

    # install & uninstall
    alias bri='brew install'
    alias brI='brew info'
    alias bru='brew uninstall'

    # brew upgrade all
    function bruall {
        INFO "Fetch the newest version of Homebrew and all formulae from GitHub"
        brew update
        INFO "List installed formulae that have an updated version available."
        brew outdated --greedy
        INFO "List the outdated installed Casks"
        INFO "Upgrade outdated, unpinned formulae using the same options they were originally
installed with, plus any appended brew formula options."
        brew upgrade
        INFO "Upgrades all outdated casks"
        brew upgrade --cask --greedy
        INFO "Remove stale lock files and outdated downloads for all formulae and casks, and remove old versions of installed formulae."
        brew cleanup --prune=all
    }

    alias brs='brew search'
    alias brsd='brew search --desc'
fi

export HOMEBREW_INSTALL_BADGE="☕️ 🐸"

