# alias pacman-off='sudo pacman -b $CHROOT/var/lib/pacman --config $CHROOT/etc/pacman.conf --cachedir $CHROOT/var/cache/pacman/pkg --logfile $CHROOT/var/log/pacman/pacman.log'
# export CHROOT='/home/dracorp/Arch/pc'

alias makepkg='PKGDEST="$(echo $PWD)" LC_ALL=en_US.utf8 makepkg'
alias pacman='LC_ALL=en_US.utf8 pacman'
alias yaourt='LC_ALL=en_US.utf8 yaourt'
alias yay='LC_ALL=en_US.utf8 yay'
alias reflector-update='sudo reflector --verbose --country Poland -l 5 -p http --sort rate --save /etc/pacman.d/mirrorlist'
