#!/usr/bin/env bash
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

count=$(docker_match_count "$cmd" "$pattern" )
case "$count" in
    "0") 
        echo "** ERROR ** No matching container" 1>&2
        exit 1
        ;;
    "1")
        match_printf_docker_columns "$cmd" "$pattern" '%s\n' 1
        ;;
    *)
        echo "** ERROR ** More than one possible container, found ($count): " 1>&2
        match_printf_docker_columns "$cmd" "$pattern" '%s (img:%s) %s\n' 1 2 5 1>&2
        echo "<<undecidable>>"  1>&2
        exit 1
        ;;
esac

