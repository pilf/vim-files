#!/bin/sh

if [ -t 1 ]; then
    read dockername
    echo "Searching for $dockername"
    container=$(container-named.sh $dockername)
    bash -c "docker exec -t $container $@"
else
    echo "Well then"
    dockername=$1
    shift
    container=$(container-named.sh $dockername)
    docker exec -it $container $@ 
fi

