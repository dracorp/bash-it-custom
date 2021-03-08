if [ -d /usr/local/opt/gettext ]; then
    # gettext is keg-only, which means it was not symlinked into /usr/local,
    # because macOS provides the BSD gettext library & some software gets confused if both are in the library path.

    # If you need to have gettext first in your PATH run:
    path=(/usr/local/opt/gettext/bin $path)

    # For compilers to find gettext you may need to set:
    LDFLAGS+="-L/usr/local/opt/gettext/lib "
    CPPFLAGS+="-I/usr/local/opt/gettext/include "
fi
