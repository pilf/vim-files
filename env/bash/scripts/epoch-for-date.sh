#!/bin/sh

# A utility for getting epoch date in both OS X and Linux

date="$1"

if [ -z "$date" ]; then
    cat <<EOF 
Usage provide a date in format 'YYYY-MM-DD mm:hh:ss'
e.g.
    $ epoch-for-date.sh '2015-01-01 11:20:00'
    1420111200
EOF
    exit 1
fi

date -j -f "%Y-%m-%d %T" "$date" "+%s" 2>/dev/null || date -d"$date" "+%s" 
