#!/bin/sh
osascript -e "tell application \"Spotify\" to set output to id of current track" | tr -d '\n' | xargs -0 printf '"%s"'
