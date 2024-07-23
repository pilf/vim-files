#!/usr/bin/env bash
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/docker_columns.inc.sh"

pattern="$*"
cmd="docker images"

count=$(docker_match_count "$cmd" "$pattern")
if [ "$count" -gt 1 ]; then
    echo "More than one possible image, found: " 1>&2 
    match_printf_docker_columns "$cmd" "$pattern" '%s:%s (%s %s)\n' 1 2 5 4 1>&2
    echo "<<undecidable>>" 
else
    match_printf_docker_columns "$cmd" "$pattern" '%s\n' 3 1>&2 
fi

