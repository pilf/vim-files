#!/bin/sh

defaultname=$(tmux display-message -p "#S")
name=${1:-$defaultname}
stripped_name="$(printf $name | sed -n 's/^.*-\(.*\)$/\1/p')" 

bg="#2C3230"
fg="#FFFFFF"
case $stripped_name in
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
*)
    bg="#DAFBF8"
    fg="#002222"
esac

tmux select-pane -t:. -P "bg=$bg,fg=$fg"
