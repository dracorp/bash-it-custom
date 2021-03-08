path=(/usr/local/opt/openjdk/bin $path)
# TODO: -bash: -I/usr/local/opt/openjdk/include: No such file or directory
if [ -d /usr/local/opt/openjdk/include ]; then
    CPPFLAGS+="-I/usr/local/opt/openjdk/include "
fi
export JAVA_HOME="/usr/local/opt/openjdk"
