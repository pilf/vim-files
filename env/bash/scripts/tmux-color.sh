#!/bin/sh

defaultname=$(tmux display-message -p "#S")
name=${1:-$defaultname}

bg="#2C3230"
fg="#FFFFFF"
case $name in
"general")
   bg="#001943"
   ;;
"today")
   bg="#4B4C4E"
   ;;
"toneq")
   bg="#231A21"
   ;;
"scripts")
   bg="#1D1F1C"
   ;;
"careful")
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

tmux select-pane -t:. -P "bg=$bg,fg=$fg"
