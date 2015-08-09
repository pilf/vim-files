#!/bin/bash
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/docker_columns.inc.sh"

pattern="$*"
cmd="docker ps --all"

count=$(docker_match_count "$cmd" "$pattern")
if [ "$count" -gt 1 ]; then
    echo "More than one possible container, found: " 1>&2
    match_printf_docker_columns "$cmd" "$pattern" '%s (%s) %s\n' 2 1 4 1>&2
    echo "<<undecidable>>" 
else
    match_printf_docker_columns "$cmd" "$pattern" '%s\n' 1 1>&2 
fi

