#!/bin/sh

_run() {
    tr '\\' '/' | sed 's/^\(\(.\):\)\?/\/cygdrive\/\L\2/' | sed 's#//#/c/#' 
}

if [ -t 0 ]; then
    # when not in pipe mode.  (-t refers to pipe input, see: http://stackoverflow.com/questions/911168/how-to-detect-if-my-shell-script-is-running-through-a-pipe)    
    input="$*"
    if [ -z "$input" ]; then
        cat /dev/clipboard | _run
    else
        printf "%s" "$input" | _run
    fi 
else
    _run
fi 
