#!/bin/sh

cmd="${*:-ls}"

# this is a hack, it seems that when assigning to variable it will strip trailing space
# I wanted to strip last \n
out=$($cmd | xargs -I{} printf "%s/%s\n" "$(pwd)" "{}" )
printf '%s' "$out" 
