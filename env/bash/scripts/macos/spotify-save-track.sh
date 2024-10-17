#!/bin/sh

savefile="$HOME/.spotify-list"

track_id=$(spotify set output to id of current track)
trackname=$(spotify set output to name of current track)
album=$(spotify set output to album of current track)
artist=$(spotify set output to artist of current track)

printf "%s|%s · %s (%s)\n" "$track_id" "$trackname" "$artist" "$album" >> "$savefile"

sort "$savefile" | uniq > "${savefile}_"
mv "${savefile}_" "$savefile"
