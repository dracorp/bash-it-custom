path=(/usr/local/opt/libarchive/bin $path)
LDFLAGS+="-L/usr/local/opt/libarchive/lib "
CPPFLAGS+="-I/usr/local/opt/libarchive/include "
PKG_CONFIG_PATH+=/usr/local/opt/libarchive/lib/pkgconfig
# for opendrop: https://github.com/seemoo-lab/opendrop
export LIBARCHIVE=/usr/local/opt/libarchive/lib/libarchive.dylib
export LIBCRYPTO=/usr/local/opt/openssl@1.1/lib/libcrypto.dylib
