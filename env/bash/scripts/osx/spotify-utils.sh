#!/bin/sh

while getopts ":c:s:p?" opt; do
    case $opt in
        t)
            # e.g. $ $0 -t2zb8Cl1owklGYsyTN6k5rM
            spotify play track "\"spotify:user:sphere37:playlist:$OPTARG\"" 
            ;;
        p)
            spotify pause
            
            ;;
        s)
spotify play track \"spotify:user:sphere37:playlist:2zb8Cl1owklGYsyTN6k5rM\"
spotify play track \"spotify:user:sphere37:playlist:2zb8Cl1owklGYsyTN6k5rM\"
