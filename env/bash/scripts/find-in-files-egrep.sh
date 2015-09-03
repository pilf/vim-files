#!/bin/bash

function usage {
cat << EOF
Usage: find-in-files-egrep.sh <regex> [ <file-pattern> [ <search-path> ] ]" >&2
  File pattern defaults to '*'
  Search path defaults to '.'
Example:
    find-in-files-egrep.sh '^[0-9]{2}:.*$' '*.log' '/logs' 
EOF
}

if [ -z "$1" ]; then
    echo Error, must supply at least one argument >&2
    usage >&2
    exit 1
fi

regex="$1"
namepattern="${2:-*}"
path="${3:-.}"

find $path -type f -name "$namepattern" -print0 | xargs -0 egrep "$regex"
