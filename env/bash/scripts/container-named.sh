#!/bin/bash
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/docker_columns.inc.sh"

docker_opts=
while getopts ":a" opt; do
    case $opt in
        a)
            docker_opts="--all"
            shift
            ;;
        \?)
            echo "Invalid option -$OPTARG" >&2
            ;;
    esac
done 

pattern="$*"
cmd="docker ps $docker_opts" 

count=$(docker_match_count "$cmd" "$pattern")
if [ "$count" -gt 1 ]; then
    echo "More than one possible container, found: " 1>&2
    match_printf_docker_columns "$cmd" "$pattern" '%s (%s) %s\n' 2 1 5 1>&2
    echo "<<undecidable>>" 
else
    match_printf_docker_columns "$cmd" "$pattern" '%s\n' 1
fi

