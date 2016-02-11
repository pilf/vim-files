#!/bin/bash

input="$1"
theme="${2:-mixu-gray}" 
prefix="${3:-tmpmdfile}"

if [ -z "$input" ] || [ ! -f "$input" ]; then
    cat <<EOF 1>&2
*** Error: Must provide a MD file
Usage: $0 <md file> [theme]
EOF
    exit 1
fi

if ! command -v generate-md 2>&1 >/dev/null ;  then
    cat <<EOF 1>&2
*** Error: generate-md is not installed.
    Can be installed via npm -- so node is required too:
    $ sudo npm install -g markdown-styles
Usage: $0 <md file> [theme]
EOF
    exit 2
fi

tmpname="$(mktemp -dt "$prefix")"
mv "$tmpname" "$tmpname.html"

generate-md --input "$input" --layout "$theme" --output "$tmpname/" 
htmlfile="$tmpname/$(basename "$input" | cut -f1 -d'.').html"

if [ "$(uname -s)" == "Darwin" ]; then
    open -b com.google.chrome "$htmlfile" || exit 1
else
    printf "Not on a MAC, here's the file you're looking for: \n\t%s" $htmlfile
fi

