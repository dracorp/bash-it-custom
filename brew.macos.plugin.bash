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
    alias brp='brew pin'
    alias brl='brew list -1'
    alias brlp='brew list --pinned'

    # Formulae
    alias bubo='brew update && brew outdated'
    alias bubc='brew upgrade && brew cleanup'
    alias bubu='bubo && bubc'
    # install & uninstall
    alias bri='brew install'
    alias brI='brew info'
    alias bru='brew uninstall'

    # Casks
#     alias bubco='brew update && brew cask outdated'
#     alias bcrbc='brew cask reinstall $(brew cask outdated) && brew cleanup'
#     alias bcupbc='brew cask upgrade --greedy && brew cleanup'
#     alias bubcu='bcubco && bcrbc'
    #
    alias brci='brew install --cask'
    alias brcu='brew uninstall --cask'

    # brew upgrade all
#     alias bruall='bubu; bcupbc'
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

    for completion in /usr/local/etc/bash_completion.d/*; do
        if [[ -f "$completion" ]]; then
            if [[ "$completion" =~ completion.bash$ ]]; then
                continue
            fi
            source $completion
        fi
    done

#     function brew() {
#         echo "+ brew $*" >&2
#         command brew "$@"
#     }
#     brew() {
#         local _red _reset
#         _red="[1;31m"
#         _reset="[0m"
#         if [[ "$1" =~ ^remove|rm|uninstall$ ]]; then
#             shift 1
#             if [[ -d "/usr/local/Cellar/$1" ]]; then
#                 command brew rm "$@"
#             elif [[ -d "/usr/local/Caskroom/$1" ]]; then
#                 command brew rm  --cask"$@"
#             else
#                 printf "%b\n" "${_red}Error:${_reset} No such keg nor Cask $1 installed"
#             fi
#         else
#             command brew "$@"
#         fi
#     }
fi

export HOMEBREW_INSTALL_BADGE="☕️ 🐸"

