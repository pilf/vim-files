#!/bin/sh

search="$1"
lpass ls | grep "$search" | grep -Po '(?<=id: )[0-9]+' | xargs lpass show
