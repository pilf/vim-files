#!/bin/bash
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/docker_columns.inc.sh"

cmd="docker images"
printf_docker_columns "$cmd" 'ra: %s\n' 1
printf_docker_columns "$cmd" 'ra2: %s\n' 1

linecount=$(docker_match_count "$cmd")
echo $linecount
if [ "$linecount" -gt 1 ]; then
    echo "More than one line, here are the options: " 1>&2
    printf_docker_columns "$cmd" '%s: %s (%s)\n' 1 3 5
    echo "<<undecidable>>"
else
    # only one option, print just the ID
    docker ps -q --filter="name=$1"
    printf '%s' "$output" 
fi


