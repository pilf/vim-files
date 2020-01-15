#!/bin/sh

search="$1"

grepcmd="$(which ggrep >> /dev/null && printf 'ggrep' || printf 'grep')"
#echo "Using grep cmd '$grepcmd'"

lpass ls | $grepcmd "$search" | $grepcmd -Po '(?<=id: )[0-9]+' | xargs lpass show
