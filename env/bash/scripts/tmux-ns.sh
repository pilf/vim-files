#!/bin/sh
name="$1"
tmux new-session -d bash
tmux rename-session -t $(tmux list-session -F "#S" | grep '^[0-9]*$' | awk '{printf "%05d\n", $1}' | sort | head -n1 | sed s/^0*//) $name
tmux-color.sh $name
tmux switch -t $name
