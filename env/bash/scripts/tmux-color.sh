#!/bin/sh

defaultname=$(tmux display-message -p "#S")
name=${1:-$defaultname}
bg="#2C3230"
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
esac

tmux select-pane -t "$name" -P "bg=$bg"
