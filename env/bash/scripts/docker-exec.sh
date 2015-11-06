#!/bin/sh

dockername="$1"
cmd="${2:-bash}"

if [ -z "$dockername" ]; then
    cat >&2 <<EOF
** ERROR ** Missing parameter
Usage: docker-exec.sh container_name [cmd]

EOF
    exit 1
fi

container=$(container-named.sh $dockername 2> /dev/null)
if [ $? -eq 0  ]; then
    echo Logging into $container ...
    docker exec -it "$container" "$cmd"
    echo
else
    # run again to echo error reason
    container-named.sh $dockername
fi
