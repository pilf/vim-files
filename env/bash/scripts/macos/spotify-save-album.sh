#!/usr/bin/env bash

sp_list_file="$HOME/.spotify-list"

sp_track_id=$(osascript -e "tell application \"Spotify\" to set output to id of current track" | tr -d '\n' | xargs -0 printf '"%s"' | sed 's/.*:\([^:"]*\)"/\1/')

sp_track_url="https://open.spotify.com/track/$sp_track_id"

#desc=$(curl -s "$sp_track_url" \
#    | sed 's/<![^>]*>//g' \
#    | xmlstarlet sel -t -v '//meta[@property="og:description"]/@content' \
#    | sed 's/\(.*\) · \(.*\) ·.*· \(.*\)/\2 · \1 (\3)/')

temp_file=$(mktemp)
curl -s "$sp_track_url" | sed 's/<![^>]*>//g' > "$temp_file"

desc=$(cat $temp_file | xmlstarlet sel -t -v '//meta[@property="og:description"]/@content' | sed 's/\(.*\) · \(.*\) ·.*· \(.*\)/\2 · \1 (\3)/')
#album_name=$(cat $temp_file | xmlstarlet sel -t -v '//meta[@property="og:title"]/@content')

sp_code=$(cat $temp_file | xmlstarlet sel -t -v '//meta[@name="music:album"]/@content' | sed 's|.*album/\(.*\)$|\1|')
#sp_code=$(echo $sp_albumurl | sed 's|.*/\([^/]*\)\?.*|\1|')

echo "spotify:album:$sp_code|$desc" >> "$sp_list_file"
sort "$sp_list_file" | uniq > "$temp_file"
mv "$temp_file" "${sp_list_file}"

