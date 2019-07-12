# gettext is keg-only, which means it was not symlinked into /usr/local,
# because macOS provides the BSD gettext library & some software gets confused if both are in the library path.

# If you need to have gettext first in your PATH run:
_add2env PATH "/usr/local/opt/gettext/bin"

# For compilers to find gettext you may need to set:
_add2env LDFLAGS "-L/usr/local/opt/gettext/lib" " "
_add2env CPPFLAGS "-I/usr/local/opt/gettext/include" " "
