#!/bin/sh

search="$1"
lpass ls -l | grep "$search" | grep -Po '(?<=id: )[0-9]+' | xargs lpass show
