appusage() {
    ps -A --sort -rss -o comm,rss | grep $1 | awk '{ sum+=$2 } END { print sum/1024 }'
}
