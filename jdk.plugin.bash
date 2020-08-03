jdk() {
    version=$1
    export JAVA_HOME
    JAVA_HOME=$(/usr/libexec/java_home -v"$version");
    java -version
}
