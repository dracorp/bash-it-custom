_add2env PATH=+/usr/local/opt/libarchive/bin
export LDFLAGS="-L/usr/local/opt/libarchive/lib"
export CPPFLAGS="-I/usr/local/opt/libarchive/include"
export PKG_CONFIG_PATH
_add2env PKG_CONFIG_PATH /usr/local/opt/libarchive/lib/pkgconfig
# for opendrop: https://github.com/seemoo-lab/opendrop
export LIBARCHIVE=/usr/local/opt/libarchive/lib/libarchive.dylib
export LIBCRYPTO=/usr/local/opt/openssl@1.1/lib/libcrypto.dylib
