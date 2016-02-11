#!/bin/bash

input="$1"
prefix="${2:-tmpmdfile}"

if [ -z "$input" ] || [ ! -f "$input" ]; then
    cat <<EOF 1>&2
*** Error: Must provide a MD file
Usage: $0 <md file>
EOF
    exit 1
fi

tmpfile=$(mktemp -t "$prefix") 
mv $tmpfile $tmpfile.html

cat "$input" | marked > $tmpfile.html && open -b com.google.chrome $tmpfile.html || exit 1
