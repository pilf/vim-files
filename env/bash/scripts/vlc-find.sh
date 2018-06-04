#!/bin/sh

# usage: vlc-find [find options]
# example: vlc-find -type '*.mp4'

find . -type f $@ \
    | sed -e 's#^.*cygdrive/c/\(.*\)$#c:/\1#' -e 's#\\#/#g' -e 's#\(.*\)#"\1"#' \
    | awk '{print} END {print "vlc://quit"}' \
    | tr '\n' ' ' \
    | xargs vlc -f --no-qt-error-dialogs
