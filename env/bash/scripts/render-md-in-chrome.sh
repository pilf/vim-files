#!/bin/bash

mdfile="$1"
theme="${2:-github}"
echo $theme

if [ ! -f "$mdfile" ]; then
    cat <<EOF
*** ERROR: File "$mdfile" not found.
Usage:
    render-md-in-chrome.sh <file.md> [theme]

Uses https://github.com/mixu/markdown-styles
    - see for thumbnails for each style
    - styles: [ bootstrap3, github, jasonm23-dark, jasonm23-foghorn, jasonm23-markdown, jasonm23-swiss, markedapp-byword, mixu-book, mixu-bootstrap-2col, mixu-bootstrap, mixu-gray, mixu-page, mixu-radar, roryg-ghostwriter, thomasf-solarizedcssdark, thomasf-solarizedcsslight, witex ]

Examples:
    $ render-md-in-chrome.sh my-wonderful-file.md

Notes:
    - Opens in Chrome (because Outlook seems to respect it's rendering better than Firefox's
EOF
    exit 1
fi

filename_noext=$(echo "$mdfile" | sed -E 's,^(.*/)?([^/]*)\.[^.]*$,\2,g')
target="$filename_noext-output"
echo $filename_noext

generate-md --layout "$theme" --input "$mdfile" --output "$target"
open -a "/Applications/Google Chrome.app" "$target/$filename_noext.html" 


