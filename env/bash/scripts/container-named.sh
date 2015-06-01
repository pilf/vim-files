#!/bin/bash

function get_docker_column_positions {
    headers=$(echo "$1" | head -n1)
    linewidth=$(echo "$1" | wc -L)

    echo "$1" \
            | head -n1 \
            | sed -e 's/CONTAINER ID/CONTAINER_ID/' \
            | grep -ob ' [^ ]' \
            | sed -e 's/:.*$//' \
            | awk -v lw="$linewidth" 'BEGIN { l=0 } { print $0-l; l=$0 } END { print lw-l }' \
            | tr "\\n" " " | sed -e "s/\(^.*\)\(.$\)/\1/"
}

raw=$(docker ps --filter="name=$1")
dataonly=$(echo "$raw" | tail -n+2)
linecount=$(echo "$dataonly" | wc -l)

if [ "$linecount" -gt 1 ]; then
    echo "More than one line, here are the options: " 1>&2
    fieldwidths=$(get_docker_column_positions "$raw") 
    echo "$dataonly" | awk "
        BEGIN { FIELDWIDTHS=\"$fieldwidths\" } 
        function rtrim(s) { sub(/[ \t\r\n]+$/, \"\", s); return s }
        { printf \"%s: %s\n\", rtrim(\$1), rtrim(\$7) }" 1>&2
    echo "<<undecidable>>"
else
    # only one option, print just the ID
    docker ps -q -a --filter="name=$1"
    printf '%s' "$output" 
fi


