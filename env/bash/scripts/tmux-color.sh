#!/bin/sh

# Usage:
#
#   tmux-color.sh [<scheme name> | -l | --list]
#
# Assumes you're in a Tmux session and attempts to read session name. 
# Searches for name in list of known schemes (e.g. 'blue') or if it
# multiword (seperated with dashes) then the last word is used
# e.g. 'myshell-dark' looks for 'dark' scheme.

if [ "$1" == "-l" ] || [ "$1" == "--list" ]; then
    cat $0 | grep '^".*)' | sed -e 's/"\(.*\)".*$/\1/' | sort
    exit 0
fi

defaultname=$(tmux display-message -p "#S" 2>/dev/null)
name=${1:-$defaultname}

stripped_name="$(printf "$name" | sed -n 's/^.*-\(.*\)$/\1/p')" 

search="$stripped_name"
if [ -z "$search" ]; then
    search="$name"
fi

bg="#2C3230"
fg="#FFFFFF"

#printf "Searching for name %s" "$stripped_name"

case $search in
"general")
   bg="#001943"
   ;;
"blue")
   bg="#001943"
   ;;
"today")
   bg="#221C35"
   ;;
"toneq")
   bg="#231A21"
   ;;
"dark")
   bg="#231A21"
   ;;
"purple")
   bg="#4A1AA1"
   fg="#61E061"
   ;;
"darkpurple")
   bg="#200645"
   fg="#71E071"
   ;;
"red")
   bg="#4A081A"
   ;;
"darkred")
   bg="#2A0008"
   fg="#FFE8E8"
   ;;
"darkgreen")
   bg="#082A1A"
   ;;
"darkblue")
   bg="#080A28"
   ;;
"scripts")
   bg="#1D1F1C"
   ;;
"careful")
    bg="#FFCCD1"
    fg="#4d4a4b"
    ;;
"red")
    bg="#FFCCD1"
    fg="#4d4a4b"
    ;;
"light")
    bg="#f1ebeb"
    fg="#24c0eb"
    ;;
"dark")
    bg="#0D0F0C"
    fg="#FFFFFF"
    ;;
*)
    bg="#DAFBF8"
    fg="#002222"
esac

tmux select-pane -t:. -P "bg=$bg,fg=$fg" 2>/dev/null
