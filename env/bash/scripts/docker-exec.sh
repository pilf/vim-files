#!/bin/sh

dockername=$1
shift
docker exec -it $(docker ps -q -a --filter="name=$dockername") $@

