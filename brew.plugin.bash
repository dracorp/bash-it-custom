# brew --prefix formula
# brew --cellar formula
if type brew &>/dev/null; then
#     _add2env PATH "/usr/local/sbin"

    # brew install, brew upgrade and brew reinstall will never automatically cleanup installed/upgraded/reinstalled formulae or all formulae every HOMEBREW_CLEANUP_PERIODIC_FULL_DAYS day
    export HOMEBREW_NO_INSTALL_CLEANUP=1
    # do not automatically update before running some commands
    export HOMEBREW_NO_AUTO_UPDATE=1
    # do not send analytics
    export HOMEBREW_NO_ANALYTICS=1
    # Use this directory to store log files
    export HOMEBREW_LOGS=$HOME/log
    # Print this text before the installation summary of each successful build.
    export HOMEBREW_INSTALL_BADGE="☕️ 🐸"
    # use bat for brew cat
    export HOMEBREW_BAT=1
    # use Bootsnap to speed up repeated brew calls
    export HOMEBREW_BOOTSNAP=1
    # print install times for each formula at the end of the run
    export HOMEBREW_DISPLAY_INSTALL_TIMES=1
    # pass --verbose when invoking curl
    # export HOMEBREW_CURL_VERBOSE=1
    # Use this directory as the download cache
    # HOMEBREW_CACHE=~/Library/Caches/Homebrew
    # Trusting homebrew casks
    export HOMEBREW_CASK_OPTS="--no-quarantine
        --appdir=~/Applications
        --colorpickerdir=~/Library/ColorPickers
        --prefpanedir=~/Library/PreferencePanes
        --qlplugindir=~/Library/QuickLook
        --mdimporterdir=~/Library/Spotlight
        --dictionarydir=~/Library/Dictionaries
        --fontdir=~/Library/Fonts
        --servicedir=~/Library/Services
        --input-methoddir=~/Library/Input\ Methods
        --internet-plugindir=~/Library/Internet\ Plug-Ins
        --audio-unit-plugindir=~/Library/Audio/Plug-Ins/Components
        --vst-plugindir=~/Library/Audio/Plug-Ins/VST
        --vst3-plugindir=~/Library/Audio/Plug-Ins/VST3
        --screen-saverdir=~/Library/Screen\ Savers
        --language=pl,en
        "
    # enable runtime typechecking using Sorbet
    export HOMEBREW_SORBET_RUNTIME=1
    # always assume --verbose when running commands
#     export HOMEBREW_VERBOSE=1
    # verbose output will print a . no more than once a minute. This can be useful to avoid long-running Homebrew commands being killed due to no output
#     export HOMEBREW_VERBOSE_USING_DOTS=1
    # Evaluate all available formulae and casks, whether installed or not, to:
    # - search their descriptions: search, desc, info, readall, tap, audit,
    # unbottled
    # - print their JSON
    export HOMEBREW_EVAL_ALL=1

    # Aliases
    alias br='brew'
#     alias brl='brew list -1'
#     alias brlp='brew list --pinned'

    # install & uninstall
    alias bri='brew install'
#     alias brI='brew info'
    alias bru='brew uninstall'

    # Aliases https://github.com/Homebrew/homebrew-aliases
    # /Users/u537501/.brew-aliases/
#     brew alias show=info
#     brew alias p=info
#
#     brew alias i=install
#     brew alias u=uninstall
#     brew alias r=reinstall
#
#     brew alias update-all
#
#     brew alias s=search
#     brew alias se=search
#
#     brew alias l=list
#     brew alias l1='list -1'
#     brew alias lp='list --pinned'

# built-in
# brew up = update

#     alias brs='brew search'
#     alias brsd='brew search --desc'

    # brew upgrade all
#     function bruall { #{{{
#         INFO "Fetch the newest version of Homebrew and all formulae from GitHub"
#         brew update
#         INFO "List installed formulae that have an updated version available."
#         brew outdated --greedy
#         INFO "List the outdated installed Casks"
#         INFO "Upgrade outdated, unpinned formulae using the same options they were originally
# installed with, plus any appended brew formula options."
#         brew upgrade
#         INFO "Upgrades all outdated casks"
#         brew upgrade --cask --greedy
#         INFO "Remove stale lock files and outdated downloads for all formulae and casks, and remove old versions of installed formulae."
#         brew cleanup --prune=all
#     } #}}}

fi

