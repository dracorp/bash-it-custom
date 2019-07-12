function gi() {
#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  gi
#   DESCRIPTION:  Install a grunt plugin and save to devDependencies
#    PARAMETERS:
#       RETURNS:
#-------------------------------------------------------------------------------
  npm install --save-dev grunt-"$@"
}

function gci() {
#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  gci
#   DESCRIPTION:  Install a grunt-contrib plugin and save to devDependencies
#    PARAMETERS:
#       RETURNS:
#-------------------------------------------------------------------------------
  npm install --save-dev grunt-contrib-"$@"
}

cdd() {
    local DIR
    if [ -f "$1" ]; then
        DIR=$(dirname "$1")
    elif [ -d "$1" ]; then
        DIR=$1
    fi
    cd $DIR
}

lsmod() {
    local LSMOD
    LSMOD=$(which /bin/lsmod)
    if (( $? )); then
        echo "Sorry, there isn't lsmod in system"
        return
    fi
    if [ $# -eq 0 ]; then
        $LSMOD
    else
        case $1 in
        -h)
        $LSMOD -h
        ;;
        --help)
        $LSMOD --help
        ;;
        *)
        OLDIFS=$IFS
        IFS="|"
        $LSMOD | egrep "$*"
        IFS=$OLDIFS
        unset OLDIFS
      ;;
    esac
  fi
}

ipaddr() {
    ip addr show $1 | awk '/inet\>/ {print $2}'
}

aa_mod_parameters () {
    N=/dev/null;
    C=`tput op` O=$(echo -en "\n`tput setaf 2`>>> `tput op`");
    for mod in $(cat /proc/modules|cut -d" " -f1);
    do
        md=/sys/module/$mod/parameters;
        [[ ! -d $md ]] && continue;
        m=$mod;
        d=`modinfo -d $m 2>$N | tr "\n" "\t"`;
        echo -en "$O$m$C";
        [[ ${#d} -gt 0 ]] && echo -n " - $d";
        echo;
        for mc in $(cd $md; echo *);
        do
            de=`modinfo -p $mod 2>$N | grep ^$mc 2>$N|sed "s/^$mc=//" 2>$N`;
            echo -en "\t$mc=`cat $md/$mc 2>$N`";
            [[ ${#de} -gt 1 ]] && echo -en " - $de";
            echo;
        done;
    done
}

join() {
#---  FUNCTION  ----------------------------------------------------------------
#          NAME: join
#   DESCRIPTION: join arguments with first parameter as delimited
#    PARAMETERS: delimited elements to join separated by spaces(IFS)
#       RETURNS: -
#-------------------------------------------------------------------------------
    local IFS="$1"
    shift
    echo "$*"
}

enable-bracketed-mode() {
    printf "\e[?2004h"
}

disable-bracketed-mode() {
    printf "\e[?2004l"
}

lndir1() {
  fromdir=${1?Missing fromdir parameter}
  todir=${2?Missing todir parameter}
  abs=${fromdir%${fromdir#/}}

  find "$fromdir" \( -type f -o -type d \) | while read frompath ; do
    topath=${frompath#$fromdir}
    topath=${topath#/}
    [ -n "$topath" ] || topath="."
    if [ -f "$frompath" ] ; then
      if [ $abs ] ; then
        ln -sf "$frompath" "$todir/$topath"
      else
        old_IFS=$IFS
        IFS=/
        set -- $todir/$topath
        IFS=$old_IFS
        dots=""
        while [ $# -gt 0 ] ; do
          [ $1 = "." ] || dots="$dots../"
          shift
        done
        ln -sf "$dots$frompath" "$todir/$topath"
      fi
    else
      mkdir -p "$todir/$topath"
    fi
  done
}

killfg() {
    local PIDS=$(jobs -p)
    if [[ -n $PIDS ]]; then
        kill -9 $PIDS
    fi
}

