#!/bin/sh
#Usage: 
#   $ find-in-files-egrep.sh '*.js' 'my egrep pattern'
find . -type f -name "$1" -print0 | xargs -0 egrep "$2"
