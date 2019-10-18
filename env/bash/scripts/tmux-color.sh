#!/bin/sh

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
"today")
   bg="#4B4C4E"
   ;;
"toneq")
   bg="#231A21"
   ;;
"dark")
   bg="#231A21"
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
