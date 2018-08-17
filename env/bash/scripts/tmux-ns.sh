#!/bin/sh
name="$1"
if ! tmux has-session -t "$name" 2>/dev/null; then
    tmux new-session -d bash 
    tmux rename-session -t $(tmux list-session -F "#S" | grep '^[0-9]*$' | awk '{printf "%05d\n", $1}' | sort | head -n1 | sed s/^0*//) $name
fi
tmux-color.sh "$name"
tmux switch -t "$name"
