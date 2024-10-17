#!/usr/bin/env bash

sp_albumurl=$(pbpaste)

if ! grep -q "open.spotify.com" <<< "$sp_albumurl"; then
    echo "The clipboard did not contain a recogonised spotify URL"
    exit 1
fi

temp_file=$(mktemp)
curl -s "$sp_albumurl" | sed 's/<![^>]*>//g' > "$temp_file"

desc=$(cat $temp_file | xmlstarlet sel -t -v '//meta[@property="og:description"]/@content')
album_name=$(cat $temp_file | xmlstarlet sel -t -v '//meta[@property="og:title"]/@content')
sp_code=$(echo $sp_albumurl | sed 's|.*/\([^/]*\)\?.*|\1|')

echo "spotify:album:$sp_code|$desc -- $album_name" >> ~/.spotify-list

rm "$temp_file"

