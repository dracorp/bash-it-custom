if [ -d /usr/local/opt/util-linux ]; then
    _add2env PATH=+"/usr/local/opt/util-linux/bin"
    _add2env PATH=+"/usr/local/opt/util-linux/sbin"

    _add2env LDFLAGS "-L/usr/local/opt/util-linux/lib" " "
    _add2env CPPFLAGS "-I/usr/local/opt/util-linux/include" " "

    _add2env PKG_CONFIG_PATH "/usr/local/opt/util-linux/lib/pkgconfig"
fi
