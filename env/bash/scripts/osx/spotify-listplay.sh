#!/bin/sh

search="$1"

savefile="$HOME/.spotify-list"

track=$(cat $savefile | grep -i "$search" | head -n1)

if [ ! -z "$track" ]; then
    printf "%s\n" "$(echo "$track" | sed 's/^.*|//')"
    printf "$track" | grep -o '^[^|]*' | xargs -I{} spotify play track \"{}\"
fi

