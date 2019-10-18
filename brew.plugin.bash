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
    alias brewp='brew pin'
    alias brews='brew list -1'
    alias brewsp='brew list --pinned'

    # Formulae
    alias bubo='brew update && brew outdated'
    alias bubc='brew upgrade && brew cleanup'
    alias bubu='bubo && bubc'
    # install & uninstall
    alias bri='brew install'
    alias brfi=bri
    alias bru='brew uninstall'
    alias brfu=bru

    # Casks
    alias bubco='brew update && brew cask outdated'
    alias bcrbc='brew cask reinstall $(brew cask outdated) && brew cleanup'
    alias bcupbc='brew cask upgrade --greedy && brew cleanup'
    alias bubcu='bcubco && bcrbc'
    #
    alias brci='brew cask install'
    alias brcu='brew cask uninstall'

    # brew upgrade all
    alias bruall='bubu; bcupbc'

    alias brs='brew search'
    alias brsd='brew search --desc'

    for completion in /usr/local/etc/bash_completion.d/*; do
        if [[ -f "$completion" ]]; then
            if [[ "$completion" =~ completion.bash$ ]]; then
                continue
            fi
#             DEBUG $completion
            source $completion
        fi
    done

#     function brew() {
#         echo "+ brew $@" >&2
#         command brew $@
#     }
fi

