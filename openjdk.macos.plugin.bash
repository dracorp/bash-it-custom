# _add2env PATH=+"/usr/local/opt/openjdk/bin"
# # TODO: -bash: -I/usr/local/opt/openjdk/include: No such file or directory
# if [ -d /usr/local/opt/openjdk/include ]; then
#     _add2env CPPFLAGS "-I/usr/local/opt/openjdk/include" " "
# fi
# export JAVA_HOME="/usr/local/opt/openjdk"

_add2env PATH=+"/usr/local/opt/openjdk@17/bin"
export JAVA_HOME="/usr/local/opt/openjdk@17"
