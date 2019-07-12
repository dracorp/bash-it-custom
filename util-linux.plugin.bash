_add2env PATH=+"/usr/local/opt/util-linux/bin:$PATH"
_add2env PATH=+"/usr/local/opt/util-linux/sbin:$PATH"

_add2env LDFLAGS "-L/usr/local/opt/util-linux/lib" " "
_add2env CPPFLAGS "-I/usr/local/opt/util-linux/include" " "

_add2env PKG_CONFIG_PATH "/usr/local/opt/util-linux/lib/pkgconfig"
