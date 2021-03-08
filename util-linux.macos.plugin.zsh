if [ -d /usr/local/opt/util-linux ]; then
    path=(/usr/local/opt/util-linux/bin $path)
    path=(/usr/local/opt/util-linux/sbin $path)

    LDFLAGS+="-L/usr/local/opt/util-linux/lib "
    CPPFLAGS+="-I/usr/local/opt/util-linux/include "

    PKG_CONFIG_PATH+="/usr/local/opt/util-linux/lib/pkgconfig:"
fi
