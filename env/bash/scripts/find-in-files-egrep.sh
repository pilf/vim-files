#!/bin/sh
#Usage: 
#   $ find-in-files-egrep.sh '*.js' 'my egrep pattern' ..

regex=${1:-.*}
namepattern=${2:-*}
path=${3:-.}

find $path -type f -name "$namepattern" -print0 | xargs -0 egrep "$regex"
